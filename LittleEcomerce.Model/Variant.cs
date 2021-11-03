using System.Collections.Generic;

namespace LittleEcommerce.Model
{
    public class Variant
    {
        public readonly string C2;
        public IList<SizeClass> SizeList;
        public string Url;
        public Variant(string c2)
        {
            C2 = c2;
            SizeList = new List<SizeClass>();
        }
    }
}
