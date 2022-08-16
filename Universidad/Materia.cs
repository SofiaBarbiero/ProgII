using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Universidad
{
    class Materia
    {
        private string nombre;
        
        public Materia()
        {
            nombre = string.Empty;
        }
        public Materia(string nombre)
        {
            this.nombre = nombre;
        }

        public string pNombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public override string ToString()
        {
            return "Materia: " + nombre;
        }
    }
}
