using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewHome.Entities;

namespace NewHome
{
    public partial class Compte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClientConnected masterPage = (ClientConnected)Page.Master;
            Client client = masterPage.client;
        }
    }
}