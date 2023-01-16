using AppNames.Sql;
using Microsoft.Data.SqlClient;
namespace AppNames.SqlClass
{
    public class NamesToEditSql
    {
        public async Task<string> ReadToEdit(string name, string? urlAddr, string? notice, string login)
        {
            string sError = "";
            try
            {
            string sName;

            var sqlClass = await mySqlClass.CreateAsync();
            //здесь с запроса было переделано на хранимую процедуру, потому что
            //было не понятно, почему возникает ошибка преобразования параметра в 
            //NVARCHAR(4000). Оказалось, что движок MSSQL неявно приводит их
            //к данному типу: сюрпрайз :) решается в любом случае четкой подстановкой
            //значения DBNull.Value
            string commandTxt = "EXEC [NamesCatalog].[DBO].[InsertNamesEdit] "+
                  "@Names, @urlAdress, @Notice, @Login";
            SqlCommand command = new SqlCommand(commandTxt, sqlClass.sqlConnection);
            command.Parameters.AddWithValue("@Names", (object)name);
            if (String.IsNullOrEmpty(urlAddr))
                    { command.Parameters.AddWithValue("@urlAdress", (object)DBNull.Value); }
              else { command.Parameters.AddWithValue("@urlAdress", (object)urlAddr); }

             if (String.IsNullOrEmpty(notice))
                { command.Parameters.AddWithValue("@Notice", (object)DBNull.Value); }
                else { command.Parameters.AddWithValue("@Notice", (object)notice); }

            command.Parameters.AddWithValue("@Login", (object)login);
            command.CommandTimeout = 500;

            await command.ExecuteNonQueryAsync();

            await sqlClass.SqlClose();
            }
            catch(Exception e)
            {
                sError = "Ошибка: " + e.Message;
            }
            return sError;
        }
    }
}
