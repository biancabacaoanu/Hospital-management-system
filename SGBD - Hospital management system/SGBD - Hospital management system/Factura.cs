using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SGBD___Hospital_management_system
{
    public partial class Factura : Form
    {
        OracleConnection conn;
        public Factura()
        {
            InitializeComponent();
            conn = new OracleConnection(Database.connectionString);
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            Hide();
            Meniu a = new Meniu();
            a.ShowDialog();
            Close();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            conn.Open();

            int ID = Convert.ToInt32(numericUpDown1.Value);
            int plata = Convert.ToInt32(numericUpDown2.Value);

            var cmd = new OracleCommand
            {
                Connection = conn,
                CommandText = "pck_facturi.realizare_factura",
                CommandType = CommandType.StoredProcedure,
                BindByName = true
            };

            Random random = new Random();
            int value = random.Next(1000010, 1010004);

            cmd.Parameters.Add("id", OracleDbType.Int32, value, ParameterDirection.Input);
            cmd.Parameters.Add("id_fisa_pacient", OracleDbType.Int32, ID, ParameterDirection.Input);
            cmd.Parameters.Add("plata", OracleDbType.Int32, plata, ParameterDirection.Input);

            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Inserare reusita! ", "Done!", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, "Inserare esuata!", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }

            conn.Close();
        }
    }
}
