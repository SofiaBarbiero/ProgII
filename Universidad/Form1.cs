using System.Data;

namespace Universidad
{
    public partial class Form1 : Form
    {
        private Conexion ayudante;
        public Form1()
        {
            InitializeComponent();
            ayudante = new Conexion();
        }

        private void btnListar_Click(object sender, EventArgs e)
        {
            cargarLista();
        }

        private void cargarLista()
        {
            string nombreSP = "SP_Materias";
            int parAnio = Convert.ToInt32(txtAnio.Text);
            int parCuat = Convert.ToInt32(txtCuatrimestre.Text);
            DataTable tabla = ayudante.EjecutarSP(nombreSP, parAnio, parCuat);
            lstMaterias.Items.Clear();

            foreach (DataRow fila in tabla.Rows)
            {
                Materia m = new Materia();
                m.pNombre = fila["Materia"].ToString();
                lstMaterias.Items.Add(m);
            }
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Seguro que desea salir?", "Confirmación", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
                this.Close();
        }
    }
}