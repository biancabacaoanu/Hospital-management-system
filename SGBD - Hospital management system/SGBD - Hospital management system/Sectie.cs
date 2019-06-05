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
    public partial class Sectie : Form
    {
        OracleConnection conn;
        public Sectie()
        {
            InitializeComponent();
            conn = new OracleConnection(Database.connectionString);
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            conn.Open();

            int id_sectie = Convert.ToInt32(nd_sectie.Value);

            var cmd = new OracleCommand
            {
                Connection = conn,
                CommandText = "pck_sectie.getSectie",
                CommandType = CommandType.StoredProcedure,
                BindByName = true
            };
            cmd.Parameters.Add("id_sectie", OracleDbType.Int32, id_sectie, ParameterDirection.Input);

            OracleParameter returnParm = new OracleParameter();
            returnParm.OracleDbType = OracleDbType.Varchar2;
            returnParm.Size = 128;
            returnParm.Direction = ParameterDirection.ReturnValue;

            cmd.Parameters.Add(returnParm);

            try
            {
                cmd.ExecuteNonQuery();
                conn.Close();
                string text = returnParm.Value.ToString();
                string[] words = text.Split('/');
                DataTable dt = new DataTable();
                dt.Columns.Add("Denumire");
                dt.Columns.Add("Numar camere");

                dt.Rows.Add(words[0], words[1]);

                dw_sectie1.DataSource = dt;

                dw_sectie1.Visible = true;

                conn.Open();
            }
            catch (Exception ev)
            {
                MessageBox.Show("Error: " + ev.Message, "Not found", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }


            string query = string.Format("SELECT st.nume, st.prenume, st.functie FROM SECTIE s" +
                "                         JOIN DOCTOR d ON d.id_sectie = s.id" +
                "                         JOIN STAFF st ON st.id = d.id " +
                "                         where s.id = {0}", id_sectie);
            OracleDataAdapter da = new OracleDataAdapter(query, conn);

            string query1 = string.Format("SELECT st.nume, st.prenume, st.functie FROM SECTIE s" +
                "                         JOIN ASISTENT d ON d.id_sectie = s.id" +
                "                         JOIN STAFF st ON st.id = d.id " +
                "                         where s.id = {0}", id_sectie);
            OracleDataAdapter da2 = new OracleDataAdapter(query1, conn);

            DataTable dt2 = new DataTable();
            da.Fill(dt2);
            da2.Fill(dt2);
            dw_sectie2.DataSource = dt2;
            dw_sectie2.Visible = true;

            conn.Close();
        }

        private void NumericUpDown1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void Button2_Click(object sender, EventArgs e)
        {
            Hide();
            Meniu a = new Meniu();
            a.ShowDialog();
            Close();
        }
    }
}
