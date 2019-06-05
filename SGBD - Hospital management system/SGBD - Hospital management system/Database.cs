using Oracle.ManagedDataAccess;

namespace SGBD___Hospital_management_system
{
    public static class Database
    {
        static string username = "student";
        static string password = "STUDENT";

        public static string connectionString = string.Format("User Id={0}; password={1}; Data Source=localhost:1521/xe", username, password);

    }
}
