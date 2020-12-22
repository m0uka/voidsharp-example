using System;
using VoidAccessories.ORM.Attributes;

namespace VoidAccessories.Models
{
    [Table("voidaccessories_inventories")]
    public class InventoryItem
    {
        [PrimaryKey]
        public string SteamId64 { get; set; }
        
        [PrimaryKey]
        public int ItemId { get; set; }
        
        public DateTime PurchasedAt { get; set; }
        
        public bool IsTemporary { get; set; }
        public DateTime ExpireTime { get; set; }
    }
}