﻿using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace Presentacion.Config.Forms {
    public partial class FormCliente : FormBase {
        Negocios.Cliente cliente;
        DataSet dataSet;
        int id = 0;
        public FormCliente() {
            InitializeComponent();
            this.SetStyle(ControlStyles.OptimizedDoubleBuffer | ControlStyles.UserPaint | ControlStyles.AllPaintingInWmPaint, true);
            _ReSize();
        }

        private void FormCliente_Load(object sender, EventArgs e) {
            this.Top = 0;
            this.Left = 0;
            LoadTheme(L_Registros);
            MostrarTodoslosRegistrosCargados();
            ReSize._get_initial_size();

        }

        #region ReSize
        private ReSize ReSize;
        private void _ReSize() {
            ReSize = new ReSize(this);
            this.Load += FormCliente_Load;
            this.Resize += _Resize;
        }
        private void _Resize(object sender, EventArgs e) => ReSize._resize();

        #endregion

        #region DataGridView
        private void MostrarTodoslosRegistrosCargados() {
            try {
                if(cliente == null) {
                    cliente = new Negocios.Cliente();
                }
                //DSQL.Tables["VerRecord"].Clear();
                DGV_Data.AutoGenerateColumns = false;

                dataSet = cliente.Mostrar();
                SetupColumnsCargadas(dataSet);
                DGV_Data.DataSource = dataSet;

                DGV_Data.DataMember = "VerRecord";
            } catch(Exception ex) {
                MessageBox.Show(ex.Message);
            }
        }

        private void SetupColumnsCargadas(DataSet dataSet) {
            DGV_Data.Columns.Clear();

            // Set the background color for all rows and for alternating rows.  
            // The value for alternating rows overrides the value for all rows.

            // Set the row and column header styles.


            DataGridViewTextBoxColumn IdClienteColumn = new DataGridViewTextBoxColumn();
            IdClienteColumn.DataPropertyName = "ID_CLIENTE";
            IdClienteColumn.HeaderText = "ID#";
            IdClienteColumn.Frozen = true;
            IdClienteColumn.ValueType = typeof(int);
            DGV_Data.Columns.Add(IdClienteColumn);


            DataGridViewTextBoxColumn NombClienteColumn = new DataGridViewTextBoxColumn();
            NombClienteColumn.DataPropertyName = "NOMB_CLIENTE";
            NombClienteColumn.HeaderText = "Nombre";
            NombClienteColumn.Width = 250;
            NombClienteColumn.Frozen = true;
            NombClienteColumn.ValueType = typeof(string);
            DGV_Data.Columns.Add(NombClienteColumn);

            DataGridViewTextBoxColumn DireccionColumn = new DataGridViewTextBoxColumn();
            DireccionColumn.DataPropertyName = "DIRECCION";
            DireccionColumn.HeaderText = "Direccion";
            DireccionColumn.Frozen = true;
            DireccionColumn.ValueType = typeof(string);
            DGV_Data.Columns.Add(DireccionColumn);

            DataGridViewTextBoxColumn PaisColumn = new DataGridViewTextBoxColumn();
            PaisColumn.DataPropertyName = "PAIS";
            PaisColumn.HeaderText = "Pais";
            PaisColumn.Frozen = true;
            PaisColumn.ValueType = typeof(string);
            DGV_Data.Columns.Add(PaisColumn);

            DataGridViewTextBoxColumn SaldoInicColumn = new DataGridViewTextBoxColumn();
            SaldoInicColumn.DataPropertyName = "SALDO_INIC";
            SaldoInicColumn.HeaderText = "SALDO_INIC";
            SaldoInicColumn.Frozen = true;
            SaldoInicColumn.ValueType = typeof(string);
            DGV_Data.Columns.Add(SaldoInicColumn);

            DataGridViewTextBoxColumn SaldoActColumn = new DataGridViewTextBoxColumn();
            SaldoActColumn.DataPropertyName = "SALDO_ACT";
            SaldoActColumn.HeaderText = "SALDO_ACT";
            SaldoActColumn.Frozen = true;
            SaldoActColumn.ValueType = typeof(string);
            DGV_Data.Columns.Add(SaldoActColumn);

            DataGridViewCheckBoxColumn EstatusColumn = new DataGridViewCheckBoxColumn();
            EstatusColumn.DataPropertyName = "Estatus";
            EstatusColumn.HeaderText = "Estatus";
            EstatusColumn.Frozen = true;
            EstatusColumn.ValueType = typeof(Boolean);
            DGV_Data.Columns.Add(EstatusColumn);
            //DGV_Data.FirstDisplayedScrollingColumnIndex = DGV_Data.ColumnCount - 1;


        }
        #endregion
        private void IB_Buscar_Resize(object sender, EventArgs e) {
            IB_Buscar.Height = TB_Nombre.Size.Height;
        }

        private void FormCliente_Resize(object sender, EventArgs e) {

            if(DGV_Data.Columns["NOMB_CLIENTE"] != null)
                DGV_Data.Columns["NOMB_CLIENTE"].Width = 1000;
        }

        private void IB_Buscar_Click(object sender, EventArgs e) {
            string parametro = "";
            int VARIABLE = 0;
            if(cliente == null) {
                cliente = new Negocios.Cliente();
            }
            try {
                DGV_Data.Refresh();

                if(TB_ID.Text != "   Codigo" && TB_ID.Text != "") {
                    if(VARIABLE != 1) {
                        parametro = " ID_CLIENTE =" + TB_ID.Text;
                    }
                    VARIABLE = 1;
                }

                if(TB_Nombre.Text != "   Nombre" && TB_Nombre.Text != "") {
                    if(VARIABLE != 1) {
                        parametro = " NOMB_CLIENTE LIKE '%" + TB_Nombre.Text + "%'";
                    } else {
                        parametro = parametro + " AND NOMB_CLIENTE  LIKE '%" + TB_Nombre.Text + "%'";
                    }
                    VARIABLE = 1;
                }

                if(TB_Direccion.Text != "   Direccion" && TB_Direccion.Text != "") {
                    if(VARIABLE != 1) {
                        parametro = " DIRECCION LIKE '%" + TB_Direccion.Text + "%'";
                    } else {
                        parametro = parametro + " AND DIRECCION LIKE '%" + TB_Direccion.Text + "%'";
                    }
                    VARIABLE = 1;
                }

                if(TB_Pais.Text != "   Pais" && TB_Pais.Text != "") {
                    if(VARIABLE != 1) {
                        parametro = " PAIS LIKE '%" + TB_Pais.Text + "%'";
                    } else {
                        parametro = parametro + " AND PAIS LIKE '%" + TB_Pais.Text + "%'";
                    }
                    VARIABLE = 1;
                }

                string SQL = @"SELECT ID_CLIENTE, NOMB_CLIENTE, DIRECCION, PAIS, SALDO_INIC, SALDO_ACT, Estatus FROM dbo.CLIENTES ";

                if(VARIABLE == 1) {
                    parametro = SQL + " WHERE " + parametro;

                    dataSet.Clear();
                    //dataSet = cliente.BuscarRecord(parametro);
                    DGV_Data.AutoGenerateColumns = false;
                    DGV_Data.DataSource = dataSet;

                    DGV_Data.DataMember = "VerRecord";
                    L_Registros.Visible = true;
                    L_Registros.Text = string.Format("R: {0}", dataSet.Tables["VerRecord"].Rows.Count.ToString());
                } else {
                    MostrarTodoslosRegistrosCargados();
                    DGV_Data.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
                    L_Registros.Visible = false;
                }

            } catch(Exception ex) {
                MessageBox.Show(ex.Message);
            }
        }
        #region Eventos Enter y Leave
        private void TB_Nombre_Enter(object sender, EventArgs e) {
            if(TB_Nombre.Text == "   Nombre") {
                TB_Nombre.Text = string.Empty;
                TB_Nombre.ForeColor = Color.Black;
            }
        }

        private void TB_Nombre_Leave(object sender, EventArgs e) {
            if(TB_Nombre.Text == string.Empty) {
                TB_Nombre.Text = "   Nombre";
                TB_Nombre.ForeColor = Config.Colores.Secudary;
            }
        }

        private void TB_ID_Enter(object sender, EventArgs e) {
            if(TB_ID.Text == "   Codigo") {
                TB_ID.Text = string.Empty;
                TB_ID.ForeColor = Color.Black;
            }
        }

        private void TB_ID_Leave(object sender, EventArgs e) {
            if(TB_ID.Text == string.Empty) {
                TB_ID.Text = "   Codigo";
                TB_ID.ForeColor = Config.Colores.Secudary;
            }
        }

        private void TB_Direccion_Enter(object sender, EventArgs e) {
            if(TB_Direccion.Text == "   Direccion") {
                TB_Direccion.Text = string.Empty;
                TB_Direccion.ForeColor = Color.Black;
            }
        }

        private void TB_Direccion_Leave(object sender, EventArgs e) {
            if(TB_Direccion.Text == string.Empty) {
                TB_Direccion.Text = "   Direccion";
                TB_Direccion.ForeColor = Config.Colores.Secudary;
            }
        }

        private void TB_Pais_Enter(object sender, EventArgs e) {
            if(TB_Pais.Text == "   Pais") {
                TB_Pais.Text = string.Empty;
                TB_Pais.ForeColor = Color.Black;
            }
        }

        private void TB_Pais_Leave(object sender, EventArgs e) {
            if(TB_Pais.Text == string.Empty) {
                TB_Pais.Text = "   Pais";
                TB_Pais.ForeColor = Config.Colores.Secudary;
            }
        }

        private void TB_ID_KeyPress(object sender, KeyPressEventArgs e) {
            if(!(char.IsNumber(e.KeyChar)) && (e.KeyChar != (char)Keys.Back)) {
                e.Handled = true;
                return;
            }
        }
        #endregion

        #region Insertar_actualizar_Eliminar_Reporte
        protected override void IconButton_Insertar_Click(object sender, EventArgs e) {
            Forms.FormClienteInsUp formClienteInsUp = new FormClienteInsUp();
            formClienteInsUp.ShowDialog();

            MostrarTodoslosRegistrosCargados();
        }

        protected override void IconButton_Actualizar_Click(object sender, EventArgs e) => SelectToEditItem();

        protected override void IconButton_Delete_Click(object sender, EventArgs e) {
            int fila = DGV_Data.CurrentRow.Index;

            if(DGV_Data.Rows.Count != 0) {
                id = Convert.ToInt32(DGV_Data.Rows[fila].Cells[0].Value);
                if(cliente == null)
                    cliente = new Negocios.Cliente();
                if(cliente.ValidarRecord(id)) {
                    if(MessageBox.Show("Deseas Eliminar este Registro?", "Eliminar",
                        MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.Yes) {
                        cliente.Eliminar(id);

                        MessageBox.Show("Registro Eliminado correctamente");
                        MostrarTodoslosRegistrosCargados();
                    }
                }
            }
        }

        protected override void IconButton_Imprimir_Click(object sender, EventArgs e) {
            Forms.Report.FormClienteReport form = new Forms.Report.FormClienteReport();
            form.ShowDialog();
        }

        #endregion
        protected override void DGV_Data_CellValueChanged(object sender, DataGridViewCellEventArgs e) {
            if(DGV_Data.CurrentRow != null) {

            }
        }

        protected override void DGV_Data_EditingControlShowing(object sender, DataGridViewEditingControlShowingEventArgs e) {
            e.Control.KeyPress -= AllowNumbersOnly;
            if(DGV_Data.CurrentCell.ColumnIndex == 4) {
                e.Control.KeyPress += AllowNumbersOnly;
            }
        }

        protected override void DGV_Data_CellDoubleClick(object sender, DataGridViewCellEventArgs e) => SelectToEditItem();
        protected void SelectToEditItem() {
            try {
                int fila = DGV_Data.CurrentRow.Index;

                if(DGV_Data.Rows.Count != 0) {
                    id = Convert.ToInt32(DGV_Data.Rows[fila].Cells[0].Value);

                    FormClienteInsUp clienteInsUp = new FormClienteInsUp(id);
                    clienteInsUp.StartPosition = FormStartPosition.CenterScreen;
                    clienteInsUp.ShowInTaskbar = false;
                    clienteInsUp.ShowDialog();
                    id = 0;
                    MostrarTodoslosRegistrosCargados();
                } else {
                    MessageBox.Show("Debe seleccionar un elemento de la lista",
                        "Información del Sistema",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            } catch(Exception ex) {
                MessageBox.Show(ex.Message, "Información del Sistema",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void AllowNumbersOnly(Object sender, KeyPressEventArgs e) {
            if(!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
                e.Handled = true;
        }
    }
}
