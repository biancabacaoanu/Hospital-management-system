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
    public partial class Raport : Form
    {
        OracleConnection conn;
        OracleDataAdapter da;
        DataSet paging;
        int pageValue;
        public Raport()
        {
            InitializeComponent();
            conn = new OracleConnection(Database.connectionString);
            pageValue = 0;
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
            int id_personal = Convert.ToInt32(rp_nup.Value);

            conn.Open();

            string query = string.Format("SELECT s.denumire, r.ora_start, r.ora_final, r.data_raport FROM RAPORT r" +
                "                        JOIN SECTIE s ON s.id = r.id_sectie" +
                "                        WHERE id_personal = {0} " +
                "                        ORDER BY DATA_RAPORT DESC", id_personal);
            da = new OracleDataAdapter(query, conn);

            paging = new DataSet();
            da.Fill(paging, pageValue, 5, "Raport");


            dw_rp.DataSource = paging;
            dw_rp.DataMember = "Raport";
            dw_rp.Visible = true;

            conn.Close();
        }

        private void Rp_nup_ValueChanged(object sender, EventArgs e)
        {

        }

        private void Button3_Click(object sender, EventArgs e)
        {
            pageValue += 5;
            paging.Clear();
            da.Fill(paging, pageValue, 5, "Raport");
        }

        private void Button4_Click(object sender, EventArgs e)
        {
            if (pageValue > 5)
            {
                pageValue -= 5;
            }
            else pageValue = 0;
            paging.Clear();
            da.Fill(paging, pageValue, 5, "Raport");
        }
    }
}
