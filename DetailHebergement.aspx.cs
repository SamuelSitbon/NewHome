using IdentityModel.Client;
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
    public partial class DetailHebergement : System.Web.UI.Page
    {
        Client client;
        public Hebergement detail;

        protected void Page_Load(object sender, EventArgs e)
        {
            client = (Client)Session[Constants.SESSION_CLIENT];
            int.TryParse(Request.QueryString["id"], out int id);
            detail = new DaoHebergement().GetHebergement(id);

            if (detail == null)
            {
                Response.Redirect("ListHebergements.aspx");
            }

        }

        protected void FavLinkButton2_Click(object sender, EventArgs e)
        {
            if (client == null)
            {
                Response.Redirect("Connexion.aspx");
            }


            if (!client.Favoris.Contains(detail))
            {
                new DaoClient().AddFavoris(client, detail, "");
            }
            Response.Redirect("DetailHebergement.aspx");
        }
    }
}