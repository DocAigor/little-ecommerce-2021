using LitlleEcommerce.Core;
using LittleEcommerce.DataProvider;
using System;

namespace LittleEcommerce.Console
{
    public class Program
    {
        static void Main(string[] args)
        {
            var build = Installer();
            var ciao = build.ProcessAdv("12345678", "BB", "S", "CA");
        }

        public static YourItem Installer()
        {
            var sqlReader = new SqlItemReader("Database=Littleecommerce;User Id=sa;Password=12345Aa!;Server=localhost,5434;");
            var itemReader = new ItemReader(sqlReader);
            var myItem = new YourItem(itemReader);
            var suggestedItem = new YourAlternativeItem(itemReader);
            var suggestedColour = new YourAlternativeColour(itemReader);
            var fallback = new FallbackItem(itemReader);
            myItem.NextAdv(suggestedColour);
            suggestedColour.NextAdv(suggestedItem);
            suggestedItem.NextAdv(fallback);

            return myItem;
        }
    }
}
