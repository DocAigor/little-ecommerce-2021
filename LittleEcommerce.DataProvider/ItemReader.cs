using LittleEcommerce.Model;
using System.Collections.Generic;
using System.Linq;

namespace LittleEcommerce.DataProvider
{
    public class ItemReader : IItemReader
    {
        private readonly IReader<Item> _reader;
        public ItemReader(IReader<Item> reader)
        {
            _reader = reader;
        }
        public Item GetFallBackItem(string c8, string label) =>
            _reader.GetData(c8, "AA", "GB", label);

        public Item GetItem(string c8, string c2, string label, string country)
        => _reader.GetData(c8, c2, country, label);

        public IEnumerable<Item> GetSuggestedItem(string label, string country, string c8) =>
            _reader.GetCollection(country, label).Where(x => x.C8 == c8);

        public IEnumerable<Item> GetSuggestedItemByVariant(string label, string country, string c2) =>
            _reader.GetCollection(country, label)
            .Where(x => x.VariantList.Any(c => c.C2 == c2));

    }
}
