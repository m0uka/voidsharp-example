using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using VoidAccessories.Models;
using VoidAccessories.ORM;
using VoidAccessories.Utilities;

namespace VoidAccessories.Migrations
{
    public class MigrationManager
    {
        public int CurrentVersion { get; set; }
        
        /// <summary>
        /// Updates the database to the latest migration.
        /// </summary>
        /// <param name="database">The database conenction.</param>
        /// <returns></returns>
        public async Task UpdateMigrations(Database database)
        {
            CurrentVersion = await GetLatestMigrationVersion(database);

            List<Migration> migrations = typeof(Migration)
                .Assembly.GetExportedTypes()
                .Where(t => t.IsSubclassOf(typeof(Migration)))
                .Select(t => (Migration)Activator.CreateInstance(t))
                .ToList();

            int highestVersion = 0;
            foreach (var migration in migrations)
            {
                if (migration.Version <= CurrentVersion) continue;
                
                string migrationName = migration.GetType().Name;
                
                Logger.LogInfo($"Applying migration name {migrationName}!", "Migrations");
                await migration.Up(database);
                Logger.LogInfo($"Applied migration {migrationName}!", "Migrations");

                if (migration.Version > highestVersion)
                {
                    highestVersion = migration.Version;
                }
            }

            if (highestVersion != 0)
            {
                CurrentVersion = highestVersion;
                await UpdateMigrationVersion(database);
            }
        }

        /// <summary>
        /// Returns the latest migration version.
        /// </summary>
        /// <param name="database"></param>
        /// <returns></returns>
        private async Task<int> GetLatestMigrationVersion(Database database)
        {
            var migrationVersion = await database.Select<MigrationVersion>().First();
            return migrationVersion?.Version ?? 0;
        }
        
        private async Task<int> GetLatestMigrationTimesUpdated(Database database)
        {
            var migrationVersion = await database.Select<MigrationVersion>().First();
            return migrationVersion?.TimesUpdated ?? 0;
        }
        
        private async Task UpdateMigrationVersion(Database database)
        {
            int timesUpdated = await GetLatestMigrationTimesUpdated(database);
            MigrationVersion migrationVersion = new MigrationVersion
            {
                Id = "VoidAccessories",
                Version = CurrentVersion,
                TimesUpdated = timesUpdated + 1
            };

            await database.Replace<MigrationVersion>(migrationVersion).Execute();
            Logger.LogInfo("Successfully updated migration version to " + CurrentVersion + "!", "Migrations");
        }
    }
}