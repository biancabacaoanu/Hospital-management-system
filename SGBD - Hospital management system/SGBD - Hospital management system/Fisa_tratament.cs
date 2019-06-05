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
    public partial class Fisa_tratament : Form
    {
        OracleConnection conn;
        public Fisa_tratament()
        {
            InitializeComponent();
            conn = new OracleConnection(Database.connectionString);
        }

        private void Fisa_tratament_Load(object sender, EventArgs e)
        {

        }

        private void Button1_Click(object sender, EventArgs e)
        {
            Hide();
            Meniu a = new Meniu();
            a.ShowDialog();
            Close();
        }

        private void But_fp_Click(object sender, EventArgs e)
        {
            conn.Open();

            dataGridView1.Visible = false;

            int id_pacient = Convert.ToInt32(fp_nup.Value);

            var cmd = new OracleCommand
            {
                Connection = conn,
                CommandText = "pck_fisapacient.fisa_tp",
                CommandType = CommandType.StoredProcedure,
                BindByName = true
            };
            cmd.Parameters.Add("id_pac", OracleDbType.Int32, id_pacient, ParameterDirection.Input);

            OracleParameter returnParm = new OracleParameter();
            returnParm.OracleDbType = OracleDbType.Varchar2;
            returnParm.Size = 256;
            returnParm.Direction = ParameterDirection.ReturnValue;

            cmd.Parameters.Add(returnParm);

            cmd.ExecuteNonQuery();

            string query = returnParm.Value.ToString();
            string[] words = query.Split('/');
            DataTable dt = new DataTable();
            dt.Columns.Add("Nume pacient");
            dt.Columns.Add("Nume doctor");
            dt.Columns.Add("Data internare");
            dt.Columns.Add("Diagnostic");
            dt.Columns.Add("Medicament1");
            dt.Columns.Add("Medicament2");
            dt.Columns.Add("Medicament3");
            dt.Rows.Add(words[0], words[1], words[2], words[3], words[4], words[5], words[6]);

            dataGridView1.DataSource = dt;
            dataGridView1.Visible = true;
            conn.Close();
        }
    }
}
