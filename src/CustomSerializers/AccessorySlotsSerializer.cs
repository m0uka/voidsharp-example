using System.Collections.Generic;
using VoidAccessories.Accessories.Enums;
using VoidAccessories.Objects;
using VoidSharp.ORM;
using VoidSharp;

namespace VoidAccessories.CustomSerializers
{
    public class AccessorySlotsSerializer : ISerializerBase
    {
        public string Serialize(object obj, IDatabaseDriver databaseDriver = null)
        {
            var slots = (AccessorySlots) obj;
            return "'" + JSON.Serialize(slots.Slots) + "'";
        }

        public object Deserialize(object obj)
        {
            string str = (string) obj;
            object tbl = JSON.Parse(str);

            return JSON.TableToList<List<AccessorySlot>>(tbl);
        }
    }
}