using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;

namespace TomcatLog
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("请确保要解析的tomcat日志文件在当前目录下且是以txt为后缀名！");
            var currentDir = System.AppDomain.CurrentDomain.BaseDirectory;
            var dirInfo = new DirectoryInfo(currentDir);
            var logFiles = dirInfo.GetFiles("*.txt");
            foreach (var logFile in logFiles)
            {
                AnalysisLogFile(logFile.FullName);
            }

            Console.WriteLine();
            Console.WriteLine("所有文件解析完毕");
            Console.ReadLine();

        }

        static void AnalysisLogFile(string filePath)
        {
            Console.WriteLine();
            Console.WriteLine("开始解析文件：" + filePath);

            var fileInfo = new FileInfo(filePath);
            if (!fileInfo.Exists)
            {
                Console.WriteLine("文件不存在：" + filePath);
                return;
            }

            var fileName = fileInfo.Name;
            if (!fileName.Contains("access_log"))
            {
                Console.WriteLine("该文件名因为没有包含_access_log_关键字可能无法解析，已被忽略：" + fileName);
                return;
            }

            SqlHelper sqlHelper = new SqlHelper();
            if (sqlHelper.IsFileHasAnalysised(fileName))
            {
                Console.WriteLine("该文件已被解析过，若要重新解析请先删除老数据：" + fileName);
                return;
            }

            var rFile = new FileStream(filePath, FileMode.Open);
            var sr = new StreamReader(rFile, Encoding.GetEncoding("gb2312"));//读取中文简体编码GB2312

            int line = 0;

            int a, b, existCount = 0, successCount = 0, failedCount = 0, updateConcurrencyCount = 0, updateConcurrencyFailedCount = 0;
            while (!sr.EndOfStream)
            {
                string lineStr = sr.ReadLine();
                line++;
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
                    var date = Convert.ToDateTime(dateStr);
                    var size = Convert.ToInt64(sizeStr);
                    double duration = 0;
                    if (lastStrs.Length > 2)
                    {
                        var durationStr = lastStrs[2].Trim();
                        Convert.ToDouble(durationStr);
                    }

                    var model = new TomcatAccessModel()
                    {
                        TomcatAccessId = Guid.NewGuid().ToString().Replace("-", ""),
                        Ip = ip,
                        RequestTime = date,
                        //Concurrency = 1,
                        RequestUrl = url,
                        ResponseStatus = status,
                        ResponseDataSize = size,
                        Duration = duration,
                        FileName = fileName,
                        Line = line
                    };
                    //if (sqlHelper.IsConcurrentSameRecord(model))
                    //{
                    //    updateConcurrencyCount++;
                    //    if (updateConcurrencyCount % 100 == 0)
                    //    {
                    //        Console.WriteLine("更新并发数个数：" + updateConcurrencyCount);
                    //    }
                    //    if (!sqlHelper.UpdateConcurrentModel(model))
                    //    {
                    //        updateConcurrencyFailedCount++;
                    //        if (updateConcurrencyFailedCount % 100 == 0)
                    //        {
                    //            Console.WriteLine("更新并发数失败个数：" + updateConcurrencyFailedCount);
                    //        }
                    //    }
                    //    continue;
                    //}
                    if (sqlHelper.Create(model))
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

            Console.WriteLine("解析成功个数：" + successCount);
            Console.WriteLine("解析失败个数：" + failedCount);
            Console.WriteLine("更新并发数个数：" + updateConcurrencyCount);
            Console.WriteLine("更新并发数失败个数：" + updateConcurrencyFailedCount);
            Console.WriteLine("已存在个数：" + existCount);
            Console.WriteLine("文件解析完毕：" + filePath);
        }

        static void InitLog4Net()
        {
            //初始化系统日志
            var path = AppDomain.CurrentDomain.SetupInformation.ApplicationBase +
                       ConfigurationManager.AppSettings["log4net"];
            var fi = new System.IO.FileInfo(path);
            if (fi.Exists)
            {
                log4net.Config.XmlConfigurator.Configure(fi);
            }
        }
    }
}
