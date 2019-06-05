namespace SGBD___Hospital_management_system
{
    partial class Diagnostic
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
            this.dw_diagnostic = new System.Windows.Forms.DataGridView();
            this.button1 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dw_diagnostic)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(279, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(188, 26);
            this.label1.TabIndex = 0;
            this.label1.Text = "Boli predominante";
            // 
            // dw_diagnostic
            // 
            this.dw_diagnostic.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dw_diagnostic.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dw_diagnostic.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dw_diagnostic.Location = new System.Drawing.Point(119, 64);
            this.dw_diagnostic.Name = "dw_diagnostic";
            this.dw_diagnostic.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.dw_diagnostic.Size = new System.Drawing.Size(543, 132);
            this.dw_diagnostic.TabIndex = 1;
            this.dw_diagnostic.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.Dw_diagnostic_CellContentClick);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(328, 236);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(110, 23);
            this.button1.TabIndex = 2;
            this.button1.Text = "Revino la meniu";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.Button1_Click);
            // 
            // Diagnostic
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 294);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.dw_diagnostic);
            this.Controls.Add(this.label1);
            this.Name = "Diagnostic";
            this.Text = "Diagnostic";
            ((System.ComponentModel.ISupportInitialize)(this.dw_diagnostic)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dw_diagnostic;
        private System.Windows.Forms.Button button1;
    }
}