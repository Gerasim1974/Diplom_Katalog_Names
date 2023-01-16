using AppNames.Classes;
using AppNames.Sql;
using Microsoft.Data.SqlClient;
namespace AppNames.SqlClass
{
    public class NamesWithFiltersSql
    {
        public async Task<List<string>> ReadNames()
        {
            List<string> lstName = new List<string>();
            var sqlClass = await mySqlClass.CreateAsync();
            string commandTxt = "SELECT DISTINCT [Name] " +
                  " FROM[NamesCatalog].[dbo].[NamesFullInfo] " +
                  " ORDER BY [Name]";
            SqlCommand command = new SqlCommand(commandTxt, sqlClass.sqlConnection);
            command.CommandTimeout = 500;

            using (SqlDataReader reader = await command.ExecuteReaderAsync())
            {
                if (reader.HasRows) // если есть данные
                {
                    while (await reader.ReadAsync()) // построчно считываем данные
                    {
                        object objName = reader.GetValue(0);
                        lstName.Add(Convert.ToString(objName));
                    }
                }
            }
            await sqlClass.SqlClose();
            return lstName;
        }
        public async Task<List<string>> ReadOrigin()
        {
            List<string> lstOrigin = new List<string>();
            var sqlClass = await mySqlClass.CreateAsync();
            string commandTxt = "SELECT DISTINCT [FullNameOrigin] " +
                  " FROM [NamesCatalog].[dbo].[Origin] " +
                  " ORDER BY [FullNameOrigin]";
            SqlCommand command = new SqlCommand(commandTxt, sqlClass.sqlConnection);
            command.CommandTimeout = 500;

            using (SqlDataReader reader = await command.ExecuteReaderAsync())
            {
                if (reader.HasRows) // если есть данные
                {
                    while (await reader.ReadAsync()) // построчно считываем данные
                    {
                        object objOrigin = reader.GetValue(0);
                        lstOrigin.Add(Convert.ToString(objOrigin));
                    }
                }
            }
            await sqlClass.SqlClose();
            return lstOrigin;
        }

        public async Task<List<string>> ReadDenotation()
        {
            List<string> lstDenotation = new List<string>();
            var sqlClass = await mySqlClass.CreateAsync();
            string commandTxt = "SELECT DISTINCT [DetailName] " +
                  " FROM [NamesCatalog].[dbo].[Denotation] " +
                  " ORDER BY [DetailName]";
            SqlCommand command = new SqlCommand(commandTxt, sqlClass.sqlConnection);
            command.CommandTimeout = 500;

            using (SqlDataReader reader = await command.ExecuteReaderAsync())
            {
                if (reader.HasRows) // если есть данные
                {
                    while (await reader.ReadAsync()) // построчно считываем данные
                    {
                        object objDenotation = reader.GetValue(0);
                        lstDenotation.Add(Convert.ToString(objDenotation));
                    }
                }
            }
            await sqlClass.SqlClose();
            return lstDenotation;
        }

        public async Task<List<Names>> ReadListNamesIntoFilters(string sex, string origin, string denotation)
        {
            List<Names> lstNames = new List<Names>();
            var sqlClass = await mySqlClass.CreateAsync();
            string commandTxt = "EXEC [NamesCatalog].[DBO].[ListNamesIntoFilter] " +
                  " @sex, @FullNameOrigin, @Denotation ";
            SqlCommand command = new SqlCommand(commandTxt, sqlClass.sqlConnection);
            command.Parameters.AddWithValue("@sex", (object)sex);
            command.Parameters.AddWithValue("@FullNameOrigin", (object)origin);
            command.Parameters.AddWithValue("@Denotation", (object)denotation);

            command.CommandTimeout = 500; 

            using (SqlDataReader reader = await command.ExecuteReaderAsync())
            {
                if (reader.HasRows) // если есть данные
                {
                    while (await reader.ReadAsync()) // построчно считываем данные
                    {
                        object objName = reader.GetValue(0);
                        object objSex = reader.GetValue(1);
                        object objFullNameOrigin = reader.GetValue(2);
                        object objDetailName = reader.GetValue(3);
                        object objReferenceUrl = reader.GetValue(4);

                        Names names = new Names();

                        names.name = Convert.ToString(objName);
                        names.sex = Convert.ToString(objSex);
                        names.origin = Convert.ToString(objFullNameOrigin);
                        names.denotation = Convert.ToString(objDetailName); 
                        names.urlAdress = Convert.ToString(objReferenceUrl);

                        lstNames.Add(names);
                    }
                }
            }
            await sqlClass.SqlClose();
            return lstNames;
        }
    }
}
