using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using VoidAccessories.Accessories.Enums;
using VoidAccessories.Configuration;
using VoidSharp.Handlers;
using VoidSharp.ORM;
using VoidAccessories.Localization;
using VoidAccessories.Models;
using VoidAccessories.Objects;
using VoidAccessories.Utilities;
using VoidSharp;
using VoidSharp.DarkRP;

// using VoidAccessories.Migrations;

/*
[[
    VoidAccessoriesAutoRefreshFunc()
]]
*/

namespace VoidAccessories.Server
{
    public class ServerRealm
    {
        private Database Database { get; set; }

        /*
         * SerializerMap.RegisterSerializer<ItemPrices, ItemPricesSerializer>();
            SerializerMap.RegisterSerializer<AccessorySlots, AccessorySlotsSerializer>();
            SerializerMap.RegisterSerializer<AccessoryModelBlacklist, AccessoryModelBlacklistSerializer>();
         */

        public async Task Main()
        {
            await DatabaseTasks();
            await ConfigManager.CreateEntries(Database);
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