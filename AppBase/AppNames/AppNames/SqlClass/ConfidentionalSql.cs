using AppNames.Classes;
using AppNames.Sql;
using Microsoft.Data.SqlClient;
using System;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace AppNames.SqlClass
{
    public class ConfidentionalSql
    {
        public async Task<ConfidentionalToView> CreateNewAccount(ConfidentionalToView? _confidentionalToView)
        {
            ConfidentionalToView confidentionalToView = new ConfidentionalToView();
            confidentionalToView = _confidentionalToView;

            string login = _confidentionalToView.login;
            string password = _confidentionalToView.password;
            string email = _confidentionalToView.email;
            Boolean succsess = false;
            Boolean toAction = false;
            Confidentional confidentional = new Confidentional();

            if (
                 (String.IsNullOrEmpty(login) || String.IsNullOrEmpty(password) || String.IsNullOrEmpty(email)) &&
                 (confidentionalToView.RegForm)
                )
                {

                confidentionalToView.Success = false;
                confidentionalToView.StrStatusFooter = "Недостаточно данных для авторизации";
                }
             else 
            { 
                login = login.Trim();
                password = password.Trim();
                email = email.Trim();
                toAction = true; 
            }
            
            if (toAction)
            {
                    var sqlClass = await mySqlClass.CreateAsync();
                    string sError = String.Empty; 
                    login = confidentional.Crypt(login, 17) ;
                    password = confidentional.Crypt(password, 21);
                    email = confidentional.Crypt(password, 25);
                    string commandTxt = "EXEC [NamesCatalog].[dbo].[AddAuth] @Login, @Password, @Email";
                    SqlCommand command = new SqlCommand(commandTxt, sqlClass.sqlConnection);
                    command.Parameters.AddWithValue("@Login", (object)login);
                    command.Parameters.AddWithValue("@Password", (object)password);
                    command.Parameters.AddWithValue("@Email", (object)email);
                    command.CommandTimeout = 300;

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                    {
                        if (reader.HasRows) // если есть данные
                        {
                            while (await reader.ReadAsync()) // построчно считываем данные
                            {
                                object error = reader.GetValue(0);
                                sError = Convert.ToString(error);
                                if (String.IsNullOrEmpty(sError))
                                {
                                    confidentionalToView.Success = true;
                                    confidentionalToView.StrStatusFooter = "Вы вошли как "+confidentionalToView.login;
                                }
                                else
                                {
                                    confidentionalToView.Success = false;
                                    confidentionalToView.StrStatusFooter = "Ошибка входа: "+sError;
                                }
                            }
                        }
                    }


                await sqlClass.SqlClose();
            }
            return confidentionalToView;
        }

        public async Task<ConfidentionalToView> AutorizNewAccount(ConfidentionalToView? _confidentionalToView)
        {
            ConfidentionalToView confidentionalToView = new ConfidentionalToView();
            confidentionalToView = _confidentionalToView;
            string login = _confidentionalToView.login;
            string password = _confidentionalToView.password;
            Boolean succsess = false;
            Boolean toAction = false;
            Confidentional confidentional = new Confidentional();

            if 
                (String.IsNullOrEmpty(login) || String.IsNullOrEmpty(password))
            {
                confidentionalToView.Success = false;
                confidentionalToView.StrStatusFooter = "Недостаточно данных для авторизации";
            }
            else 
            { 
                toAction = true;
                login = login.Trim();
                password = password.Trim();
            }

            if (toAction)
            {
                var sqlClass = await mySqlClass.CreateAsync();
                login = confidentional.Crypt(login, 17);
                password = confidentional.Crypt(password, 21);
                string commandTxt = "SELECT COUNT([AuthId]) FROM [NamesCatalog].[dbo].[Auth] " +
                           " WHERE UPPER([Login]) = UPPER(@Login) AND [password] = @Password ";
                SqlCommand command = new SqlCommand(commandTxt, sqlClass.sqlConnection);
                command.Parameters.AddWithValue("@Login", (object)login);
                command.Parameters.AddWithValue("@Password", (object)password);
                command.CommandTimeout = 300;

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    if (reader.HasRows) // если есть данные
                    {
                        await reader.ReadAsync(); // построчно считываем данные
                        object iCount = reader.GetValue(0);
                        if (Convert.ToInt32(iCount) == 0)
                            {
                                confidentionalToView.Success = false;
                                confidentionalToView.StrStatusFooter = "Неправильный логин / пароль";
                            }
                            else
                            {
                               confidentionalToView.Success = true;
                               confidentionalToView.StrStatusFooter = "Вы вошли как " + confidentionalToView.login; 
                            }
                    }
                }
                await sqlClass.SqlClose();
            }

            return confidentionalToView;
        }
    }
}
