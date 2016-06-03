using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TomcatLog
{
    public class TomcatAccessModel
    {
        public string TomcatAccessId { get; set; }
        public string Ip { get; set; }
        public DateTime RequestTime { get; set; }
        public string RequestUrl { get; set; }
        public string ResponseStatus { get; set; }
        public int ResponseDataSize { get; set; }
        public double Duration { get; set; }
    }
}
