using System;
using System.Threading.Tasks;
using VoidSharp.Handlers;
using VoidSharp.Networking;
using VoidAccessories.Utilities;
using VoidAccessories.Models;
using VoidSharp;
using VoidSharp.VoidUI;

/*
[[
    VoidAccessoriesAutoRefreshFunc()
]]
*/

namespace VoidAccessories.Client
{

    public class ClientRealm
    {
        public async Task Main()
        {
            Logger.LogInfo("Clientside loaded!");

            HookHandler.InitializeHooks(this);
            ConCommandHandler.InitializeConCommands(this);
            RPC.RegisterInstance(this);
        }
    }
}