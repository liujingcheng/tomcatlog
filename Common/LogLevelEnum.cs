using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common
{
    public enum LogLevelEnum
    {
        Fatal = 0,
        Error = 3,
        Warn = 4,
        Info = 5,
        Debug = 6,
        Trace = 7
    }

    public static class LogLevelHelper
    {
        public static LogLevelEnum GetLevelByStr(string levelStr)
        {
            switch (levelStr)
            {
                case "ERROR":
                    return LogLevelEnum.Error;
                case "DEBUG":
                    return LogLevelEnum.Debug;
                case "INFO":
                    return LogLevelEnum.Info;
                case "WARN":
                    return LogLevelEnum.Warn;
                case "TRACE":
                    return LogLevelEnum.Trace;
                default:
                    return LogLevelEnum.Fatal;
            }
        }
    }
}
