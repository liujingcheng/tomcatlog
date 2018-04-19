using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using Common;
using Microsoft.SqlServer.Server;

namespace RemoveUtfBom
{
    class Program
    {
        static void Main(string[] args)
        {
            InitLog4Net();

            const string tempDirName = "temp";

            //var currentDir = System.AppDomain.CurrentDomain.BaseDirectory;
            var dirInfo = new DirectoryInfo(args[0]);
            var files = dirInfo.GetFiles("*.java", SearchOption.AllDirectories);

            if (dirInfo.Parent == null)
            {
                Console.WriteLine("指定的目录必须要用一个父目录！");
                return;
            }

            var tempDirPath = Path.Combine(dirInfo.Parent.FullName, tempDirName);
            if (!Directory.Exists(tempDirPath))
            {
                Directory.CreateDirectory(tempDirPath);
            }

            Console.WriteLine("开始分析源文件是否有BOM头...");
            foreach (var file in files)
            {
                AnalysisFiles(file.FullName, file.FullName.Replace(dirInfo.FullName, tempDirPath + "\\"));
            }
            Console.WriteLine("所有源文件去BOM头完毕！");
        }

        static void AnalysisFiles(string sourceFileFullName, string destFileFullName)
        {
            //Console.WriteLine();
            //Console.WriteLine("开始分析文件：" + sourceFileFullName);

            FileInfo fileInfo = new FileInfo(sourceFileFullName);

            byte[] buffer = new byte[3];
            try
            {
                var destFileInfo = new FileInfo(destFileFullName);
                if (destFileInfo.Exists)
                {
                    destFileInfo.Delete();
                }

                var fs = new FileStream(sourceFileFullName, FileMode.Open);
                var dirPath = Path.GetDirectoryName(destFileFullName);
                if (dirPath != null && !Directory.Exists(dirPath))
                {
                    Directory.CreateDirectory(dirPath);
                }

                fs.Read(buffer, 0, buffer.Length);
                fs.Close();

                if (FileHelper.HasUtf8BomHeard(buffer))
                {
                    TransferToNoneBomFile(sourceFileFullName, destFileFullName);
                }
                else
                {
                    fileInfo.CopyTo(destFileFullName, true);
                }
                fs.Dispose();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                LogHelper.WriteLog(ex.Message, ex);
            }

            //Console.WriteLine("文件分析完毕：" + sourceFileFullName);
        }

        /// <summary>
        /// 将文件转成utf8无bom文件
        /// </summary>
        /// <param name="sourceFileFullName">源文件全路径</param>
        /// <param name="destFileFullName">目文件全路径</param>
        static void TransferToNoneBomFile(string sourceFileFullName, string destFileFullName)
        {
            try
            {
                FileStream fs1 = new FileStream(sourceFileFullName, FileMode.Open, FileAccess.Read, FileShare.Read);
                FileStream fs2 = new FileStream(destFileFullName, FileMode.Create, FileAccess.Write, FileShare.None);
                byte[] buffer = new byte[3];
                int readedCount = fs1.Read(buffer, 0, 3);//过滤掉前3个字节
                if (readedCount < 3)
                {
                    LogHelper.WriteLog("该文件小于3个字节，无需转换！" + sourceFileFullName);
                    return;
                }

                const int rbuffer = 1024;
                byte[] farr = new byte[rbuffer];
                readedCount = fs1.Read(farr, 0, rbuffer);
                while (readedCount != 0) //返回0表示读完
                {
                    fs2.Write(farr, 0, readedCount);
                    readedCount = fs1.Read(farr, 0, rbuffer);
                }

                fs1.Close();
                fs2.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                LogHelper.WriteLog(ex.Message, ex);
            }
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
