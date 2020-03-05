using NewHome.Entities;
using NewHome.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewHome
{
    public partial class SiteMaster : MasterPage
    {
        public Client client;

        protected void Page_Load(object sender, EventArgs e)
        {
            client = (Client)Session[Constants.SESSION_CLIENT];

            StringBuilder ltlConnexionTxt = new StringBuilder();
            StringBuilder ltlFavorisTxt = new StringBuilder();
            StringBuilder ltlReservationsTxt = new StringBuilder();
            StringBuilder ltlDeconnexionTxt = new StringBuilder();


            if (client == null)
            {
                ltlConnexionTxt.AppendLine("<a class=\"nav-item nav-link" + (Request.Url.AbsolutePath=="/CreerCompte"?" linkactive":"") + "\" href =\"CreerCompte\">");
                ltlConnexionTxt.AppendLine("<i class=\"fas fa-align-justify\">");
                ltlConnexionTxt.AppendLine("</i> Inscription</a>");
                ltlConnexionTxt.AppendLine("<a class=\"nav-item nav-link" + (Request.Url.AbsolutePath == "/Connexion" ? " linkactive" : "") + "\" href=\"Connexion\">");
                ltlConnexionTxt.AppendLine("<i class=\"fas fa-sign-in-alt\"></i> Connexion</a>");
            }
            else
            {
                int fav = 0;
                if (client.Favoris != null)
                {
                    fav = client.Favoris.Count;
                }

                ltlFavorisTxt.AppendLine("<a class=\"nav-item nav-link\" href=\"Favoris\">");
                ltlFavorisTxt.AppendLine("<i class=\"fa fa-heart\">");
                ltlFavorisTxt.AppendLine("<span class=\"badge badge-danger\">");
                ltlFavorisTxt.AppendLine(fav.ToString());
                ltlFavorisTxt.AppendLine("</span></i>Favoris</a>");

                ltlDeconnexionTxt.AppendLine("<div class=\"navbar-nav nav-item dropdown ml-auto\">");
                ltlDeconnexionTxt.AppendLine("<a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdownMenuLink2\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">");
                ltlDeconnexionTxt.AppendLine("<i class=\"fa fa-user\"></i>");
                ltlDeconnexionTxt.AppendLine(client.Prenom + " " + client.Nom + "</a>");
                ltlDeconnexionTxt.AppendLine("<div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdownMenuLink2\">");
                ltlDeconnexionTxt.AppendLine("<a class=\"dropdown-item\" href=\"Profil.aspx\">Mon Profil</a>");
                ltlDeconnexionTxt.AppendLine("<a class=\"dropdown-item\" href=\"Deconnexion.aspx\"> Déconnexion</a>");
                ltlDeconnexionTxt.AppendLine("</div></div>");
                ;
            }
            ltlFavoris.Text = ltlFavorisTxt.ToString();
            ltlConnexion.Text = ltlConnexionTxt.ToString();
            ltlReservations.Text = ltlReservationsTxt.ToString();
            ltlDeconnexion.Text = ltlDeconnexionTxt.ToString();
        }
    }
}


                    
                        
                    
                        
                   
                    