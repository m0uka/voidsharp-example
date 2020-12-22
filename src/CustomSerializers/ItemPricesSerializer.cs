using System.Collections.Generic;
using VoidAccessories.Objects;
using VoidSharp.ORM;
using VoidSharp;

namespace VoidAccessories.CustomSerializers
{
    public class ItemPricesSerializer : ISerializerBase
    {
        public string Serialize(object obj, IDatabaseDriver databaseDriver = null)
        {
            var itemPrices = (ItemPrices) obj;
            return "'" + JSON.Serialize(itemPrices.PriceDict) + "'";
        }

        public object Deserialize(object obj)
        {
            string str = (string) obj;
            object tbl = JSON.Parse(str);

            return JSON.TableToDictionary<Dictionary<string, int>>(tbl);
        }
    }
}