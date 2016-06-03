using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;

namespace TomcatLog
{
    /// <summary>
    /// 从配置文件中读取连接字符串 Add By Chen Yafei 2016-5-04
    /// </summary>
    public class DataBaseConnection
    {
        public static DbConnection GetSqlServerConnection()
        {
            var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlconstr"].ConnectionString);
            conn.Open();
            return conn;
        }
    }
}