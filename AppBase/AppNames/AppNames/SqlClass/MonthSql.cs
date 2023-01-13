using AppNames.Classes;
using AppNames.Sql;
using Microsoft.Data.SqlClient;
using System;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace AppNames.SqlClass
{
    public class MonthSql
    {

        List<NamesOfMonth> lstNamesOfMonth = new List<NamesOfMonth>();

        public async Task<List<NamesOfMonth>> ReadNamesOfMonth(int? month)
        {
            

            if (month == null)
            { 
                DateTime dt = new DateTime();
                dt = DateTime.Today;
                month = dt.Month;
            };

            var sqlClass = await mySqlClass.CreateAsync();

            string commandTxt = "SELECT V1.[NumbOfMonth], V1.[NumbOfDay], " +
                                " V1.[Name], V1.[Sex], V1.[FullNameOrigin], " +
                                " V1.[DetailName], V1.[ReferenceUrl], " +
                                " V1.MonthCaption_1, V1.MonthCaption_2 " +
                                " FROM [NamesCatalog].[dbo].[NamesFullInfo] V1 " +
                                " WHERE V1.NumbOfMonth = @NumbOfMonth " +
                                " ORDER BY V1.[NumbOfDay], V1.[Name] ";
            SqlCommand command = new SqlCommand(commandTxt, sqlClass.sqlConnection);
            command.Parameters.AddWithValue("@NumbOfMonth", (object)month);
            command.CommandTimeout = 500;

            using (SqlDataReader reader = await command.ExecuteReaderAsync())
            {
                if (reader.HasRows) // если есть данные
                {
                    while (await reader.ReadAsync()) // построчно считываем данные
                    {
                        object numbMonth = reader.GetValue(0);
                        object numbDay = reader.GetValue(1);
                        object captionMonth = reader.GetValue(7);
                        object captionDayOfMonth = reader.GetValue(8);

                        object name = reader.GetValue(2);
                        object sex = reader.GetValue(3);
                        object fullNameOrigin = reader.GetValue(4);
                        object detailName = reader.GetValue(5);
                        object referenceUrl = reader.GetValue(6);

                        NamesOfMonth namesOfMonth = new NamesOfMonth();

                        namesOfMonth.numbMonth = Convert.ToInt32(numbMonth);
                        namesOfMonth.numbDay = Convert.ToInt32(numbDay);
                        namesOfMonth.captionMonth = (String)(captionMonth);
                        namesOfMonth.captionDayOfMonth = Convert.ToString(numbDay) + " " + (String)(captionDayOfMonth);
                        namesOfMonth.name = (String)(name);
                        namesOfMonth.sex = (String)(sex);
                        namesOfMonth.denotation = (String)(detailName);
                        namesOfMonth.origin = (String)(fullNameOrigin);
                        namesOfMonth.urlAdress = (String)(referenceUrl);
                        lstNamesOfMonth.Add(namesOfMonth);
                    }
                }
            }

            await sqlClass.SqlClose();
            return lstNamesOfMonth;
        }

    }
}
