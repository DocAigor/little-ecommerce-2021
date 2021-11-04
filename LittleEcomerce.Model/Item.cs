using System.Collections.Generic;

namespace LittleEcommerce.Model
{
    public class Item
    {
        public readonly string C8;
        public decimal Prezzo;
        public IList<Variant> VariantList;
        public string Brand;
        public string NameItem;
        public Item(string c8)
        {
            C8 = c8;
            VariantList = new List<Variant>();
        }

    }
}
