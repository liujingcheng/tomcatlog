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
            string sql = @"insert into TomcatAccess (TomcatAccessId,Ip,RequestTime,RequestUrl,ResponseStatus,ResponseDataSize,Duration) 
values(@TomcatAccessId,@Ip,@RequestTime,@RequestUrl,@ResponseStatus,@ResponseDataSize,@Duration)";
            var paras = new DynamicParameters();
            paras.Add("TomcatAccessId", model.TomcatAccessId);
            paras.Add("Ip", model.Ip);
            paras.Add("RequestTime", model.RequestTime);
            paras.Add("RequestUrl", model.RequestUrl);
            paras.Add("ResponseStatus", model.ResponseStatus);
            paras.Add("ResponseDataSize", model.ResponseDataSize);
            paras.Add("Duration", model.Duration);
            using (var context = DataBaseConnection.GetSqlServerConnection())
            {
                var affectrow = context.Execute(sql, paras);
                result = affectrow == 1;
                context.Dispose();
            }

            return result;
        }

        public bool IsExist(TomcatAccessModel model)
        {
            var sql = @"select count(TomcatAccessId) from TomcatAccess where 
Ip=@Ip and RequestTime=@RequestTime and RequestUrl=@RequestUrl and ResponseStatus=@ResponseStatus and ResponseDataSize=@ResponseDataSize and Duration=@Duration";
            var paras = new DynamicParameters();
            paras.Add("Ip", model.Ip);
            paras.Add("RequestTime", model.RequestTime);
            paras.Add("RequestUrl", model.RequestUrl);
            paras.Add("ResponseStatus", model.ResponseStatus);
            paras.Add("ResponseDataSize", model.ResponseDataSize);
            paras.Add("Duration", model.Duration);
            using (var context = DataBaseConnection.GetSqlServerConnection())
            {
                var count = context.Query<int>(sql, paras).First();
                return count > 0;
            }
        }
    }
}