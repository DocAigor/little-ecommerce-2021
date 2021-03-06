using LittleEcommerce.Audit;
using LittleEcommerce.DataProvider;
using LittleEcommerce.Model;
using System;
using System.Collections.Generic;
using System.Linq;

namespace LitlleEcommerce.Core
{
    public class YourAlternativeItem : Advisor
    {
        public YourAlternativeItem(IItemReader itemReader, IAudit audit) : base(itemReader, audit)
        {
        }

        public override IEnumerable<Item> ProcessAdv(string c8, string c2, string label, string country)
        {
            var itemList = _itemReader.GetSuggestedItemByVariant(label, country, c2);
            return !itemList.Any() ? _advisor.ProcessAdv(c8, c2, label, country) : itemList;
        }
    }
}
