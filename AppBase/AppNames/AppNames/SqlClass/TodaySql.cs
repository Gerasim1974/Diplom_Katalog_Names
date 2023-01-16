using AppNames.Classes;
using AppNames.Sql;
using Microsoft.Data.SqlClient;

namespace AppNames.SqlClass
{
    public class TodaySql
    {
        List<Names> lstNames = new List<Names>();

        public async Task<List<Names>> ReadNames()
        {
            DateTime dt = new DateTime();
            dt = DateTime.Today;
            int day = dt.Day;
            int month = dt.Month;
            
            var sqlClass = await mySqlClass.CreateAsync();

            string commandTxt = "SELECT [Name], [Sex], [FullNameOrigin], [DetailName], [ReferenceUrl] " +
                   " FROM[NamesCatalog].[dbo].[NamesFullInfo] " +
                   " WHERE[NumbOfMonth] = @NumbMonth AND[NumbOfDay] = @NumbDays "+
                   " ORDER BY [Name], [Sex]";

            SqlCommand command = new SqlCommand(commandTxt, sqlClass.sqlConnection);
            command.Parameters.AddWithValue("@NumbMonth", (object)month);
            command.Parameters.AddWithValue("@NumbDays", (object)day);

            using (SqlDataReader reader = await command.ExecuteReaderAsync())
            {
                if (reader.HasRows) // если есть данные
                {                  
                   while (await reader.ReadAsync()) // построчно считываем данные
                    {
                        object name = reader.GetValue(0);
                        object sex = reader.GetValue(1);
                        object fullNameOrigin = reader.GetValue(2);
                        object detailName = reader.GetValue(3);
                        object referenceUrl = reader.GetValue(4);
                        Names names = new Names();
                        names.name = (String)(name);
                        names.sex = (String)(sex);
                        names.denotation = (String)(detailName);
                        names.origin = (String)(fullNameOrigin);
                        names.urlAdress = (String)(referenceUrl);
                        lstNames.Add(names);
                    }
                }
            }

            await sqlClass.SqlClose();
            return lstNames;
        }
    }
}
