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
    public partial class Doctor : Form
    {
        OracleConnection conn;
        public Doctor()
        {
            InitializeComponent();
            conn = new OracleConnection(Database.connectionString);
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Meniu a = new Meniu();
            a.ShowDialog();
            this.Close();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            conn.Open();

            int id_doctor = Convert.ToInt32(numericUpDown1.Value);

            var cmd = new OracleCommand
            {
                Connection = conn,
                CommandText = "pck_personal.gtDoctor",
                CommandType = CommandType.StoredProcedure,
                BindByName = true
            };
            cmd.Parameters.Add("id_doctor", OracleDbType.Int32, id_doctor, ParameterDirection.Input);

            OracleParameter returnParm = new OracleParameter();
            returnParm.OracleDbType = OracleDbType.Varchar2;
            returnParm.Size = 128;
            returnParm.Direction = ParameterDirection.ReturnValue;

            cmd.Parameters.Add(returnParm);

            cmd.ExecuteNonQuery();

            string text = returnParm.Value.ToString();
            string[] words = text.Split('/');
            DataTable dt = new DataTable();
            dt.Columns.Add("Nume");
            dt.Columns.Add("Prenume");
            dt.Columns.Add("Sectie");
            dt.Columns.Add("Specializare 1");
            dt.Columns.Add("Specializare 2");
            dt.Columns.Add("Specializare 3");
            dt.Columns.Add("Specializare 4");
            dt.Columns.Add("Specializare 5");
            dt.Columns.Add("Salariu");

            dt.Rows.Add(words[0], words[1], words[2], words[3], words[4], words[5], words[6], words[7], words[8]);

            dataGridView1.DataSource = dt;
            dataGridView1.Visible = true;

            conn.Close();
        }

        private void Doctor_Load(object sender, EventArgs e)
        {

        }
    }
}
