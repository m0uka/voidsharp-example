using System.Collections.Generic;

namespace VoidAccessories.Objects
{
    public class ItemPrices
    {
        public Dictionary<string, int> PriceDict;

        public ItemPrices(Dictionary<string, int> dict)
        {
            PriceDict = dict;
        }

        public void AddPrice(string currency, int price)
        {
            PriceDict.Add(currency, price);
        }

        public int GetPrice(string currency)
        {
            return PriceDict[currency];
        }
    }
}