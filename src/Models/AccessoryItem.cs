using VoidAccessories.Accessories.Enums;
using VoidAccessories.Objects;
using VoidSharp.ORM.Attributes;

namespace VoidAccessories.Models
{
    [Table("voidaccessories_items")]
    public class AccessoryItem
    {
        [PrimaryKey]
        [AutoIncrement]
        public int Id { get; set; }
        public string AccessoryKey { get; set; } // Depends on AccessoryType (if PAC, then the PAC id, if VoidAccessory, then VoidAccessory id)
        
        public string Name { get; set; }
        public string Description { get; set; }
        
        public bool AllowClientOffsetEdit { get; set; }
        
        public AccessoryType AccessoryType { get; set; } // The type of the item (VA/PAC)
        public AccessorySlots Slots { get; set; } // All the slots that the item takes
        public AccessoryModelBlacklist Blacklist { get; set; } // Blacklisted models
        
        public bool SellInShop { get; set; }
        public ItemPrices Prices { get; set; }
    }
}