using NewHome.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewHome
{
    public partial class Deconnexion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Constants.SESSION_CLIENT] != null)
            {
                Session[Constants.SESSION_CLIENT] = null;
                Response.Redirect("Default.aspx");
            }
        }
    }
}