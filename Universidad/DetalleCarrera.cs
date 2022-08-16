using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Universidad
{
    class DetalleCarrera
    {
        private DateTime anioCursado;
        private int cuatrimestre;
        private Materia materia;

        public DetalleCarrera()
        {
            anioCursado = DateTime.Now;
            cuatrimestre = 0;
            materia = null;
        }
        public DetalleCarrera(DateTime anioCursado, int cuatrimestre, Materia materia)
        {
            this.anioCursado = anioCursado;
            this.cuatrimestre = cuatrimestre;
            this.materia = materia;
        }
        public DateTime pAnio
        {
            get { return anioCursado; }
            set { anioCursado = value; }
        }
        public int pCuatrimestre
        {
            get { return cuatrimestre; }
            set { cuatrimestre = value; }
        }
        public Materia pMateria
        {
            get { return materia; }
            set { materia = value; }
        }
        public override string ToString()
        {
            return "Año de cursado: " + anioCursado + " Cuatrimestre: " + cuatrimestre + materia.ToString();
        }
    }
}
