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
    public partial class Reservations : System.Web.UI.Page
    {
        public Hebergement reservation;

        protected void Page_Load(object sender, EventArgs e)
        {
            int.TryParse(Request.QueryString["id"], out int id);
            reservation = new DaoHebergement().GetHebergement(id);

            if (reservation == null)
            {
                Response.Redirect("ListHebergements.aspx");
            }

        }
    }
}