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
    public partial class Fisa_Pacient : Form
    {
        OracleConnection conn;
        public Fisa_Pacient()
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

        private void Button2_Click(object sender, EventArgs e)
        {
            conn.Open();

            int id_pacient = Convert.ToInt32(pacient_nup.Value);
            int id_doctor = Convert.ToInt32(doc_nup.Value);
            DateTime data_internare = dtp_int.Value; 
            DateTime data_externare = dtp_ext.Value;
            DateTime data = new DateTime(1753, 1, 1, 12, 0, 0);
            if (data_externare == data)
            {
                dtp_ext.Checked = false;
            }
            else
            {
                dtp_ext.Checked = true;
                dtp_ext.Value = data_externare;
            }
            int med1 = Convert.ToInt32(med1_nup.Value);
            int med2 = Convert.ToInt32(med2_nup.Value);
            int med3 = Convert.ToInt32(med3_nup.Value);
            int med4 = Convert.ToInt32(med4_nup.Value);
            int med5 = Convert.ToInt32(med5_nup.Value);
            int med6 = Convert.ToInt32(med6_nup.Value);
            int med7 = Convert.ToInt32(med7_nup.Value);
            int med8 = Convert.ToInt32(med8_nup.Value);
            int med9 = Convert.ToInt32(med9_nup.Value);
            string diagnostic = tb_diagnostic.Text;

            Random random = new Random();
            int value = random.Next(1000010, 1010004);

            var cmd = new OracleCommand
            {
                Connection = conn,
                CommandText = "pck_fisapacient.add_fisa_pacient",
                CommandType = CommandType.StoredProcedure,
                BindByName = true
            };
            cmd.Parameters.Add("id", OracleDbType.Int32, value, ParameterDirection.Input);
            cmd.Parameters.Add("id_pacient", OracleDbType.Int32, id_pacient, ParameterDirection.Input);
            cmd.Parameters.Add("id_doctor", OracleDbType.Int32, id_doctor, ParameterDirection.Input);
            cmd.Parameters.Add("data_internare", OracleDbType.Date, data_internare, ParameterDirection.Input);
            cmd.Parameters.Add("data_externare", OracleDbType.Date, data_externare, ParameterDirection.Input);
            cmd.Parameters.Add("diagnostic", OracleDbType.Varchar2, diagnostic, ParameterDirection.Input);
            if(med1 > 0) cmd.Parameters.Add("id_medicament1", OracleDbType.Int32, med1, ParameterDirection.Input);
            else cmd.Parameters.Add("id_medicament1", OracleDbType.Int32, null, ParameterDirection.Input);
            if(med2 > 0) cmd.Parameters.Add("id_medicament2", OracleDbType.Int32, med2, ParameterDirection.Input);
            else cmd.Parameters.Add("id_medicament2", OracleDbType.Int32, null, ParameterDirection.Input);
            if(med3 > 0) cmd.Parameters.Add("id_medicament3", OracleDbType.Int32, med3, ParameterDirection.Input);
            else cmd.Parameters.Add("id_medicament3", OracleDbType.Int32, null, ParameterDirection.Input);
            if(med4 > 0) cmd.Parameters.Add("id_medicament4", OracleDbType.Int32, med4, ParameterDirection.Input);
            else cmd.Parameters.Add("id_medicament4", OracleDbType.Int32, null, ParameterDirection.Input);
            if(med5 > 0) cmd.Parameters.Add("id_medicament5", OracleDbType.Int32, med5, ParameterDirection.Input);
            else cmd.Parameters.Add("id_medicament5", OracleDbType.Int32, null, ParameterDirection.Input);
            if(med6 > 0) cmd.Parameters.Add("id_medicament6", OracleDbType.Int32, med6, ParameterDirection.Input);
            else cmd.Parameters.Add("id_medicament6", OracleDbType.Int32, null, ParameterDirection.Input);
            if(med7 > 0) cmd.Parameters.Add("id_medicament7", OracleDbType.Int32, med7, ParameterDirection.Input);
            else cmd.Parameters.Add("id_medicament7", OracleDbType.Int32, null, ParameterDirection.Input);
            if(med8 > 0) cmd.Parameters.Add("id_medicament8", OracleDbType.Int32, med8, ParameterDirection.Input);
            else cmd.Parameters.Add("id_medicament8", OracleDbType.Int32, null, ParameterDirection.Input);
            if(med9 > 0) cmd.Parameters.Add("id_medicament9", OracleDbType.Int32, med9, ParameterDirection.Input);
            else cmd.Parameters.Add("id_medicament9", OracleDbType.Int32, null, ParameterDirection.Input);
            cmd.Parameters.Add("id_medicament10", OracleDbType.Int32, null, ParameterDirection.Input);

            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Inserare reusita! ", "Done!", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
            catch(Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, "Inserare esuata!", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
            
            conn.Close();
        }
    }
}
