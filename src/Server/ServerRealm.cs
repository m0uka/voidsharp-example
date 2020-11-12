using System;
using System.Threading.Tasks;
using VoidSharp;
using VoidSharpExample.Handlers;
using VoidSharpExample.Models;
using VoidSharpExample.ORM;
using VoidSharpExample.Utilities;

namespace VoidSharpExample.Server
{
    public class ServerRealm
    {
        public Database Database { get; set; }
        
        public async Task Main()
        {
            HookHandler.InitializeHooks(this);
            
            // Use SQLite for the database connection
            Database database = new Database(new SQLite());
            await database.Connect();

            Database = database;
        }
        
        [ConCommand("testing_concommand")]
        public void TestingConcommand(Player ply, string cmd, string[] args, string argStr)
        {
            Console.WriteLine("This is a testing console command! Yay");
        }

        [Hook("PlayerInitialSpawn")]
        public void PlayerInitialSpawn(Player ply)
        {
            Task.Run(async () =>
            {
                var character = await Database.Select<Character>()
                    .Where("SteamId", "=", ply.SteamID64())
                    .Single;

                if (character != null)
                {
                    Logger.LogInfo("Hello " + character.Name + ", you just connected! Your favorite color is: " + character.FavoriteColor);
                }
                else
                {
                    Logger.LogInfo($"{ply.Nick()} doesn't have a character :( Creating one for him!");
                    
                    Character newCharacter = new Character()
                    {
                        SteamId = ply.SteamID64(),
                        Name = ply.Nick() + "'s character",
                        FavoriteColor = new Color(255, 255, 255),
                        Time = DateTime.Now
                    };

                    await Database.Insert<Character>(newCharacter).Execute();
                    
                    Logger.LogInfo($"Now {ply.Nick()} has a character with the name {newCharacter.Name}!");
                }
            });
        }
    }
}