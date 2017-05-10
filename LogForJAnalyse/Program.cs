using System;
using System.IO;
using System.Text;
using Common;

namespace LogForJAnalyse
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("请确保要解析的日志文件在当前目录下且包含.log.！");
            var currentDir = System.AppDomain.CurrentDomain.BaseDirectory;
            var dirInfo = new DirectoryInfo(currentDir);
            var logFiles = dirInfo.GetFiles("*.log*");
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
            //if (!fileName.Contains("alibaba.druid.filter.logging.Log4jFilter"))
            //{
            //    Console.WriteLine("该文件名因为没有包含alibaba.druid.filter.logging.Log4jFilter关键字可能无法解析，已被忽略：" + fileName);
            //    return;
            //}

            SqlHelper sqlHelper = new SqlHelper();
            if (sqlHelper.IsFileHasAnalysised(fileName))
            {
                Console.WriteLine("该文件已被解析过，若要重新解析请先删除老数据：" + fileName);
                return;
            }

            var rFile = new FileStream(filePath, FileMode.Open);
            var sr = new StreamReader(rFile, Encoding.GetEncoding("utf-8"));//读取中文简体编码GB2312

            int line = 0;
            int logStartLine = 0;
            int a, b, successCount = 0, failedCount = 0;
            DateTime logTime = DateTime.MinValue;
            int logLevel = 0;
            string message = null;

            while (!sr.EndOfStream)
            {
                string lineStr = sr.ReadLine();
                line++;
                try
                {
                    if (string.IsNullOrWhiteSpace(lineStr))
                    {
                        if (message == null)
                        {
                            continue;
                        }

                        var model = new LogModel()
                        {
                            LogTime = logTime,
                            Message = message,
                            LogLevel = logLevel,
                            FileName = fileName,
                            Line = logStartLine
                        };
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

                        message = null;
                        continue;
                    }

                    DateTime tempLogTime;
                    if (DateTime.TryParse(lineStr, out tempLogTime))
                    {
                        logTime = tempLogTime;
                        logStartLine = line;
                        continue;
                    }

                    if (lineStr.Contains("-[Thread:"))
                    {
                        a = lineStr.IndexOf('[');
                        b = lineStr.IndexOf(']');
                        var levelStr = lineStr.Substring(a + 1, b - a - 1).Trim();
                        logLevel = (int)LogLevelHelper.GetLevelByStr(levelStr);
                        continue;
                    }

                    message += lineStr + Environment.NewLine;
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
            Console.WriteLine("文件解析完毕：" + filePath);
        }
    }
}
