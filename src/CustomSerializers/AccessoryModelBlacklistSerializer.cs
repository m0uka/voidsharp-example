using System.Collections.Generic;
using VoidAccessories.Accessories.Enums;
using VoidAccessories.Objects;
using VoidSharp.ORM;
using VoidSharp;

namespace VoidAccessories.CustomSerializers
{
    public class AccessoryModelBlacklistSerializer : ISerializerBase
    {
        public string Serialize(object obj, IDatabaseDriver databaseDriver = null)
        {
            var blacklist = (AccessoryModelBlacklist) obj;
            return "'" + JSON.Serialize(blacklist.Blacklist) + "'";
        }

        public object Deserialize(object obj)
        {
            string str = (string) obj;
            object tbl = JSON.Parse(str);

            return JSON.TableToList<List<AccessoryModelBlacklist>>(tbl);
        }
    }
}