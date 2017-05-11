using System;
using System.IO;
using System.Threading.Tasks;

namespace Common
{
    /// <summary>  
    /// LogHelper的摘要说明。
    /// </summary>   
    public class LogHelper
    {
        private LogHelper()
        {
        }

        /// <summary>
        /// 静态只读实体对象info信息
        /// </summary>
        public static readonly log4net.ILog Loginfo = log4net.LogManager.GetLogger("loginfo");

        /// <summary>
        ///  静态只读实体对象error信息
        /// </summary>
        public static readonly log4net.ILog Logerror = log4net.LogManager.GetLogger("logerror");

        /// <summary>
        /// 默认加载配置文件信息
        /// </summary>
        public static void SetConfig()
        {
            log4net.Config.XmlConfigurator.Configure();
        }

        /// <summary>
        /// 根据文件加载配置信息
        /// </summary>
        /// <param name="configFile"></param>
        public static void SetConfig(FileInfo configFile)
        {
            log4net.Config.XmlConfigurator.Configure(configFile);
        }

        /// <summary>
        /// 添加异常信息
        /// </summary>
        /// <param name="info">要记录的内容</param>
        /// <param name="ex">异常</param>
        public static void WriteLog(string info, Exception ex = null)
        {
            Task.Factory.StartNew(() =>
            {
                if (Logerror.IsErrorEnabled)
                {
                    if (ex == null)
                    {
                        Loginfo.Info(info);
                    }
                    else
                    {
                        Logerror.Error(info, ex);
                    }
                }
            });
        }
    }
}