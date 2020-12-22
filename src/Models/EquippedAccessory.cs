using VoidAccessories.ORM.Attributes;

namespace VoidAccessories.Models
{
    [Table("voidaccessories_equippedaccessories")]
    public class EquippedAccessory
    {
        [PrimaryKey]
        public string SteamId64 { get; set; }
        
        public int AccessoryKey { get; set; }
    }
}