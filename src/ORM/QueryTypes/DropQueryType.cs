using System;
using System.Threading.Tasks;
using VoidSharpExample.ORM.Attributes;

namespace VoidSharpExample.ORM.QueryTypes
{
    public class DropQueryType<T> : QueryType where T : new()
    {
        public DropQueryType(Database database) : base(database)
        {
           
        }

        public override string GenerateQuery(Type type)
        {
            string tableName = TableAttribute.GetAttributeTable(type);
            return "DROP TABLE " + tableName + ";";
        }
        
        public async Task Execute()
        {
            string query = GenerateQuery(typeof(T));
            await Database.Query<T>(query);
        }
    }
}