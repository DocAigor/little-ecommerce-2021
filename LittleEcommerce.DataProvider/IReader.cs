using System.Collections.Generic;

namespace LittleEcommerce.DataProvider
{
    public interface IReader<T>
    {
        T GetData(params string[] parameters);
        IEnumerable<T> GetCollection(params string [] parameters);
    }
}
