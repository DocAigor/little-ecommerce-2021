using System;
using System.IO;

namespace LittleEcommerce.Audit
{
    public abstract class Audit : IAudit
    {
        public abstract void Log(string message);
    }
    public class ConsoleAudit : Audit
    {
        public override void Log(string message)
        {
            Console.WriteLine(message);
        }
    }
    public abstract class AuditDecorator : Audit
    {
        private readonly Audit _audit;
        public AuditDecorator(Audit audit)
        {
            _audit = audit;
        }
        public override void Log(string message)
        {
            _audit.Log(message);
        }
    }
    public class FileAudit : AuditDecorator
    {
        public FileAudit(Audit audit) : base(audit)
        {
        }

        public override void Log(string message)
        {
            base.Log(message);
            File.AppendAllText($"{DateTime.Now.Year}-{DateTime.Now.Month}-{DateTime.Now.Day}.txt", message);
        }
    }
}
