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
    public partial class Pacient : Form
    {
        OracleConnection conn;
        public Pacient()
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

            string nume = nume_tb.Text;
            string prenume = prenume_tb.Text;
            int inaltime = Convert.ToInt32(inaltime_nup.Value);
            int greutate = Convert.ToInt32(greutate_nup.Value);
            char sex;
            if (male_radio.Checked) sex = 'M';
            else if (female_radio.Checked) sex = 'F';
            else sex = 'F';

            string telefon = tel_tb.Text;
            DateTime data_nastere = dt_dn.Value;
            string categorie = cat_tb.Text;

            Random random = new Random();
            int value = random.Next(1000010, 1010004);

            var cmd = new OracleCommand
            {
                Connection = conn,
                CommandText = "pck_fisapacient.adauga_Pacient",
                CommandType = CommandType.StoredProcedure,
                BindByName = true
            };

            cmd.Parameters.Add("id", OracleDbType.Int32, value, ParameterDirection.Input);
            cmd.Parameters.Add("nume", OracleDbType.Varchar2, nume, ParameterDirection.Input);
            cmd.Parameters.Add("prenume", OracleDbType.Varchar2, prenume, ParameterDirection.Input);
            cmd.Parameters.Add("inaltime", OracleDbType.Int32, inaltime, ParameterDirection.Input);
            cmd.Parameters.Add("greutate", OracleDbType.Int32, greutate, ParameterDirection.Input);
            cmd.Parameters.Add("sex", OracleDbType.Char, sex, ParameterDirection.Input);
            cmd.Parameters.Add("telefon", OracleDbType.Varchar2, telefon, ParameterDirection.Input);
            cmd.Parameters.Add("data_nastere", OracleDbType.Date, data_nastere, ParameterDirection.Input);
            cmd.Parameters.Add("categorie", OracleDbType.Varchar2, categorie, ParameterDirection.Input);

            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Inserare reusita! ", "Done!", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, "Inserare esuata!", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }

            conn.Close();
        }
    }
}
