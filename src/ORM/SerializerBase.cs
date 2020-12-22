using System;
using System.Collections.Generic;
using System.Reflection;
using VoidSharp;

namespace VoidAccessories.ORM
{
    public interface ISerializerBase
    {
        public string Serialize(object obj, IDatabaseDriver databaseDriver = null);
        public object Deserialize(object obj);
    }
}