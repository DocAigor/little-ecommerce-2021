using System;

namespace LittleEcommerce.Audit
{
    public class ConsoleAudit : Audit
    {
        public override void Log(string message)
        {
            Console.WriteLine(message);
        }
    }
}
