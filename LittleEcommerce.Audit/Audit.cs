namespace LittleEcommerce.Audit
{
    public abstract class Audit : IAudit
    {
        public abstract void Log(string message);
    }
}
