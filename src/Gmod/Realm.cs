using System;

namespace VoidSharp
{
    /// <summary>
    /// @CSharpLua.Ignore
    /// </summary>
    public static class Realm {
        /// <summary>
        /// @CSharpLua.Template = "SERVER"
        /// </summary>
        public static bool IsServer() {
            throw new NotImplementedException();
        }

        /// <summary>
        /// @CSharpLua.Template = "CLIENT"
        /// </summary>
        public static bool IsClient() {
            throw new NotImplementedException();
        }
    }
}