<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Q240884/Default.aspx) (VB: [Default.aspx](./VB/Q240884/Default.aspx))
* [Default.aspx.cs](./CS/Q240884/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Q240884/Default.aspx.vb))
<!-- default file list end -->
# How to implement an editable ASPxPivotGrid


<p>This example demonstrates how to allow end-users to modify data cell values within the ASPxPivotGrid.</p>


<h3>Description</h3>

<p>This example demonstrates how to allow users to modify data cell values via a pop-up editor. When a user clicks the OK button, the client script invokes the ASPxPivotGrid.PerformCallback function, and passes the modified value and column/row indexes stored in the global variables within the client-side ASPxPivotgrid.CellClick event, as parameters.<br />
At the server side, within the ASPxPivotGrid.CustomCallback event handler, column/row indexes are used to obtain the Drill Down data source for the processed cell. Then, the <a href="http://documentation.devexpress.com/#WindowsForms/DevExpressXtraPivotGridPivotDrillDownDataSource_SetValuetopic23">PivotDrillDownDataSource.SetValue</a> method is used to modify values So, when these values are used to calculate a summary value for this cell, the result matches the value entered by the user.<br />
The cell template is used only to obtain the coordinates to correctly position the pop-up window.</p>

<br/>


