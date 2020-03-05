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
    public partial class Connexion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ConnexionButton_Click(object sender, EventArgs e)
        {
            DaoClient daoClient = new DaoClient();
            bool isError = false;
            string errorMsg = "";

            try
            {
                Client client = daoClient.GetClient(login.Text, password.Text);
                if (client != null)
                {
                    Session[Constants.SESSION_CLIENT] = client;
                    Response.Redirect("Profil.aspx");
                }
            }
            catch (Exception ex)
            {
                isError = true;
                errorMsg = ex.Message;
            }
            
            if (isError)
            {
                connexionError.Text = "<div class=\"alert alert-warning\">" + errorMsg + "</div>";
            }
            
            else
            {
                connexionError.Text = "<div class =\"alert alert-danger\">Identifiant ou mot de passe incorrect</div>";
            }
        }
    }
}