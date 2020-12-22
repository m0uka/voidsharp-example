using System;
using System.Threading.Tasks;
using VoidAccessories.Handlers;
using VoidAccessories.Networking;
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