using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using VoidAccessories.Models;
using VoidAccessories.ORM;
using VoidAccessories.Utilities;

namespace VoidAccessories.Configuration
{
    public static class ConfigManager
    {
        private static PropertyInfo[] GetConfigProperties()
        {
            return typeof(Config).GetProperties();
        }
        
        public static async Task CreateEntries(Database database)
        {
            var configEntries = await database.Select<ConfigEntry>().ToList();
            var configProperties = GetConfigProperties();

            foreach (var property in configProperties)
            {
                string propertyName = property.Name;
                
                ConfigEntry configEntry = configEntries.FirstOrDefault(x => x.Key == propertyName) ?? await InsertEntry(database, property);
                property.SetValue(null, configEntry.Value);
                
                Logger.LogDebug($"Loaded config entry {propertyName}", "Config");
            }
        }

        private static async Task<ConfigEntry> InsertEntry(Database database, PropertyInfo propertyInfo)
        {
            ConfigEntry configEntry = new ConfigEntry
            {
                Key = propertyInfo.Name,
                Value = propertyInfo.GetValue(null, null)
            };

            await database.Insert<ConfigEntry>(configEntry).Execute();
            return configEntry;
        }

        /// <summary>
        /// Saves the configuration entry into the database.
        /// </summary>
        /// <param name="database">A database instance.</param>
        /// <param name="propertyInfo">The PropertyInfo of the configuration entry</param>
        /// <returns></returns>
        public static async Task UpdateValue(Database database, PropertyInfo propertyInfo)
        {
            ConfigEntry configEntry = await database.Select<ConfigEntry>()
                .Where("Key", "=", propertyInfo.Name)
                .Single;

            configEntry.Value = propertyInfo.GetValue(null, null);

            await database.Update<ConfigEntry>(configEntry).Execute();
        }
    }
}