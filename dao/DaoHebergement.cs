using NewHome.Entities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NewHome.dao
{
    public class DaoHebergement : DataAccess
    {
        
        public DaoHebergement() : base()
        {
        }


        public Hebergement GetHebergement(int id)
        {
            Hebergement hebergement = null;

            try
            {
                SqlParameter[] sqlParameters = { new SqlParameter("@IdHebergement", id) };

                // On exécute l'opération sql qui nous renvoie un tableau
                // les données sont stockées dans un objet de type DataReader
                base.getDataReader("sp_getHebergement", sqlParameters);

                // On créé une liste d'hébergements
                if (base.sqlDataReader.HasRows)
                {
                    hebergement = new Hebergement();
                }

                while (base.sqlDataReader.Read())
                {
                    hebergement.IdHebergement = Convert.ToInt32(sqlDataReader["IdHebergement"]);
                    hebergement.Nom = sqlDataReader["Nom"].ToString();
                    hebergement.Photo = sqlDataReader["Photo"].ToString();
                    hebergement.Type = sqlDataReader["Type"].ToString();
                    hebergement.Description = sqlDataReader["Description"].ToString();
                    hebergement.PrixDeBase = Convert.ToDecimal(sqlDataReader["PrixDeBase"]);

                    hebergement.Adresse = new Adresse()
                    {
                        NomAdresse = sqlDataReader["NomAdresse"].ToString(),
                        Numero = sqlDataReader["Numero"].ToString(),
                        Voie = sqlDataReader["Voie"].ToString(),
                        CodePostal = sqlDataReader["CodePostal"].ToString(),
                        Ville = sqlDataReader["Ville"].ToString()
                    };

                    hebergement.Client = new Client()
                    {
                        Nom = sqlDataReader["NomClient"].ToString(),
                        Prenom = sqlDataReader["Prenom"].ToString(),
                        Login = sqlDataReader["Login"].ToString(),
                        Password = sqlDataReader["Password"].ToString(),
                        Email = sqlDataReader["Email"].ToString(),
                        Telephone = sqlDataReader["Telephone"].ToString(),
                        Type = (bool)sqlDataReader["Type"]
                    };
                }

                base.sqlDataReader.Close();
                base.sqlConnection.Close();
            }
            catch (Exception)
            {
            }

            return hebergement;
        }

        public List<Hebergement> GetHebergements()
        {
            return GetHebergements("", "");
        }

        public List<Hebergement> GetHebergements(string departement, string typeHebergement)
        {

            List<Hebergement> hebergements = null;
            List<SqlParameter> sqlParameters = new List<SqlParameter>();

            if (!string.IsNullOrEmpty(departement))
            {
                sqlParameters.Add(new SqlParameter("@departement", departement));
            }

            if (!string.IsNullOrEmpty(typeHebergement))
            {
                sqlParameters.Add(new SqlParameter("@typeHebergement", typeHebergement));
            }


            try
            {
                // On exécute l'opétation sql qui nous renvoie un tableau
                // Les données sont stockées dans un objet de type DataReader
                base.getDataReader("sp_getHebergements", sqlParameters.ToArray());

                if (base.sqlDataReader.HasRows)
                {
                    hebergements = new List<Hebergement>();

                }


                while (base.sqlDataReader.Read())
                {
                    Hebergement hebergement = new Hebergement
                    {
                        Nom = sqlDataReader["Nom"].ToString(),
                        IdHebergement = Convert.ToInt32(sqlDataReader["IdHebergement"]),
                        Photo = sqlDataReader["Photo"].ToString(),
                        Type = sqlDataReader["Type"].ToString(),
                        Description = sqlDataReader["Description"].ToString(),
                        PrixDeBase = Convert.ToDecimal(sqlDataReader["PrixDeBase"])
                };

                    hebergements.Add(hebergement);
                }

                base.sqlDataReader.Close();
                base.sqlConnection.Close();

            }

            catch (Exception)
            {

            }
            return hebergements;
        }
    }
}