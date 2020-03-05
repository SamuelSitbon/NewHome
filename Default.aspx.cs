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
    public partial class _Default : Page
    {
        public List<Hebergement> _carousel;
        public string departement { get { return this.ddlDepartement.SelectedValue; } }
        public string typeHebergement { get { return this.ddlTypeHebergement.SelectedValue; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            _carousel = (new DaoHebergement().GetHebergements().Take(5).ToList());

        }
        private List<Hebergement> LoadHebergements()
        {
            DaoHebergement daoHebergement = new DaoHebergement();
            return daoHebergement.GetHebergements();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string departement = ddlDepartement.SelectedValue;
            string typeHebergement = ddlTypeHebergement.SelectedValue;

            List<string> query = new List<string>();
            string url = "ListHebergements.aspx";

            if (departement != "")
            {
                query.Add("departement=" + departement);
            }

            if (typeHebergement != "")
            {
                query.Add("type=" + typeHebergement);
            }

            if (query.Count > 0)
            {
                url += "?" + String.Join("&", query);
            }

            Response.Redirect(url);
        }

        //protected void Carousel_Click(object sender, EventArgs e)
        //{
        //    LinkButton btn = (LinkButton)sender;
        //    int Id = Convert.ToInt32(btn.CommandArgument);
        //    Hebergement hebergement = _carousel.Single(x => x.IdHebergement == Id);

        //    if (!_carousel.Contains(hebergement))
        //    {
        //        _carousel.Add(hebergement);
        //    }

        //    Session[Constants.SESSION_DETAIL] = hebergement;
        //    Response.Redirect("DetailHebergement.aspx");
        //}
    }
}