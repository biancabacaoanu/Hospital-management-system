namespace SGBD___Hospital_management_system
{
    partial class Tratament
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
            this.trat_but2 = new System.Windows.Forms.Button();
            this.trat_but = new System.Windows.Forms.Button();
            this.trat_dw = new System.Windows.Forms.DataGridView();
            this.trat_nup = new System.Windows.Forms.NumericUpDown();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.trat_dw)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.trat_nup)).BeginInit();
            this.SuspendLayout();
            // 
            // trat_but2
            // 
            this.trat_but2.Location = new System.Drawing.Point(336, 201);
            this.trat_but2.Name = "trat_but2";
            this.trat_but2.Size = new System.Drawing.Size(124, 23);
            this.trat_but2.TabIndex = 0;
            this.trat_but2.Text = "Revino la meniu";
            this.trat_but2.UseVisualStyleBackColor = true;
            this.trat_but2.Click += new System.EventHandler(this.Button1_Click);
            // 
            // trat_but
            // 
            this.trat_but.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.trat_but.Location = new System.Drawing.Point(500, 58);
            this.trat_but.Name = "trat_but";
            this.trat_but.Size = new System.Drawing.Size(75, 23);
            this.trat_but.TabIndex = 12;
            this.trat_but.Text = "Afiseaza";
            this.trat_but.UseVisualStyleBackColor = true;
            this.trat_but.Click += new System.EventHandler(this.Trat_but_Click);
            // 
            // trat_dw
            // 
            this.trat_dw.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.trat_dw.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.trat_dw.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.trat_dw.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.trat_dw.Location = new System.Drawing.Point(37, 118);
            this.trat_dw.Name = "trat_dw";
            this.trat_dw.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.trat_dw.Size = new System.Drawing.Size(735, 43);
            this.trat_dw.TabIndex = 13;
            this.trat_dw.Visible = false;
            this.trat_dw.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.Dw_doc_CellContentClick);
            // 
            // trat_nup
            // 
            this.trat_nup.Location = new System.Drawing.Point(340, 58);
            this.trat_nup.Maximum = new decimal(new int[] {
            100000,
            0,
            0,
            0});
            this.trat_nup.Name = "trat_nup";
            this.trat_nup.Size = new System.Drawing.Size(120, 20);
            this.trat_nup.TabIndex = 14;
            this.trat_nup.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(135, 58);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(185, 17);
            this.label1.TabIndex = 15;
            this.label1.Text = "Introduceti id-ul  pacientului:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 17F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(290, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(216, 29);
            this.label2.TabIndex = 16;
            this.label2.Text = "Informatii tratament";
            this.label2.Click += new System.EventHandler(this.Label2_Click);
            // 
            // Tratament
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 261);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.trat_nup);
            this.Controls.Add(this.trat_dw);
            this.Controls.Add(this.trat_but);
            this.Controls.Add(this.trat_but2);
            this.Name = "Tratament";
            this.Text = "Tratament";
            this.Load += new System.EventHandler(this.Tratament_Load);
            ((System.ComponentModel.ISupportInitialize)(this.trat_dw)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.trat_nup)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button trat_but2;
        private System.Windows.Forms.Button trat_but;
        private System.Windows.Forms.DataGridView trat_dw;
        private System.Windows.Forms.NumericUpDown trat_nup;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
    }
}