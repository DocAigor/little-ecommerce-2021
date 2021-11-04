using LittleEcommerce.DataProvider;
using LittleEcommerce.Model;
using System.Collections.Generic;

namespace LitlleEcommerce.Core
{
    public abstract class Advisor 
    {
        
        protected Advisor _advisor;

        protected readonly IItemReader _itemReader;

        protected Advisor(IItemReader itemReader)
        {
            _itemReader = itemReader;
        }

        public void NextAdv(Advisor adv) => _advisor = adv;

        public abstract IEnumerable<Item> ProcessAdv(string c8,string c2,string label,string country);
    }
}
