using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LogForJAnalyse
{
    public class LogModel
    {
        public string LogId { get; set; }
        public DateTime LogTime { get; set; }
        public int LogLevel { get; set; }
        public string Message { get; set; }
        public string FileName { get; set; }
        public int Line { get; set; }
    }
}
