using NewHome.dao;
using NewHome.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewHome
{
    public partial class Paiement : System.Web.UI.Page
    {
        public Hebergement paiement;

        protected void Page_Load(object sender, EventArgs e)
        {
            int.TryParse(Request.QueryString["id"], out int id);
            paiement = new DaoHebergement().GetHebergement(id);

            if (paiement == null)
            {
                Response.Redirect("ListHebergements.aspx");
            }

        }
    }
}