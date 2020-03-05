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
    public partial class Favoris : System.Web.UI.Page
    {
        private Client client;
        protected void Page_Load(object sender, EventArgs e)
        {
            client = (Client)Session[Constants.SESSION_CLIENT];
            if (client != null)
            {
                if (client.Favoris != null && !IsPostBack)
                {
                    gdvHebergement.DataSource = client.Favoris;
                    gdvHebergement.DataBind();
                }
                if (client.Favoris == null || client.Favoris.Count == 0)
                {
                    noFav.Text = "<div class =\"alert alert-danger\">Vous n'avez aucun favori</div>";
                }
            }
        }

        protected void bSuppr_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int Id = Convert.ToInt32(btn.CommandArgument);

            Hebergement favori = client.Favoris.Single(x => x.IdHebergement == Id);
            new DaoClient().RemoveFavoris(client, favori);
            Response.Redirect("Favoris.aspx");

        }
    }
}
