using System;
using System.IO;

namespace LittleEcommerce.Audit
{
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
