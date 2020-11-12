using System;
using VoidSharp;
using VoidSharpExample.ORM.Attributes;

namespace VoidSharpExample.Models
{
    [Serializable]
    [Table("voidsharp_characters")]
    public class Character
    {
        [PrimaryKey]
        [AutoIncrement]
        public int Id { get; set; }
        
        [ColumnLength(50)]
        public string SteamId { get; set; }
        
        [ColumnLength(100)]
        public string Name { get; set; }

        public Color FavoriteColor { get; set; }
        public DateTime Time { get; set; }
    }
}