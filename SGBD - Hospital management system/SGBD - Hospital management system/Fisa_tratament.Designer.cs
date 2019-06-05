namespace SGBD___Hospital_management_system
{
    partial class Fisa_tratament
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.fp_nup = new System.Windows.Forms.NumericUpDown();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.but_fp = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.fp_nup)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(299, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(193, 25);
            this.label1.TabIndex = 0;
            this.label1.Text = "Informatii fisa pacient";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(192, 75);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(184, 18);
            this.label2.TabIndex = 1;
            this.label2.Text = "Introduceti id-ul pacientului:";
            // 
            // fp_nup
            // 
            this.fp_nup.Location = new System.Drawing.Point(382, 75);
            this.fp_nup.Maximum = new decimal(new int[] {
            2000000,
            0,
            0,
            0});
            this.fp_nup.Name = "fp_nup";
            this.fp_nup.Size = new System.Drawing.Size(120, 20);
            this.fp_nup.TabIndex = 2;
            // 
            // dataGridView1
            // 
            this.dataGridView1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(86, 128);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.dataGridView1.Size = new System.Drawing.Size(648, 55);
            this.dataGridView1.TabIndex = 3;
            // 
            // but_fp
            // 
            this.but_fp.Location = new System.Drawing.Point(525, 74);
            this.but_fp.Name = "but_fp";
            this.but_fp.Size = new System.Drawing.Size(75, 23);
            this.but_fp.TabIndex = 4;
            this.but_fp.Text = "Afiseaza";
            this.but_fp.UseVisualStyleBackColor = true;
            this.but_fp.Click += new System.EventHandler(this.But_fp_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(332, 226);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(129, 23);
            this.button1.TabIndex = 5;
            this.button1.Text = "Revino la meniu";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.Button1_Click);
            // 
            // Fisa_tratament
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 290);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.but_fp);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.fp_nup);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Fisa_tratament";
            this.Text = "Fisa_tratament";
            this.Load += new System.EventHandler(this.Fisa_tratament_Load);
            ((System.ComponentModel.ISupportInitialize)(this.fp_nup)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.NumericUpDown fp_nup;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button but_fp;
        private System.Windows.Forms.Button button1;
    }
}