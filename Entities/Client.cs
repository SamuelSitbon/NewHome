using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NewHome.Entities
{
    public class Client
    {
        public int IdClient { get; set; }
        public string Nom { get; set; }
        public string Prenom { get; set; }
        public string Telephone { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public bool Type { get; set; }
        public List<Adresse> Adresses { get; set; }
        public List<Hebergement> Favoris { get; set; }

        public Client()
        {
            Adresses = new List<Adresse>();
            Favoris = new List<Hebergement>();
        }


    }
}