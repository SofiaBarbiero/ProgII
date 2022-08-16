using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Universidad
{
    class Conexion
    {
        private SqlConnection cnn;
        private SqlCommand cmd;
        private DataTable table;
        
        public Conexion()
        {
            cnn = new SqlConnection(@"Data Source=DESKTOP-0BIKPP4\SQLEXPRESS;Initial Catalog=UNIVERSIDAD;Integrated Security=True");
        }
        public DataTable EjecutarSP(string nombreSP, int parAnio, int parCuat)
        {
            cnn.Open();
            cmd = new SqlCommand(nombreSP, cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@anio", parAnio);
            cmd.Parameters.AddWithValue("@cuatrimestre", parCuat);
            table = new DataTable();
            table.Load(cmd.ExecuteReader());
            cnn.Close();
            return table;
        }
    }
}
