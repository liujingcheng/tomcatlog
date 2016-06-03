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
            var filename = args[1];
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

            int a, b;
            for (int i = 0; i < length - 1; i++)
            {
                var lineStr = split[i];
                var ip = lineStr.Substring(0, lineStr.IndexOf("- -")).Trim();
                a = split[i].IndexOf('[');
                b = split[i].IndexOf(']');
                var date = lineStr.Substring(a, b - a + 1).Trim();

                a = split[i].IndexOf('"');
                b = split[i].LastIndexOf('"');
                var url = lineStr.Substring(a, b - a + 1).Trim();

                var lastStr = lineStr.Substring(b, lineStr.Length-b-1).Trim();
                var lastStrs = lastStr.Split(new char[] { ' ' });
                var status = lastStrs[0].Trim();
                var size = lastStrs[1].Trim();
                var duration = lastStrs[2].Trim();


            }
        }
    }
}
