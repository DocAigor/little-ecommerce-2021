using LittleEcommerce.DataProvider;
using LittleEcommerce.Model;
using System;
using System.Collections.Generic;

namespace LitlleEcommerce.Core
{
    public class FallbackItem : Advisor
    {
        public FallbackItem(IItemReader itemReader) : base(itemReader)
        {

        }

        public override IEnumerable<Item> ProcessAdv(string c8, string c2, string label, string country) =>
            new List<Item>()
            {
                _itemReader.GetFallBackItem(c8, label)
            };

    }
}
