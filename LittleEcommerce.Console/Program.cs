using LitlleEcommerce.Core;
using LittleEcommerce.Audit;
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
            var logger = new ConsoleAudit();
            var fileAudit = new FileAudit(logger);
            var sqlReader = new SqlItemReader("Database=Littleecommerce;User Id=sa;Password=12345Aa!;Server=localhost,5434;");
            var itemReader = new ItemReader(sqlReader);
            var myItem = new YourItem(itemReader, fileAudit);
            var suggestedItem = new YourAlternativeItem(itemReader, fileAudit);
            var suggestedColour = new YourAlternativeColour(itemReader, fileAudit);
            var fallback = new FallbackItem(itemReader, fileAudit);
            myItem.NextAdv(suggestedColour);
            suggestedColour.NextAdv(suggestedItem);
            suggestedItem.NextAdv(fallback);

            return myItem;
        }
    }
}
