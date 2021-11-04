using LittleEcommerce.DataProvider;
using LittleEcommerce.Model;
using System;
using System.Collections.Generic;

namespace LitlleEcommerce.Core
{
    public class YourItem : Advisor
    {
        public YourItem(IItemReader itemReader) : base(itemReader)
        {

        }

        public override IEnumerable<Item> ProcessAdv(string c8, string c2, string label, string country)
        {
            var item = _itemReader.GetItem(c8, c2, label, country);
            if (item == null)
                return _advisor.ProcessAdv(c8, c2, label, country);
            return new List<Item> { item };
        }
    }
}
