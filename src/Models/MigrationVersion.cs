using System;
using VoidAccessories.ORM.Attributes;

namespace VoidAccessories.Models
{
    [Serializable]
    [Table("voidaccessories_migrationversion")]
    public class MigrationVersion
    {
        [PrimaryKey]
        public string Id { get; set; }
        public int Version { get; set; }
        public int TimesUpdated { get; set; }
    }
}