using Microsoft.Data.SqlClient;
using System.Data;

namespace AppNames.Sql
{
    public class mySqlClass
    {
        private string connectionString;
        private SqlConnection connection;
        private string errorConnection;
        private mySqlClass()
        {

        }

        public string ErrorConnection { get; set; }
        public SqlConnection sqlConnection { get => connection; }

        public static async Task<mySqlClass> CreateAsync()
        {
            var sqlInstance = new mySqlClass();
            await sqlInstance.InitAsync();
            return sqlInstance;           
        }

        private async Task InitAsync()
        {
            connectionString = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=NamesCatalog;Data Source=ПК-ПК\\MSSQLSERVER_2022";
            ErrorConnection = "";
            SqlConnect();
        }


        public async Task SqlConnect()
        {
            
            // Создание подключения
            connection = new SqlConnection(connectionString);
            try
            {
                // Открываем подключение
                await connection.OpenAsync();
                ErrorConnection = "";
            }
            catch (SqlException ex)
            {
                ErrorConnection = ex.Message;
            }
        }

        public async Task SqlClose()
        {
            if (connection.State == ConnectionState.Open)
            {
                await connection.CloseAsync();
            }
        }



    
    }
}
