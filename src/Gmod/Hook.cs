using System;

namespace VoidSharp {
    /// <summary>
    /// @CSharpLua.Ignore
    /// </summary>
    public static class Hook
    {

        /// <summary>
        /// @CSharpLua.Template = "return {0}"
        /// </summary>
        public static void Return(object[] args)
        {
            throw new NotImplementedException();
        }

        public static void Add(string name, string id, Action<object[]> hookCallback)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// @CSharpLua.Template = "hook.Remove({0}, {1})"
        /// </summary>
        public static void Remove(string name, string id)
        {
            throw new NotImplementedException();
        }

        public static void Run(string name, object[] args)
        {
            throw new NotImplementedException();
        }

    }
}