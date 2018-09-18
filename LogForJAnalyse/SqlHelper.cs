using System;
using System.Collections.Generic;
using System.Linq;
using Common;
using Dapper;

namespace LogForJAnalyse
{
    public class SqlHelper
    {
        public List<LogModel> GetList()
        {
            var list = new List<LogModel>();
            string sql = "select * from LogForJ";
            using (var context = DataBaseConnection.GetSqlServerConnection())
            {
                list = context.Query<LogModel>(sql).ToList();//Query()方法可以从数据库里查询到信息，返回一个对象集合，来填充我们定义的业务对象模型
                context.Dispose();
            }

            return list;
        }
        public bool Create(LogModel model)
        {
            bool result = false;
            string sql =
                @"insert into LogForJ (LogTime,LogLevel,Message,FileName,Line,CreatedOn) values(@LogTime,@LogLevel,@Message,@FileName,@Line,@CreatedOn)";
            var paras = new DynamicParameters();
            paras.Add("LogTime", model.LogTime);
            paras.Add("LogLevel", model.LogLevel);
            paras.Add("Message", model.Message);
            paras.Add("FileName", model.FileName);
            paras.Add("Line", model.Line);
            paras.Add("CreatedOn", DateTime.Now);
            using (var context = DataBaseConnection.GetSqlServerConnection())
            {
                var affectrow = context.Execute(sql, paras);
                result = affectrow == 1;
                context.Dispose();
            }

            return result;
        }

        /// <summary>
        /// 文件是否已被解析过了
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public bool IsFileHasAnalysised(string fileName)
        {
            var sql = @"select count(1) from LogForJ where FileName=@FileName";
            var paras = new DynamicParameters();
            paras.Add("FileName", fileName);
            using (var context = DataBaseConnection.GetSqlServerConnection())
            {
                var count = context.Query<int>(sql, paras).First();
                return count > 0;
            }
        }

    }
}