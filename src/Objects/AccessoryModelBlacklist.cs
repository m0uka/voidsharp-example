using System.Collections.Generic;

namespace VoidAccessories.Objects
{
    public class AccessoryModelBlacklist
    {
        public List<string> Blacklist { get; set; }

        public AccessoryModelBlacklist(List<string> blacklist)
        {
            Blacklist = blacklist;
        }
    }
}