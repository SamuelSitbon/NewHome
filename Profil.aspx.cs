using NewHome.dao;
using NewHome.Entities;
using NewHome.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewHome
{
    public partial class Profil : System.Web.UI.Page
    {
        public Client client;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Constants.SESSION_CLIENT] != null)
            {
                client = (Client)Session[Constants.SESSION_CLIENT];
            }
            else
            {
                Response.Redirect("Connexion.aspx");
            }

            if (!IsPostBack)
            {
                txtNom.Text = client.Nom;
                txtPrenom.Text = client.Prenom;
                txtEmail.Text = client.Email;
                txtTelephone.Text = client.Telephone;
                txtLogin.Text = client.Login;
                txtPassword.Text = client.Password;
            }
        }

        protected void UpdateProfil_Click(object sender, EventArgs e)
        {
            int Id = client.IdClient;
            string Nom = txtNom.Text;
            string Prenom = txtPrenom.Text;
            string Email = txtEmail.Text;
            string Telephone = txtTelephone.Text;
            
            bool error = new DaoClient().UpdateClient(Id, Nom, Prenom, Email, Telephone);

            if (!error)
            {
                client.Nom = Nom;
                client.Prenom = Prenom;
                client.Email = Email;
                client.Telephone = Telephone;
            }

            Response.Redirect("Profil.aspx");
        }
    }
}