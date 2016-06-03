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

            string str = sr.ReadToEnd();
            sr.Close();
            int j = str.IndexOf('\n');
            while (j != -1)
            {
                str = str.Remove(j, 1);
                j = str.IndexOf('\n');

            }

            string[] split = str.Split(new char[] { '\r' });

            int length = split.Length;
            for (int i = 1; i < length - 1; i++)//如果split数组中有一行是空,将它的上下两行合并,数组长度减2，若头尾两行为空,干脆舍去不要(不再合并)
            {
                if (split[i] == "")
                {
                    split[i - 1] = split[i - 1] + split[i + 1];
                    for (int q = i; q < length - 2; q++)
                        split[q] = split[q + 2];
                    length = length - 2;
                }
            }

            SqlHelper helper = new SqlHelper();

            int a, b, existCount = 0, successCount = 0, failedCount = 0;
            for (int i = 0; i < length - 1; i++)
            {
                try
                {
                    var lineStr = split[i];
                    var ip = lineStr.Substring(0, lineStr.IndexOf("- -")).Trim();
                    a = split[i].IndexOf('[');
                    b = split[i].IndexOf(']');
                    var dateStr = lineStr.Substring(a + 1, b - a - 1).Trim();
                    dateStr = dateStr.Split(new char[] { ' ' })[0];
                    dateStr = dateStr.Insert(dateStr.IndexOf(':'), " ");
                    dateStr = dateStr.Remove(dateStr.IndexOf(':'), 1);

                    a = split[i].IndexOf('"');
                    b = split[i].LastIndexOf('"');
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
                        RequestUrl = url,
                        ResponseStatus = status,
                        ResponseDataSize = size,
                        Duration = duration
                    };
                    if (helper.IsExist(model))
                    {
                        existCount++;
                        if (existCount % 10 == 0)
                        {
                            Console.WriteLine("已存在个数：" + existCount);
                        }
                        continue;
                    }
                    if (helper.Create(model))
                    {
                        successCount++;
                        if (successCount%10 == 0)
                        {
                            Console.WriteLine("解析成功个数：" + successCount);
                        }
                    }
                    else
                    {
                        failedCount++;
                        if (failedCount % 10 == 0)
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
            Console.WriteLine();

            Console.WriteLine("解析成功个数：" + successCount);
            Console.WriteLine("解析失败个数：" + failedCount);
            Console.WriteLine("已存在个数：" + existCount);
            Console.ReadLine();
        }
    }
}
