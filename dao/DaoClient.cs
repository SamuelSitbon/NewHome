using NewHome.Entities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NewHome.dao
{
    public class DaoClient : DataAccess
    {
        public DaoClient() : base()
        {

        }


        public Client GetClient(string login, string password)
        {
            Client client = null;
            try
            {
                SqlParameter[] sqlParameters = new SqlParameter[2];

                SqlParameter paramLogin = new SqlParameter
                {
                    ParameterName = "@Login",
                    Value = login
                };
                sqlParameters[0] = paramLogin;

                SqlParameter paramPassword = new SqlParameter
                {
                    ParameterName = "@Password",
                    Value = password
                };
                sqlParameters[1] = paramPassword;



                // On exécute l'opétation sql qui nous renvoie un tableau
                // Les données sont stockées dans un objet de type DataReader
                base.getDataReader("sp_getClient ", sqlParameters);

                if (base.sqlDataReader.HasRows)
                {
                    client = new Client();
                }


                while (base.sqlDataReader.Read())
                {
                    client.IdClient = Convert.ToInt32(sqlDataReader["IdClient"]);
                    client.Nom = sqlDataReader["Nom"].ToString();
                    client.Prenom = sqlDataReader["Prenom"].ToString();
                    client.Email = sqlDataReader["Email"].ToString();
                    client.Telephone = sqlDataReader["Telephone"].ToString();
                    client.Login = sqlDataReader["Login"].ToString();
                    client.Password = sqlDataReader["Password"].ToString();
                    client.Type = Convert.ToBoolean(sqlDataReader["Type"]);
                }

                base.sqlDataReader.Close();
                base.sqlConnection.Close();

            }

            catch (Exception ex)
            {
                throw ex;
            }

            if (client != null)
            {
                client.Favoris = GetFavori(client.IdClient);
            }
            return client;
        }

        public bool CreateClient(Client client, Adresse adresse)
        {
            bool isError = false;
            try
            {
                //Création d'un tableau comprenant les X paramatères
                SqlParameter[] sqlParameters = {
                    new SqlParameter("@Nom", client.Nom),
                    new SqlParameter("@Prenom", client.Prenom),
                    new SqlParameter("@Login", client.Login),
                    new SqlParameter("@Password", client.Password),
                    new SqlParameter("@Email", client.Email),
                    new SqlParameter("@Telephone", client.Telephone),
                    new SqlParameter("@Type", client.Type),
                    new SqlParameter("@NomAdresse", adresse.NomAdresse),
                    new SqlParameter("@Numero", adresse.Numero),
                    new SqlParameter("@Voie", adresse.Voie),
                    new SqlParameter("@CodePostal", adresse.CodePostal),
                    new SqlParameter("@Ville", adresse.Ville),
                };

                base.executeQuery("sp_createClient", sqlParameters);

                base.sqlConnection.Close();
            }
            catch (Exception ex)
            {
                isError = true;
                errorMsg = ex.Message;
                throw ex;
            }
            return isError;
        }

        public bool UpdateClient(int idClient, string nom, string prenom, string email, string telephone)
        {
            bool isError = false;
            try
            {
                //Création d'un tableau comprenant les X paramatères
                SqlParameter[] sqlParameters = {
                    new SqlParameter("@IdClient", idClient),
                    new SqlParameter("@Nom", nom),
                    new SqlParameter("@Prenom", prenom),
                    new SqlParameter("@Email", email),
                    new SqlParameter("@Telephone", telephone),
                };

                base.executeQuery("sp_updateClient", sqlParameters);

                base.sqlConnection.Close();
            }
            catch (Exception ex)
            {
                isError = true;
                errorMsg = ex.Message;
                throw ex;
            }
            return isError;
        }

        public List<Hebergement> GetFavori(int IdClient)
        {
            List<Hebergement> favoris = new List<Hebergement>();
            try
            {
                SqlParameter[] sqlParametersFav = {
                    new SqlParameter("@IdClient", IdClient)
                };

                base.getDataReader("sp_getFavoris", sqlParametersFav);
                if (base.sqlDataReader.HasRows)
                {
                    while (base.sqlDataReader.Read())
                    {
                        Hebergement hebergement = new Hebergement()
                        {
                            Nom = sqlDataReader["Nom"].ToString(),
                            IdHebergement = Convert.ToInt32(sqlDataReader["IdHebergement"]),
                            Photo = sqlDataReader["Photo"].ToString(),
                            Type = sqlDataReader["Type"].ToString(),
                            Description = sqlDataReader["Description"].ToString(),
                            PrixDeBase = Convert.ToDecimal(sqlDataReader["PrixDeBase"])
                        };
                        favoris.Add(hebergement);
                    }
                }
                base.sqlDataReader.Close();
                base.sqlConnection.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return favoris;
        }

        public bool AddFavoris(Client client, Hebergement hebergement, string commentaire)
        {
            bool isError = false;
            try
            {
                //Création d'un tableau comprenant les X paramatères
                SqlParameter[] sqlParameters = {
                    new SqlParameter("@IdClient", client.IdClient),
                    new SqlParameter("@IdHebergement", hebergement.IdHebergement),
                    new SqlParameter("@Commentaire", commentaire),
                };

                base.executeQuery("sp_addFavoris", sqlParameters);

                base.sqlConnection.Close();
            }
            catch (Exception ex)
            {
                isError = true;
                errorMsg = ex.Message;
                throw ex;
            }
            if (!isError)
            {
                client.Favoris.Add(hebergement);
            }
            return isError;
        }

        public bool RemoveFavoris(Client client, Hebergement hebergement)
        {
            bool isError = false;
            try
            {
                //Création d'un tableau comprenant les X paramatères
                SqlParameter[] sqlParameters = {
                    new SqlParameter("@IdClient", client.IdClient),
                    new SqlParameter("@IdHebergement", hebergement.IdHebergement),
                };

                base.executeQuery("sp_removeFavoris", sqlParameters);

                base.sqlConnection.Close();
            }
            catch (Exception ex)
            {
                isError = true;
                errorMsg = ex.Message;
                throw ex;
            }
            if (!isError)
            {
                client.Favoris.Remove(hebergement);
            }
            return isError;
        }
    }
}