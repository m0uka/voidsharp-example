﻿using System;

namespace VoidSharp
{
    // ReSharper disable once InconsistentNaming
    public class JSON
    {
        /// <summary>
        /// @CSharpLua.Template = "util.JSONToTable({0})"
        /// </summary>
        public static dynamic Parse(string str)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// @CSharpLua.Template = "util.TableToJSON({0})"
        /// </summary>
        public static string Serialize(object obj)
        {
            throw new NotImplementedException();
        }
    }
}