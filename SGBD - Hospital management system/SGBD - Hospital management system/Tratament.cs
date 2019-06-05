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
    public partial class Tratament : Form
    {
        OracleConnection conn;
        public Tratament()
        {
            InitializeComponent();
            conn = new OracleConnection(Database.connectionString);

        }

        private void Button1_Click(object sender, EventArgs e)
        {
            Hide();
            Meniu a = new Meniu();
            a.ShowDialog();
            Close();
        }

        private void Label2_Click(object sender, EventArgs e)
        {

        }

        private void Tratament_Load(object sender, EventArgs e)
        {

        }

        private void Dw_doc_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Trat_but_Click(object sender, EventArgs e)
        {
            conn.Open();

            trat_dw.Visible = false;

            int id_pacient = Convert.ToInt32(trat_nup.Value);

            string query = string.Format("SELECT o.nume, o.prenume, m.denumire FROM FISA_PACIENT p" +
                "           JOIN MEDICAMENT m ON m.id = p.id_medicament1" +
                "           JOIN PACIENT o ON o.id = p.id_pacient" +
                "           WHERE p.id = {0}" +
                "           ORDER BY p.data_internare DESC", id_pacient);

            OracleDataAdapter da = new OracleDataAdapter(query, conn);

            DataTable dt = new DataTable();
            da.Fill(dt);

            trat_dw.DataSource = dt;
            trat_dw.Visible = true;

            conn.Close();
        }
    }
}
