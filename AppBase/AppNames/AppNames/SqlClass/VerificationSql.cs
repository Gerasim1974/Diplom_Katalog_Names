using AppNames.Classes;
using AppNames.Sql;
using Microsoft.Data.SqlClient;

namespace AppNames.SqlClass
{
    public class VerificationSql
    {
        public async Task<List<Verification>> ReadNames()
        {
            List<Verification> lstVerification = new List<Verification>();
            var sqlClass = await mySqlClass.CreateAsync();
            string commandTxt = "SELECT [Names], [urlAdress], [Notice], [Login], [dateInsert] " +
                  " FROM [NamesCatalog].[dbo].[NamesToEdit] " +
                  " ORDER BY [dateInsert]";
            SqlCommand command = new SqlCommand(commandTxt, sqlClass.sqlConnection);
            command.CommandTimeout = 500;

            using (SqlDataReader reader = await command.ExecuteReaderAsync())
            {
                if (reader.HasRows) // если есть данные
                {
                    while (await reader.ReadAsync()) // построчно считываем данные
                    {
                        object objNames = reader.GetValue(0);
                        object objurlAdress = reader.GetValue(1);
                        object objNotice = reader.GetValue(2);
                        object objLogin = reader.GetValue(3);
                        object objDateInsert = reader.GetValue(4);

                        Verification verification = new Verification();
                        verification.login = Convert.ToString(objLogin);
                        verification.name = Convert.ToString(objNames);
                        verification.urlAdress = Convert.ToString(objurlAdress);
                        verification.Notice = Convert.ToString(objNotice);
                        verification.dInsert = Convert.ToDateTime(objDateInsert);

                        lstVerification.Add(verification);
                    }
                }
            }
            await sqlClass.SqlClose();
            return lstVerification;
        }
    }
}
