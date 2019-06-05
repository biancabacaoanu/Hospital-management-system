using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;
using System.Windows.Forms;

namespace SGBD___Hospital_management_system
{
    public partial class Asistent : Form
    {
        OracleConnection conn; 

        public Asistent()
        {
            InitializeComponent();
            conn = new OracleConnection(Database.connectionString);
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            /* Form2 a = new Form2();
            a.ShowDialog();
            this.Hide(); */
            try
            {
                conn.Open();
                /* string query = string.Format("SELECT * FROM ASISTENT where id = {0}", 55);
                OracleDataAdapter da = new OracleDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dataGridView1.DataSource = dt;
                dataGridView1.Columns["ID"].Visible = false; */

                int id_asistent = Convert.ToInt32(numericUpDown1.Value);
      
                var cmd = new OracleCommand
                {
                    Connection = conn,
                    CommandText = "pck_personal.gtAsistent",
                    CommandType = CommandType.StoredProcedure,
                    BindByName = true
                };
                cmd.Parameters.Add("id_asistent", OracleDbType.Int32, id_asistent, ParameterDirection.Input);

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

                dt.Rows.Add(words[0], words[1], words[2], words[3], words[4], words[5], words[6], words[7]);
                
                dataGridView1.DataSource = dt;

                /* OracleDataAdapter da = new OracleDataAdapter(cmd);
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                da.Fill(dt); */
                dataGridView1.Visible = true; 

                // Close and Dispose OracleConnection object  
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, "Not found", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
        }

        private void NumericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            
        }

        private void Label1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
             
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Meniu a = new Meniu();
            a.ShowDialog();
            this.Close();
        }
    }

}
