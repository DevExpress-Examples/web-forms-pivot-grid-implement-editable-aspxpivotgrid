using System;
using DevExpress.Web.ASPxPivotGrid;

namespace Q240884 {
    public class Global :System.Web.HttpApplication {

        protected void Application_Start(object sender, EventArgs e) {
            ASPxPivotGrid.LockDataRefreshOnCustomCallback = true;
        }

        protected void Application_End(object sender, EventArgs e) {

        }
    }
}