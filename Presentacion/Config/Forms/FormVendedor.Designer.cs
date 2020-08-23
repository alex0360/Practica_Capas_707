﻿namespace Presentacion.Config.Forms
{
    partial class FormVendedor
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
            this.IB_Buscar = new FontAwesome.Sharp.IconButton();
            this.L_Registros = new System.Windows.Forms.Label();
            this.TB_Nombre = new System.Windows.Forms.TextBox();
            this.TB_ID = new System.Windows.Forms.TextBox();
            this.TB_Oficina = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // IB_Buscar
            // 
            this.IB_Buscar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.IB_Buscar.Flip = FontAwesome.Sharp.FlipOrientation.Normal;
            this.IB_Buscar.IconChar = FontAwesome.Sharp.IconChar.Search;
            this.IB_Buscar.IconColor = System.Drawing.Color.Black;
            this.IB_Buscar.IconSize = 32;
            this.IB_Buscar.Location = new System.Drawing.Point(579, 14);
            this.IB_Buscar.Name = "IB_Buscar";
            this.IB_Buscar.Rotation = 0D;
            this.IB_Buscar.Size = new System.Drawing.Size(62, 27);
            this.IB_Buscar.TabIndex = 26;
            this.IB_Buscar.UseVisualStyleBackColor = true;
            this.IB_Buscar.Click += new System.EventHandler(this.IB_Buscar_Click);
            this.IB_Buscar.Resize += new System.EventHandler(this.IB_Buscar_Resize);
            // 
            // L_Registros
            // 
            this.L_Registros.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.L_Registros.AutoSize = true;
            this.L_Registros.Font = new System.Drawing.Font("Microsoft YaHei", 12F);
            this.L_Registros.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(112)))), ((int)(((byte)(147)))));
            this.L_Registros.Location = new System.Drawing.Point(12, 15);
            this.L_Registros.Name = "L_Registros";
            this.L_Registros.Size = new System.Drawing.Size(45, 21);
            this.L_Registros.TabIndex = 27;
            this.L_Registros.Text = "Hola";
            this.L_Registros.Visible = false;
            // 
            // TB_Nombre
            // 
            this.TB_Nombre.BackColor = System.Drawing.SystemColors.Control;
            this.TB_Nombre.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.TB_Nombre.Font = new System.Drawing.Font("Microsoft YaHei UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TB_Nombre.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(112)))), ((int)(((byte)(147)))));
            this.TB_Nombre.Location = new System.Drawing.Point(196, 13);
            this.TB_Nombre.Margin = new System.Windows.Forms.Padding(200, 4, 3, 4);
            this.TB_Nombre.MaxLength = 15;
            this.TB_Nombre.Name = "TB_Nombre";
            this.TB_Nombre.Size = new System.Drawing.Size(119, 28);
            this.TB_Nombre.TabIndex = 25;
            this.TB_Nombre.Text = "   Nombre";
            // 
            // TB_ID
            // 
            this.TB_ID.BackColor = System.Drawing.SystemColors.Control;
            this.TB_ID.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.TB_ID.Font = new System.Drawing.Font("Microsoft YaHei UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TB_ID.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(112)))), ((int)(((byte)(147)))));
            this.TB_ID.Location = new System.Drawing.Point(325, 13);
            this.TB_ID.Margin = new System.Windows.Forms.Padding(200, 4, 3, 4);
            this.TB_ID.MaxLength = 15;
            this.TB_ID.Name = "TB_ID";
            this.TB_ID.Size = new System.Drawing.Size(119, 28);
            this.TB_ID.TabIndex = 24;
            this.TB_ID.Text = "   Codigo";
            // 
            // TB_Oficina
            // 
            this.TB_Oficina.BackColor = System.Drawing.SystemColors.Control;
            this.TB_Oficina.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.TB_Oficina.Font = new System.Drawing.Font("Microsoft YaHei UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TB_Oficina.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(112)))), ((int)(((byte)(147)))));
            this.TB_Oficina.Location = new System.Drawing.Point(454, 13);
            this.TB_Oficina.Margin = new System.Windows.Forms.Padding(200, 4, 3, 4);
            this.TB_Oficina.MaxLength = 15;
            this.TB_Oficina.Name = "TB_Oficina";
            this.TB_Oficina.Size = new System.Drawing.Size(119, 28);
            this.TB_Oficina.TabIndex = 23;
            this.TB_Oficina.Text = "   Oficina";
            // 
            // FormVendedor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(649, 437);
            this.Controls.Add(this.IB_Buscar);
            this.Controls.Add(this.L_Registros);
            this.Controls.Add(this.TB_Nombre);
            this.Controls.Add(this.TB_ID);
            this.Controls.Add(this.TB_Oficina);
            this.Name = "FormVendedor";
            this.Text = "Vendedores";
            this.Load += new System.EventHandler(this.FormVendedor_Load);
            this.Controls.SetChildIndex(this.TB_Oficina, 0);
            this.Controls.SetChildIndex(this.TB_ID, 0);
            this.Controls.SetChildIndex(this.TB_Nombre, 0);
            this.Controls.SetChildIndex(this.L_Registros, 0);
            this.Controls.SetChildIndex(this.IB_Buscar, 0);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private FontAwesome.Sharp.IconButton IB_Buscar;
        private System.Windows.Forms.Label L_Registros;
        private System.Windows.Forms.TextBox TB_Nombre;
        private System.Windows.Forms.TextBox TB_ID;
        private System.Windows.Forms.TextBox TB_Oficina;
    }
}