using LittleEcommerce.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;

namespace LittleEcommerce.DataProvider
{
    public class SqlItemReader : IReader<Item>
    {
        private readonly string _connectionString;
        public SqlItemReader(string connectionstring)
        {
            _connectionString = connectionstring;
        }
        public IEnumerable<Item> GetCollection(params string[] parameters)
        {
            using var connection = Connection.GetConnection(_connectionString);
            connection.Open();
            string query = @"SELECT i.NameItem, i.Price, i.Brand, i.C8, v.C2, sc.Label, sc.Qta, sc.Country
                            FROM Item i
                            JOIN Variant v ON i.C8 = v.C8
                            JOIN SizeClass sc ON sc.C2 = v.C2 AND sc.C8 = v.C8
                            WHERE sc.Country = @Country AND sc.Label = @Label";
            using var command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Country", parameters[0]);
            command.Parameters.AddWithValue("@Label", parameters[1]);
            var read = command.ExecuteReader();
            var lista = new List<Item>();
            while (read.Read())
            {
                var c8 = read["C8"].ToString();
                var c2 = read["C2"].ToString();
                var country = read["Country"].ToString();
                var label = read["Label"].ToString();
                var qta = Convert.ToInt32(read["Qta"]);
                var url = read["Url"].ToString();
                var brand = read["Brand"].ToString();
                var name = read["NameItem"].ToString();
                var price = Convert.ToDecimal(read["Price"]);

                var item = lista.Where(x => x.C8 == c8).SingleOrDefault();
                if (item != null)
                {
                    var variant = item.VariantList.Where(x => x.C2 == c2).SingleOrDefault();
                    if (variant != null)
                        variant.SizeList.Add(AddSizeClass(country, label, qta));
                    else
                        item.VariantList.Add(AddVariant(c2, country, label, qta, url));
                }
                else
                {
                    item = AddNewItem(c8, c2, country, label, qta, url, brand, name, price); 
                    lista.Add(item);
                }
            }
            return lista;
        }

     
        public Item GetData(params string[] parameters)
        {

            using var connection = Connection.GetConnection(_connectionString);
            connection.Open();
            string query = @"SELECT i.NameItem, i.Price, i.Brand, i.C8, v.C2, sc.Label, sc.Qta, sc.Country
                            FROM Item i
                            JOIN Variant v ON i.C8 = v.C8 AND i.C8=@C8 AND v.C2=@C2
                            JOIN SizeClass sc ON sc.C2 = v.C2 AND sc.C8 = v.C8
                            WHERE sc.Country = @Country AND sc.Label=@Label";
            using var command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@C8", parameters[0]);
            command.Parameters.AddWithValue("@C2", parameters[1]);
            command.Parameters.AddWithValue("@Country", parameters[2]);
            command.Parameters.AddWithValue("@Label", parameters[3]);
            var read = command.ExecuteReader();
            read.Read();
            if (read == null) return null;

            var c8 = read["C8"].ToString();
            var c2 = read["C2"].ToString();
            var country = read["Country"].ToString();
            var label = read["Label"].ToString();
            var qta = Convert.ToInt32(read["Qta"]);
            var url = read["Url"].ToString();
            var brand = read["Brand"].ToString();
            var name = read["NameItem"].ToString();
            var price = Convert.ToDecimal(read["Price"]);
            return AddNewItem(c8, c2, country, label, qta, url, brand, name, price);

        }

        private static Variant AddVariant(string c2, string country, string label, int qta, string url)
        {
            Variant variant = new(c2)
            {
                Url = url
            };
            variant.SizeList.Add(AddSizeClass(country, label, qta));

            return variant;
        }

        private static SizeClass AddSizeClass(string country, string label, int qta) => new SizeClass(country, label)
        {
            Qta = qta
        };
        private static Item AddNewItem(string c8, string c2, string country, string label, int qta, string url, string brand, string name, decimal price)
        {
            Item item = new Item(c8)
            {
                Brand = brand,
                NameItem = name,
                Prezzo = price
            };
            item.VariantList.Add(AddVariant(c2, country, label, qta, url));
            return item;
        }

    }
}
