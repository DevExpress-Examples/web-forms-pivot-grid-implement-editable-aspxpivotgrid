using System;
using System.Web.UI;
using System.Globalization;
using DevExpress.XtraPivotGrid;
using DevExpress.Web;
using DevExpress.Web.ASPxPivotGrid;
using System.Data;

namespace Q240884 {
    public partial class _Default : Page {
        protected void Page_Load(object sender, EventArgs e) {
            ASPxPivotGrid1.DataSource = CreatePivotData();
            ASPxPivotGrid1.DataBind();
        }

        private DataTable CreatePivotData() {
            DataTable dt = new DataTable();
            if (Session["PivotData"] != null) {
                dt = (DataTable)Session["PivotData"];
            }
            else {
                dt = ((DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty)).Table;
                Session["PivotData"] = dt;
            }
            return dt;
        }

        protected void OnPivotCustomCallback(object sender, PivotGridCustomCallbackEventArgs e) {
            ASPxPivotGrid pivot = (ASPxPivotGrid)sender;
            string[] args = e.Parameters.Split('|');
            int colIndex = int.Parse(args[1]);
            int rowIndex = int.Parse(args[2]);
            ChangeCellValue(
                    pivot.CreateDrillDownDataSource(colIndex, rowIndex),
                    (decimal)pivot.GetCellValue(colIndex, rowIndex),
                    decimal.Parse(args[3], NumberStyles.Currency)
                );
        }

        private void ChangeCellValue(PivotDrillDownDataSource source, decimal oldValue, decimal newValue) {
            decimal diff = newValue - oldValue;
            decimal fact = diff == newValue ? diff / source.RowCount : diff / oldValue;
            for (int i = 0; i < source.RowCount; i++) {
                decimal value = (decimal)source.GetValue(i, "UnitPrice");
                newValue = (value == 0 ? 1 : value) * (1m + fact);
                DataTable dt = (DataTable)Session["PivotData"];
                double price = Convert.ToDouble(newValue);
                int productID = Convert.ToInt32(source.GetValue(i, "ProductID"));
                foreach (DataRow dr in dt.Rows) {
                    if (Convert.ToInt32(dr["ProductID"]) == productID) {
                        dr["UnitPrice"] = price;
                    }
                }
                Session["PivotData"] = dt;
                source.SetValue(
                        i, "UnitPrice",
                        newValue
                    );
            }
        }
    }
}
