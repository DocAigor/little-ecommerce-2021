namespace LittleEcommerce.Audit
{
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
}
