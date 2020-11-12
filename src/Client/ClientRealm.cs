using System;
using System.Threading.Tasks;
using VoidSharp;
using VoidSharp.VoidUI;
using VoidSharpExample.Handlers;
using VoidSharpExample.Utilities;

 namespace VoidSharpExample.Client
{
    public class ClientRealm
    {
        public async Task Main()
        {
            Logger.LogInfo("Clientside loaded");

            HookHandler.InitializeHooks(this);
            ConCommandHandler.InitializeConCommands(this);
        }

        [ConCommand("voidsharp_example")]
        public void CreatePanel(Player ply, string cmd, string[] args, string argStr)
        {
            var panel = new Frame();
            panel.SetSize(500, 500);
            panel.Center();
            panel.MakePopup();
            panel.SetTitle("Hello from my panel!");
        }
    }
}