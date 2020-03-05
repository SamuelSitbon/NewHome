using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using NewHome.Entities;

namespace NewHome
{
    public partial class ExempleConnexion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // On définit la chaine de connexion à la base, en passant par Outils -> Connexion à la base de données -> localhost/sqlExpress -> Avancées
            string connectionString = @"Data Source=localhost\sqlExpress;Initial Catalog=NewHome;Integrated Security=True";

            // Requête sql à effectuer
            string sqlString = "select * from hebergement";

            // Objet pour se connecter à la base de données
            SqlConnection sqlConnection = new SqlConnection(connectionString);

            // Objet pour exécuter la requête
            SqlCommand sqlCommand = new SqlCommand(sqlString, sqlConnection);

            try
            {
                // On se connecte à la Base de Données
                sqlConnection.Open();

                // On exécute l'opétation sql qui nous renvoie un tableau
                // Les données sont stockées dans un objet de type DataReader
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

                //On crée une liste d'hébergements
                List<Hebergement> hebergements = new List<Hebergement>();
                while (sqlDataReader.Read())
                {
                    string nom = sqlDataReader["Nom"].ToString();
                    int id = Convert.ToInt32(sqlDataReader["IdHebergement"]);
                    Hebergement hebergement = new Hebergement
                    {
                        Nom = nom,
                        IdHebergement = id
                    };

                    hebergements.Add(hebergement);
                }

                sqlDataReader.Close();
                sqlConnection.Close();

                gvwHebergements.DataSource = hebergements;
                gvwHebergements.DataBind();
            }
            catch (Exception)
            {

            }
        }
    }
}