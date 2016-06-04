using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace TomcatLog
{
    class Program
    {
        static void Main(string[] args)
        {
            var filename = args[0];
            //var filename = @"D:\test1.txt";
            var rFile = new FileStream(filename, FileMode.Open);
            var sr = new StreamReader(rFile, Encoding.GetEncoding("gb2312"));//读取中文简体编码GB2312

            SqlHelper helper = new SqlHelper();

            int a, b, existCount = 0, successCount = 0, failedCount = 0, updateConcurrencyCount=0,updateConcurrencyFailedCount = 0;
            while (!sr.EndOfStream)
            {
                string lineStr = sr.ReadLine();
                if (string.IsNullOrWhiteSpace(lineStr))
                {
                    continue;
                }

                try
                {
                    var ip = lineStr.Substring(0, lineStr.IndexOf("- -")).Trim();
                    a = lineStr.IndexOf('[');
                    b = lineStr.IndexOf(']');
                    var dateStr = lineStr.Substring(a + 1, b - a - 1).Trim();
                    dateStr = dateStr.Split(new char[] { ' ' })[0];
                    dateStr = dateStr.Insert(dateStr.IndexOf(':'), " ");
                    dateStr = dateStr.Remove(dateStr.IndexOf(':'), 1);

                    a = lineStr.IndexOf('"');
                    b = lineStr.LastIndexOf('"');
                    var url = lineStr.Substring(a + 1, b - a - 1).Trim();

                    var lastStr = lineStr.Substring(b + 1, lineStr.Length - b - 1).Trim();
                    var lastStrs = lastStr.Split(new char[] { ' ' });
                    var status = lastStrs[0].Trim();
                    var sizeStr = lastStrs[1].Trim();
                    var durationStr = lastStrs[2].Trim();

                    var date = Convert.ToDateTime(dateStr);
                    var size = Convert.ToInt64(sizeStr);
                    var duration = Convert.ToDouble(durationStr);

                    var model = new TomcatAccessModel()
                    {
                        TomcatAccessId = Guid.NewGuid().ToString().Replace("-", ""),
                        Ip = ip,
                        RequestTime = date,
                        Concurrency = 1,
                        RequestUrl = url,
                        ResponseStatus = status,
                        ResponseDataSize = size,
                        Duration = duration
                    };
                    if (helper.IsConcurrentSameRecord(model))
                    {
                        updateConcurrencyCount++;
                        if (updateConcurrencyCount % 100 == 0)
                        {
                            Console.WriteLine("更新并发数个数：" + updateConcurrencyCount);
                        }
                        if (!helper.UpdateConcurrentModel(model))
                        {
                            updateConcurrencyFailedCount++;
                            if (updateConcurrencyFailedCount % 100 == 0)
                            {
                                Console.WriteLine("更新并发数失败个数：" + updateConcurrencyFailedCount);
                            }
                        }
                        continue;
                    }
                    if (helper.Create(model))
                    {
                        successCount++;
                        if (successCount % 100 == 0)
                        {
                            Console.WriteLine("解析成功个数：" + successCount);
                        }
                    }
                    else
                    {
                        failedCount++;
                        if (failedCount % 100 == 0)
                        {
                            Console.WriteLine("解析失败个数：" + failedCount);
                        }
                    }
                }
                catch (Exception ex)
                {
                    failedCount++;
                    Console.WriteLine(ex.Message);
                }
            }
            sr.Close();

            Console.WriteLine();
            Console.WriteLine("解析成功个数：" + successCount);
            Console.WriteLine("解析失败个数：" + failedCount);
            Console.WriteLine("更新并发数个数：" + updateConcurrencyCount);
            Console.WriteLine("更新并发数失败个数：" + updateConcurrencyFailedCount);
            Console.WriteLine("已存在个数：" + existCount);
            Console.ReadLine();
        }
    }
}
