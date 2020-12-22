using VoidSharp.ORM.Attributes;

namespace VoidAccessories.Models
{
    [Table("voidaccessories_accessories")]
    public class VoidAccessory
    {
        [PrimaryKey]
        public string Id { get; set; }
        
        public string Bone { get; set; }
        
        public string Model { get; set; }
        public int WorkshopId { get; set; } // The workshop addon the accessory depends on.
        
        public int TranslateX { get; set; }
        public int TranslateY { get; set; }
        public int TranslateZ { get; set; }
        
        public int RotateX { get; set; }
        public int RotateY { get; set; }
        public int RotateZ { get; set; }
        
        public int ScaleX { get; set; }
        public int ScaleY { get; set; }
        public int ScaleZ { get; set; }
    }
}