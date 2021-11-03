using System.Data.SqlClient;

namespace LittleEcommerce.DataProvider
{
    public static class Connection
    {
        public static SqlConnection GetConnection(string connectionstring) => new SqlConnection(connectionstring);
    }
}
