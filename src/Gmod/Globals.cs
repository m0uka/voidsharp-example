using System;

namespace VoidSharp
{
    public static class Globals
    {
        public static void ConsoleLog(object[] args)
        {
            /*
            [[
                MsgC(unpack(args))
            ]] 
            */
        }

        public static void AddConCommand(string name, Action<Player, string, string[], string> callback, Action<string, string> autoComplete = null, string helpText = null, int flags = 0)
        {
            /*
            [[
                concommand.Add(name, callback, autoComplete, helpText, flags)
            ]] 
            */
        }

        public static void Error(string err)
        {
            /*
            [[
                error(err)
            ]] 
            */
        }
    }
}