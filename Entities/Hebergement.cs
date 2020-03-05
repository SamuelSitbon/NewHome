using System;

namespace NewHome.Entities
{
    public class Hebergement : IEquatable<Hebergement>
    {
        public int IdHebergement { get; set; }
        public string Photo { get; set; }
        public string Nom { get; set; }
        public string Type { get; set; }
        public decimal PrixDeBase { get; set; }
        public string Description { get; set; }
        public Client Client { get; set; }
        public Adresse Adresse { get; set; }
        public bool Equals(Hebergement other)
        {
            return this.IdHebergement == other.IdHebergement;
        }
    }
}