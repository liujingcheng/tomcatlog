using System.Collections.Generic;
using System.Linq;
using Dapper;

namespace TomcatLog
{
    public class SqlHelper
    {
        public List<TomcatAccessModel> GetList()
        {
            var list = new List<TomcatAccessModel>();
            string sql = "select * from TomcatAccess";
            using (var context = DataBaseConnection.GetSqlServerConnection())
            {
                list = context.Query<TomcatAccessModel>(sql).ToList();//Query()方法可以从数据库里查询到信息，返回一个对象集合，来填充我们定义的业务对象模型
                context.Dispose();
            }

            return list;
        }
        public bool Create(TomcatAccessModel model)
        {
            bool result = false;
            string sql = @"insert into TomcatAccess (TomcatAccessId,Ip,RequestTime,Concurrency,RequestUrl,ResponseStatus,ResponseDataSize,Duration,FileName,Line) 
values(@TomcatAccessId,@Ip,@RequestTime,@Concurrency,@RequestUrl,@ResponseStatus,@ResponseDataSize,@Duration,@FileName,@Line)";
            var paras = new DynamicParameters();
            paras.Add("TomcatAccessId", model.TomcatAccessId);
            paras.Add("Ip", model.Ip);
            paras.Add("RequestTime", model.RequestTime);
            paras.Add("Concurrency", model.Concurrency);
            paras.Add("RequestUrl", model.RequestUrl);
            paras.Add("ResponseStatus", model.ResponseStatus);
            paras.Add("ResponseDataSize", model.ResponseDataSize);
            paras.Add("Duration", model.Duration);
            paras.Add("FileName", model.FileName);
            paras.Add("Line", model.Line);
            using (var context = DataBaseConnection.GetSqlServerConnection())
            {
                var affectrow = context.Execute(sql, paras);
                result = affectrow == 1;
                context.Dispose();
            }

            return result;
        }

        /// <summary>
        /// 是一个并发的相同记录
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool IsConcurrentSameRecord(TomcatAccessModel model)
        {
            var sql = @"select count(TomcatAccessId) from TomcatAccess where 
Ip=@Ip and RequestTime=@RequestTime and RequestUrl=@RequestUrl and ResponseStatus=@ResponseStatus and ResponseDataSize=@ResponseDataSize and Duration=@Duration and FileName=@FileName";
            var paras = new DynamicParameters();
            paras.Add("Ip", model.Ip);
            paras.Add("RequestTime", model.RequestTime);
            paras.Add("RequestUrl", model.RequestUrl);
            paras.Add("ResponseStatus", model.ResponseStatus);
            paras.Add("ResponseDataSize", model.ResponseDataSize);
            paras.Add("Duration", model.Duration);
            paras.Add("FileName", model.FileName);
            using (var context = DataBaseConnection.GetSqlServerConnection())
            {
                var count = context.Query<int>(sql, paras).First();
                return count > 0;
            }
        }

        private TomcatAccessModel GetConcurrentModelIdAndConcurrency(TomcatAccessModel model)
        {
            var sql = @"select TomcatAccessId,Concurrency from TomcatAccess where 
Ip=@Ip and RequestTime=@RequestTime and RequestUrl=@RequestUrl and ResponseStatus=@ResponseStatus and ResponseDataSize=@ResponseDataSize and Duration=@Duration and FileName=@FileName";
            var paras = new DynamicParameters();
            paras.Add("Ip", model.Ip);
            paras.Add("RequestTime", model.RequestTime);
            paras.Add("RequestUrl", model.RequestUrl);
            paras.Add("ResponseStatus", model.ResponseStatus);
            paras.Add("ResponseDataSize", model.ResponseDataSize);
            paras.Add("Duration", model.Duration);
            paras.Add("FileName", model.FileName);
            using (var context = DataBaseConnection.GetSqlServerConnection())
            {
                var data = context.Query<TomcatAccessModel>(sql, paras).First();
                return data;
            }
        }

        public bool UpdateConcurrentModel(TomcatAccessModel model)
        {
            var data = GetConcurrentModelIdAndConcurrency(model);
            string sql = @"update TomcatAccess set Concurrency=@Concurrency where TomcatAccessId=@TomcatAccessId ";
            var paras = new DynamicParameters();
            paras.Add("TomcatAccessId", data.TomcatAccessId);
            paras.Add("Concurrency", data.Concurrency + 1);
            using (var context = DataBaseConnection.GetSqlServerConnection())
            {
                var affectrow = context.Execute(sql, paras);
                return affectrow == 1;
            }
        }

        /// <summary>
        /// 文件是否已被解析过了
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public bool IsFileHasAnalysised(string fileName)
        {
            var sql = @"select count(TomcatAccessId) from TomcatAccess where FileName=@FileName";
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