using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NewHome.Entities
{
    public class Adresse
    {
        public int IdAdresse { get; set; }
        public string NomAdresse { get ; set; }
        public string Numero { get; set; }
        public string Voie { get; set; }
        public string CodePostal { get; set; }
        public string Ville { get; set; }
    }
}