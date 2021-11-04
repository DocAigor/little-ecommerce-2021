namespace LittleEcommerce.Audit
{
    public interface IAudit
    {
        void Log(string message);
    }
}