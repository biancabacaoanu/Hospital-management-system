using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;
using System.Windows.Forms;

namespace SGBD___Hospital_management_system
{
    public partial class Meniu : Form
    {
        OracleConnection conn;
        public Meniu()
        {
            InitializeComponent();
            conn = new OracleConnection(Database.connectionString);
        }


        private void Button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Asistent a = new Asistent();
            a.ShowDialog();
            this.Close();
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Sectie a = new Sectie();
            a.ShowDialog();
            this.Close();
        }

        private void Meniu_Load(object sender, EventArgs e)
        {

        }

        private void Button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            Raport a = new Raport();
            a.ShowDialog();
            this.Close();
        }

        private void Button4_Click(object sender, EventArgs e)
        {
            this.Hide();
            Doctor a = new Doctor();
            a.ShowDialog();
            this.Close();
        }

        private void Button5_Click(object sender, EventArgs e)
        {
            this.Hide();
            Tratament a = new Tratament();
            a.ShowDialog();
            this.Close();
        }

        private void Button6_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();

                string query = string.Format("SELECT DISTINCT diagnostic FROM FISA_PACIENT WHERE ROWNUM < 6 GROUP BY diagnostic ORDER BY COUNT(diagnostic) DESC");

                OracleDataAdapter da = new OracleDataAdapter(query, conn);

                DataTable dt = new DataTable();
                da.Fill(dt);

                Hide();
                Diagnostic a = new Diagnostic();
                a.SetGrid(dt);
                a.ShowDialog();
                Close();

                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, "Not found", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
        }

        private void Button7_Click(object sender, EventArgs e)
        {
            Hide();
            Fisa_Pacient a = new Fisa_Pacient();
            a.ShowDialog();
            Close();
        }

        private void Button8_Click(object sender, EventArgs e)
        {
            Hide();
            Fisa_tratament a = new Fisa_tratament();
            a.ShowDialog();
            Close();
        }

        private void Button9_Click(object sender, EventArgs e)
        {
            Hide();
            Pacient a = new Pacient();
            a.ShowDialog();
            Close();
        }

        private void Button10_Click(object sender, EventArgs e)
        {
            Hide();
            Salariu a = new Salariu();
            a.ShowDialog();
            Close();
        }

        private void Button11_Click(object sender, EventArgs e)
        {
            Hide();
            Factura a = new Factura();
            a.ShowDialog();
            Close();
        }

        private void Button12_Click(object sender, EventArgs e)
        {
            Hide();
            Injection a = new Injection();
            a.ShowDialog();
            Close();
        }
    }
}
