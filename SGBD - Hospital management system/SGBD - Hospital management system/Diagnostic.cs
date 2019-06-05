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
    public partial class Diagnostic : Form
    {
        OracleConnection conn;
        public Diagnostic()
        {
            InitializeComponent();
            conn = new OracleConnection(Database.connectionString);
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Meniu a = new Meniu();
            a.ShowDialog();
            this.Close();
        }

        private void Dw_diagnostic_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        public void SetGrid(DataTable dt)
        {   
            dw_diagnostic.DataSource = dt;
            dw_diagnostic.Visible = true;
        }
    }
}
