using System;
using System.Collections.Generic;
using NewHome.Entities;
using NewHome.Utilities;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace NewHome
{
    public partial class ClientConnected : System.Web.UI.MasterPage
    {
        public Client client;
        protected void Page_Load(object sender, EventArgs e)
        {

            if(Session[Constants.SESSION_CLIENT] != null)
            {
                client = (Client)Session[Constants.SESSION_CLIENT];
            }
            else
            {
                Response.Redirect("Connexion.aspx");
            }

            int fav = 0;
            if (client.Favoris != null)
            {
                fav = client.Favoris.Count;
            }

            iconFav.Text = "" + fav;

            if (client.Type == true)
            {
                Create_Hebergement.Text = "<a class=\"nav-item nav-link\" runat=\"server\" href=\"~/ ListHebergements\"><i class=\"fas fa-plus-square\"></i>Ajouter un Hébergement</a>";
            }
        }
    }
}