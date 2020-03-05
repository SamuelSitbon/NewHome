using NewHome.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NewHome.dao
{
    public class DataAccess
    {
        public SqlConnection sqlConnection;
        public SqlDataReader sqlDataReader;
        public string errorMsg { get; set; }
        public DataAccess()
        {
            // On définit la chaine de connexion à la base, en passant par Outils -> Connexion à la base de données -> localhost/sqlExpress -> Avancées
            string connectionString = @"Data Source=localhost\sqlExpress;Initial Catalog=NewHome;Integrated Security=True";


            // Objet pour se connecter à la base de données
            sqlConnection = new SqlConnection(connectionString);
        }

        public bool getDataReader(string sqlQuery, SqlParameter[] sqlParameters)
        {
            // Objet pour exécuter la requête
            SqlCommand sqlCommand = new SqlCommand(sqlQuery, sqlConnection);
            sqlDataReader = null;
            bool isError = false;
            try
            {
                // On se connecte à la Base de Données
                sqlConnection.Open();

                // On exécute l'opétation sql qui nous renvoie un tableau
                // Les données sont stockées dans un objet de type DataReader
                
                if(sqlParameters != null && sqlParameters.Length > 0)
                {
                    sqlCommand.Parameters.AddRange(sqlParameters);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                }
                sqlDataReader = sqlCommand.ExecuteReader();
            }

            catch (Exception ex)
            {
                isError = true;
                errorMsg = ex.Message;
                throw ex;
            }
            return isError;
        }

        public bool executeQuery(string sqlQuery, SqlParameter[] sqlParameters)
        {
            {
                SqlCommand sqlCommand = new SqlCommand(sqlQuery, sqlConnection);
                bool isError = false;

                try
                {
                    sqlConnection.Open();

                    if (sqlParameters != null && sqlParameters.Length > 0)
                    {
                        sqlCommand.Parameters.AddRange(sqlParameters);
                        sqlCommand.CommandType = CommandType.StoredProcedure;
                    }
                    sqlCommand.ExecuteNonQuery();

                }

                catch (Exception ex)
                {
                    isError = true;
                    errorMsg = ex.Message;
                }
                return isError;
            }
        }
    }
}