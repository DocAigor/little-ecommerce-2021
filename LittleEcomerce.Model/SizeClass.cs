using System;

namespace LittleEcommerce.Model
{
    public class SizeClass
    {
        public readonly string Country;
        public readonly string Label;
        public int Qta;
        public bool IsOutOfStock => Qta == 0;
        public SizeClass(string country, string label)
        {
            Country = country;
            Label = label;
        }
    }
}
