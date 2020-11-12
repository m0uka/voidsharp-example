﻿using System;
using System.Collections.Generic;
using System.Reflection;
using VoidSharp;

namespace VoidSharpExample.ORM
{
    public interface ISerializerBase
    {
        public string Serialize(object obj, IDatabaseDriver databaseDriver = null);
        public object Deserialize(object obj);
    }
}