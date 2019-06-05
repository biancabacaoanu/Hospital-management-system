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
    public partial class Injection : Form
    {
        OracleConnection conn;
        public Injection()
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

            string text = textBox1.Text;

            string query = string.Format("SELECT * FROM RAPORT WHERE id_personal = {0}", text);
            OracleDataAdapter da = new OracleDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            dataGridView1.DataSource = dt;

            conn.Close();
        }
    }
}
