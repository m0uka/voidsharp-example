using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using VoidSharp.Handlers;
using VoidSharp.ORM;
using VoidSharpTest.Models;
using VoidSharpTest.Utilities;
using VoidSharp;
using VoidSharp.DarkRP;
using VoidSharp.Networking;

/*
[[
    VoidSharpTestAutoRefreshFunc()
]]
*/

namespace VoidSharpTest.Server
{

    public class ServerRealm
    {
        private Database Database { get; set; }

        public async Task Main()
        {
            await DatabaseTasks();
            
            ConCommandHandler.InitializeConCommands(this);
            RPC.RegisterInstance(this);
            
            RPC.AddNetworkString("SendUsefulData");
            RPC.AddNetworkString("SendDataToServer");
            RPC.AddNetworkString("PlayerDiedRPC");
        }

        [ConCommand("sendusefuldata")]
        public void SendUsefulData(Player ply, string s, string[] args, string argStr)
        {
            foreach (var player in Players.GetAll())
            {
                var data = new InventoryItem
                {
                    CreatedAt = DateTime.Now,
                    PlayerName = "SMG",
                    SteamId64 = player.SteamId64
                };
                
                RPC.SendToClient<InventoryItem>(player, "SendUsefulData", data);
                Logger.LogInfo($"Sent some useful data to {player.Nick}");
            }
        }

        [RPC]
        public void SendDataToServer(Player player, ServerNetworkData networkData)
        {
            Logger.LogInfo($"Received a RPC from {player.Nick}!");
            Logger.LogInfo($"Received a name {networkData.Name} and a color {networkData.Color}!");

            if (string.IsNullOrWhiteSpace(networkData.Name))
            {
                Logger.LogError($"{player.Nick} sent data with no name!");
                return;
            }
            
            InventoryItem item = new InventoryItem
            {
                PlayerColor = networkData.Color,
                PlayerName = networkData.Name,
                CreatedAt = DateTime.Now,
                SteamId64 = player.SteamId64
            };

            Database.Insert<InventoryItem>(item).Execute();
        }

        private async Task DatabaseTasks()
        {
            Database = new Database(new SQLite());
            await Database.Connect(typeof(Program));

            // // Handle migrations
            // MigrationManager migrationManager = new MigrationManager();
            // await migrationManager.UpdateMigrations(Database);
        }
    }
}