using NewHome.dao;
using NewHome.Entities;
using NewHome.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace NewHome
{
    public partial class CreerCompte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void CreerButton_Click(object sender, EventArgs e)
        {
            //On récupère et assigne a des variables le contenu du formulaire sur le click du bouton Envoyer
            string nom = txtNom.Text;
            string prenom = txtPre.Text;
            string telephone = txtTl.Text;
            string login = txtLog.Text;
            string password = txtPwd.Text;
            string email = txtEmail.Text;
            bool type = Request.Form["Type"] == "proprietaire";
            string nomAdresse = "Logement";
            string numero = txtNumero.Text;
            string voie = txtVoie.Text;
            string codePostal = txtCodeP.Text;
            string ville = txtVil.Text;

            //string nomAdresse = "Logement";
            //string numero = "45";
            //string voie = txt;

            if (nom.Length >= 3 && !nom.Contains("attack"))
            {
                // On initialise un objet Client client vide
                Client client = new Client
                {
                    //Assignations de valeurs aux propriétées de l'objet Client à client
                    Nom = nom,
                    Prenom = prenom,
                    Telephone = telephone,
                    Login = login,
                    Password = password,
                    Email = email,
                    Type = type
                };

                // On initialise un objet Adresse adresse vide
                Adresse adresse = new Adresse
                {
                    //Assignations de valeurs aux propriétées de l'objet Client à client
                    NomAdresse = nomAdresse,
                    Numero = numero,
                    Voie = voie,
                    CodePostal = codePostal,
                    Ville = ville
                };

                //client.Adresses.Add(adresse);


                //crée une propriétée coté serveur qui contient client1
                Session[Constants.SESSION_CLIENT] = client;

                //DaoClient daoClient = new DaoClient();
                //daoClient.createClient(client, adresse);
                //Le tout en une seule ligne :
                (new DaoClient()).CreateClient(client, adresse);
            }
            //Session[Constants.SESSION_CLIENT] = Session["SESSION_CLIENT"] -> Permet de centraliser les constantes dans un dossier Utilities -> Constants
            if (Session[Constants.SESSION_CLIENT] == null)
            {
                Response.Redirect("CreerCompte.aspx");
            }
            else
            {
                Response.Redirect("Compte.aspx");
            }
        }
    }
}