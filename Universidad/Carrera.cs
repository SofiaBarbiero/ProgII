using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Universidad
{
    class Carrera
    {
        private string nombre;
        private string titulo;
        private DetalleCarrera[] detalles;

        public Carrera (int cantidad)
        {
            nombre = string.Empty;
            titulo = string.Empty;
            detalles = new DetalleCarrera[cantidad];
        }
        public string pNombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        public string pTitulo
        {
            get { return titulo; }
            set { titulo = value; }
        }

        public void AgregarDetalle(DetalleCarrera detalle)
        {
            for (int i = 0; i < detalles.Length; i++)
            {
                if (detalles[i] == null)
                {
                    detalles[i] = detalle;
                    break;
                }
            }
        }
    }
}
