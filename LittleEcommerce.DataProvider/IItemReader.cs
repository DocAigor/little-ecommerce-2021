using LittleEcommerce.Model;
using System;
using System.Collections.Generic;

namespace LittleEcommerce.DataProvider
{
    public interface IItemReader
    {
        IEnumerable<Item> GetSuggestedItemByVariant(string label, string country, string c2);
        IEnumerable<Item> GetSuggestedItem(string label, string country, string c8);
        Item GetItem(string c8, string c2, string label, string country);
        Item GetFallBackItem(string c8, string label);
    }
}
