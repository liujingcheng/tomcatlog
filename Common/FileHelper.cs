using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common
{
    public class FileHelper
    {
        public static string GetUTF8String(byte[] buffer)
        {
            if (buffer == null)
                return null;

            if (buffer.Length <= 3)
            {
                return Encoding.UTF8.GetString(buffer);
            }

            byte[] bomBuffer = new byte[] { 0xef, 0xbb, 0xbf };

            if (buffer[0] == bomBuffer[0]
                && buffer[1] == bomBuffer[1]
                && buffer[2] == bomBuffer[2])
            {
                return new UTF8Encoding(false).GetString(buffer, 3, buffer.Length - 3);
            }

            return Encoding.UTF8.GetString(buffer);
        }

        /// <summary>
        /// 是否有utf8 bom 头
        /// </summary>
        /// <param name="buffer">byte数组</param>
        /// <returns></returns>
        public static bool HasUtf8BomHeard(byte[] buffer)
        {
            if (buffer == null)
            {
                return false;
            }

            if (buffer.Length < 3)
            {
                return false;
            }

            byte[] bomBuffer = new byte[] { 0xef, 0xbb, 0xbf };

            if (buffer[0] == bomBuffer[0]
                && buffer[1] == bomBuffer[1]
                && buffer[2] == bomBuffer[2])
            {
                return true;
            }

            return false;
        }
    }
}
