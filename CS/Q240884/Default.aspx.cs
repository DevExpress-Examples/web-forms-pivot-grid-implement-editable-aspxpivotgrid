using System;
using System.Web.UI;
using System.Globalization;
using DevExpress.XtraPivotGrid;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxPivotGrid;
using System.Data;

namespace Q240884 {
    public partial class _Default : Page {
        protected void Page_Load(object sender, EventArgs e) {
            ASPxPivotGrid1.CellTemplate = new CellTemplate();
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
                AccessDataSource1.UpdateParameters.Clear();
                decimal value = (decimal)source.GetValue(i, "UnitPrice");
                newValue = (value == 0 ? 1 : value) * (1m + fact);
                AccessDataSource1.UpdateParameters.Add("UnitPrice", DbType.Decimal,
                    newValue.ToString());
                AccessDataSource1.UpdateParameters.Add("ID", DbType.Int32,
                    source.GetValue(i, "ProductID").ToString());
                AccessDataSource1.Update();
                source.SetValue(
                        i, "UnitPrice",
                        newValue
                    );
            }
        }
    }

    public class CellTemplate :ITemplate {
        #region ITemplate Members

        public void InstantiateIn(Control container) {
            PivotGridCellTemplateContainer c = (PivotGridCellTemplateContainer)container;
            ASPxLabel l = new ASPxLabel();
            l.ClientSideEvents.Click = "function(s, e) { editor.SetText(s.GetText()); editPopup.ShowAtPos(e.htmlEvent.pageX, e.htmlEvent.pageY); }";
            l.Text = c.Text;
            c.Controls.Add(l);
        }

        #endregion
    }
}
