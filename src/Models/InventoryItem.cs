using System;
using VoidSharp;
using VoidSharp.ORM.Attributes;

namespace VoidSharpTest.Models
{
    [Table("voidsharptest_inventories")]
    public class InventoryItem
    {
        [PrimaryKey]
        [AutoIncrement]
        public int Id { get; set; }
        
        public string SteamId64 { get; set; }
        public string PlayerName { get; set; }
        public Color PlayerColor { get; set; }
        
        public DateTime CreatedAt { get; set; }
    }
}