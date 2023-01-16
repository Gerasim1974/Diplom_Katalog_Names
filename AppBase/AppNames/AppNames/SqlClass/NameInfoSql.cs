using AppNames.Classes;
using AppNames.Sql;
using Microsoft.Data.SqlClient;
namespace AppNames.SqlClass
{
    public class NameInfoSql
    {
        Names names = new Names();
        public async Task<Names> ReadNames(string? _name)
        {
            if (_name == null) { _name = ""; }
            string name = _name.Trim();

            var sqlClass = await mySqlClass.CreateAsync();

            string commandTxt;

            if (_name.Length == 0 )
            {
              commandTxt = "SELECT TOP 1 [Name], [Sex], [FullNameOrigin], [DetailName], [ReferenceUrl] " +
                     " FROM[NamesCatalog].[dbo].[NamesFullInfo] " +
                     " ORDER BY [Name]";
            }
            else 
            { 
              commandTxt = "SELECT [Name], [Sex], [FullNameOrigin], [DetailName], [ReferenceUrl] " +
                   " FROM[NamesCatalog].[dbo].[NamesFullInfo] " +
                   " WHERE [Name] = @Name " +
                   " ORDER BY [Name]";
            }

            SqlCommand command = new SqlCommand(commandTxt, sqlClass.sqlConnection);
            if (_name.Length != 0)
              { command.Parameters.AddWithValue("@Name", (object)name); }

            command.CommandTimeout = 500;

            using (SqlDataReader reader = await command.ExecuteReaderAsync())
            {
                if (reader.HasRows) // если есть данные
                {
                    await reader.ReadAsync();
                        object objName = reader.GetValue(0);
                        object objSex = reader.GetValue(1);
                        object objFullNameOrigin = reader.GetValue(2);
                        object objDetailName = reader.GetValue(3);
                        object objReferenceUrl = reader.GetValue(4);

                        names.name = (String)(objName);
                        names.sex = (String)(objSex);
                        names.denotation = (String)(objDetailName);
                        names.origin = (String)(objFullNameOrigin);
                        names.urlAdress = (String)(objReferenceUrl);
                }
            }

            await sqlClass.SqlClose();
            return names;
        }

        public async Task<string> ReadAngelDays(string? _name, string separator)
        {
            if (_name == null) { _name = ""; }
            string name = _name.Trim();
            string result = "";

            var sqlClass = await mySqlClass.CreateAsync();

            string commandTxt;

            if (_name.Length != 0)
            {
                commandTxt = "EXEC [NamesCatalog].[dbo].[AngelDayToNames] @Name, @Separator";
                SqlCommand command = new SqlCommand(commandTxt, sqlClass.sqlConnection);
                command.Parameters.AddWithValue("@Name", (object)name);
                command.Parameters.AddWithValue("@Separator", (object)separator);

                command.CommandTimeout = 500;

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    if (reader.HasRows) // если есть данные
                    {
                        await reader.ReadAsync();
                        object objAngelDay = reader.GetValue(0);
                        result = (String)(objAngelDay);
                    }
                }               
            }
            await sqlClass.SqlClose();
            return result;
        }
    }
}
  
