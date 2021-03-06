﻿using Presentacion.Config.Forms;

namespace Presentacion.Config.Report {
    public partial class FormProductoReport : FormReport {
        public FormProductoReport() {
            InitializeComponent();
            Report_Load();
        }

        protected override void Report_Load() {
            Negocios.ProductoReport reportModel = new Negocios.ProductoReport();

            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource = new
                Microsoft.Reporting.WinForms.ReportDataSource("DataSet_Producto", reportModel.CreateReport());

            ReportViewer_Reporte.LocalReport.ReportEmbeddedResource =
                "Presentacion.Config.Report.Report_Producto.rdlc";

            ReportViewer_Reporte.LocalReport.DataSources.Clear();
            ReportViewer_Reporte.LocalReport.DataSources.Add(reportDataSource);
            base.Report_Load();
        }
    }
}
