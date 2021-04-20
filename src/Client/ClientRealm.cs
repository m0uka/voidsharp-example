using System;
using System.Threading.Tasks;
using VoidSharp.Handlers;
using VoidSharp.Networking;
using VoidSharpTest.Models;
using VoidSharp;
using VoidSharp.VoidUI;
using VoidSharpTest.UI;
using VoidSharpTest.Utilities;

/*
[[
    VoidSharpTestAutoRefreshFunc()
]]
*/

namespace VoidSharpTest.Client
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

        [RPC]
        public void SendUsefulData(InventoryItem item)
        {
            var player = Player.LocalPlayer();
            player.ChatPrint("Got some useful data!");
            player.ChatPrint(item.PlayerName);
            player.ChatPrint(item.CreatedAt.ToString());
        }


        [ConCommand("voidsharptest_ui")]
        public void OpenMenu(Player ply, string s, string[] args, string argStr)
        {
            MainPanel panel = new MainPanel();
            panel.SetSize(400, 400);
            panel.MakePopup();
            
            panel.Center();
        }
    }
}