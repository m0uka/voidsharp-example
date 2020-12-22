using System.Collections.Generic;
using VoidAccessories.Accessories.Enums;

namespace VoidAccessories.Objects
{
    public class AccessorySlots
    {
        public List<AccessorySlot> Slots { get; set; }

        public AccessorySlots(List<AccessorySlot> slots)
        {
            Slots = slots;
        }
    }
}