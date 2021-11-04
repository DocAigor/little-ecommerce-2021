using LittleEcommerce.Audit;
using LittleEcommerce.DataProvider;
using LittleEcommerce.Model;
using System;
using System.Collections.Generic;

namespace LitlleEcommerce.Core
{
    public class YourItem : Advisor
    {

        public YourItem(IItemReader itemReader, IAudit audit) : base(itemReader, audit)
        {

        }

        public override IEnumerable<Item> ProcessAdv(string c8, string c2, string label, string country)
        {
            var item = _itemReader.GetItem(c8, c2, label, country);
            if (item == null)
            {
                _audit.Log($"Non Trovato!");
                return _advisor.ProcessAdv(c8, c2, label, country);
            } 
            _audit.Log($"{item.C8} Trovato!");
            return new List<Item> { item };
        }
    }
}
