using System;
using VoidAccessories.ORM.Attributes;

namespace VoidAccessories.Models
{
    [Serializable]
    [Table("voidaccessories_config")]
    public class ConfigEntry
    {
        [PrimaryKey]
        [ColumnLength(50)]
        public string Key { get; set; }
        
        public dynamic Value { get; set; }
    }
}