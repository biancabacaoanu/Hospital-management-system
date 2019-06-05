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
    public partial class Salariu : Form
    {
        OracleConnection conn;
        public Salariu()
        {
            InitializeComponent();
            conn = new OracleConnection(Database.connectionString);
        }

        private void Salariu_Load(object sender, EventArgs e)
        {

        }

        private void Button1_Click(object sender, EventArgs e)
        {
            Hide();
            Meniu a = new Meniu();
            a.ShowDialog();
            Close();
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            conn.Open();

            int ID = Convert.ToInt32(numericUpDown1.Value);
            int marire = Convert.ToInt32(numericUpDown2.Value);

            var cmd = new OracleCommand
            {
                Connection = conn,
                CommandText = "pck_liste.marire_salariu",
                CommandType = CommandType.StoredProcedure,
                BindByName = true
            };

            cmd.Parameters.Add("in_id_personal", OracleDbType.Int32, ID, ParameterDirection.Input);
            cmd.Parameters.Add("sal", OracleDbType.Int32, marire, ParameterDirection.Input);

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
