namespace SGBD___Hospital_management_system
{
    partial class Sectie
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
            this.nd_sectie = new System.Windows.Forms.NumericUpDown();
            this.button1 = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.dw_sectie1 = new System.Windows.Forms.DataGridView();
            this.label4 = new System.Windows.Forms.Label();
            this.dw_sectie2 = new System.Windows.Forms.DataGridView();
            this.button2 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.nd_sectie)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dw_sectie1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dw_sectie2)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(301, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(146, 25);
            this.label1.TabIndex = 0;
            this.label1.Text = "Informatii sectie";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(169, 64);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(153, 17);
            this.label2.TabIndex = 1;
            this.label2.Text = "Introduceti id-ul sectiei:";
            // 
            // nd_sectie
            // 
            this.nd_sectie.Location = new System.Drawing.Point(348, 64);
            this.nd_sectie.Maximum = new decimal(new int[] {
            160,
            0,
            0,
            0});
            this.nd_sectie.Name = "nd_sectie";
            this.nd_sectie.Size = new System.Drawing.Size(120, 20);
            this.nd_sectie.TabIndex = 4;
            this.nd_sectie.ValueChanged += new System.EventHandler(this.NumericUpDown1_ValueChanged);
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(509, 64);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 3;
            this.button1.Text = "Afiseaza";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.Button1_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(303, 118);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(136, 17);
            this.label3.TabIndex = 5;
            this.label3.Text = "Detalii despre sectie";
            // 
            // dw_sectie1
            // 
            this.dw_sectie1.AllowUserToOrderColumns = true;
            this.dw_sectie1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dw_sectie1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dw_sectie1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dw_sectie1.Location = new System.Drawing.Point(231, 148);
            this.dw_sectie1.Name = "dw_sectie1";
            this.dw_sectie1.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.dw_sectie1.Size = new System.Drawing.Size(287, 44);
            this.dw_sectie1.TabIndex = 6;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(327, 218);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(100, 17);
            this.label4.TabIndex = 7;
            this.label4.Text = "Angajati sectie";
            // 
            // dw_sectie2
            // 
            this.dw_sectie2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dw_sectie2.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dw_sectie2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dw_sectie2.Location = new System.Drawing.Point(92, 253);
            this.dw_sectie2.Name = "dw_sectie2";
            this.dw_sectie2.Size = new System.Drawing.Size(562, 98);
            this.dw_sectie2.TabIndex = 8;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(323, 388);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(116, 22);
            this.button2.TabIndex = 9;
            this.button2.Text = "Reveniti la meniu";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.Button2_Click);
            // 
            // Sectie
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.dw_sectie2);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.dw_sectie1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.nd_sectie);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Sectie";
            this.Text = "Sectie";
            ((System.ComponentModel.ISupportInitialize)(this.nd_sectie)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dw_sectie1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dw_sectie2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.NumericUpDown nd_sectie;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DataGridView dw_sectie1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.DataGridView dw_sectie2;
        private System.Windows.Forms.Button button2;
    }
}