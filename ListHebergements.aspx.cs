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
    public partial class ListHebergements : System.Web.UI.Page
    {
        Client client;
        private List<Hebergement> _hebergements;
        protected void Page_Load(object sender, EventArgs e)
        {
            string departement = "";
            string typeHebergement = "";
            //if (PreviousPage != null)
            //{
            //    DropDownList ddlDepartement = (DropDownList)PreviousPage.FindControl("ddlDepartement");
            //    DropDownList ddlTypeHebergement = (DropDownList)PreviousPage.FindControl("ddlTypeHebergement");

            //    if (ddlDepartement != null && !string.IsNullOrEmpty(ddlDepartement.SelectedValue))
            //    {
            //        departement = ddlDepartement.SelectedValue;
            //    }

            //    if (ddlTypeHebergement != null && !string.IsNullOrEmpty(ddlTypeHebergement.SelectedValue))
            //    {
            //        typeHebergement = ddlTypeHebergement.SelectedValue;
            //    }  
            //}
            client = (Client)Session[Constants.SESSION_CLIENT];
            _hebergements = LoadHebergements(departement, typeHebergement);
            if (!IsPostBack)
            {
                lvwHebergement.DataSource = _hebergements;
                lvwHebergement.DataBind();
            }
        }

        private List<Hebergement> LoadHebergements(string departement, string typeHebergement)
        {
            DaoHebergement daoHebergement = new DaoHebergement();
            return daoHebergement.GetHebergements(departement, typeHebergement);
        }

        protected void lvwHebergement_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dtpHebergement.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            lvwHebergement.DataSource = _hebergements;
            lvwHebergement.DataBind();

        }

        protected void FavLinkButton_Click(object sender, EventArgs e)
        {
            if (client == null)
            {
                Response.Redirect("Connexion.aspx");
            }

            LinkButton btn = (LinkButton)sender;
            int Id = Convert.ToInt32(btn.CommandArgument);
            Hebergement hebergement = _hebergements.Single(x => x.IdHebergement == Id);

            if (!client.Favoris.Contains(hebergement))
            {
                new DaoClient().AddFavoris(client, hebergement, "");
            }
            Response.Redirect("ListHebergements.aspx");
        }

        //protected void LinkDetail_Click(object sender, EventArgs e)
        //{
        //    LinkButton btn = (LinkButton)sender;
        //    int Id = Convert.ToInt32(btn.CommandArgument);
        //    Hebergement hebergement = _hebergements.Single(x => x.IdHebergement == Id);

        //    if (!_hebergements.Contains(hebergement))
        //    {
        //        _hebergements.Add(hebergement);
        //    }

        //    Session[Constants.SESSION_DETAIL] = hebergement;
        //    Response.Redirect("DetailHebergement.aspx");
        //}
    }
}