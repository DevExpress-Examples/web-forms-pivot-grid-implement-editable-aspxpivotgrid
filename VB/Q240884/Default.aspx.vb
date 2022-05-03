Imports System
Imports System.Web.UI
Imports System.Globalization
Imports DevExpress.XtraPivotGrid
Imports DevExpress.Web
Imports DevExpress.Web.ASPxPivotGrid
Imports System.Data

Namespace Q240884
	Partial Public Class _Default
		Inherits Page

		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
			ASPxPivotGrid1.DataSource = CreatePivotData()
			ASPxPivotGrid1.DataBind()
		End Sub

		Private Function CreatePivotData() As DataTable
			Dim dt As New DataTable()
			If Session("PivotData") IsNot Nothing Then
				dt = DirectCast(Session("PivotData"), DataTable)
			Else
				dt = DirectCast(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView).Table
				Session("PivotData") = dt
			End If
			Return dt
		End Function

		Protected Sub OnPivotCustomCallback(ByVal sender As Object, ByVal e As PivotGridCustomCallbackEventArgs)
			Dim pivot As ASPxPivotGrid = DirectCast(sender, ASPxPivotGrid)
			Dim args() As String = e.Parameters.Split("|"c)
			Dim colIndex As Integer = Integer.Parse(args(1))
			Dim rowIndex As Integer = Integer.Parse(args(2))
			ChangeCellValue(pivot.CreateDrillDownDataSource(colIndex, rowIndex), DirectCast(pivot.GetCellValue(colIndex, rowIndex), Decimal), Decimal.Parse(args(3), NumberStyles.Currency))
		End Sub

		Private Sub ChangeCellValue(ByVal source As PivotDrillDownDataSource, ByVal oldValue As Decimal, ByVal newValue As Decimal)
			Dim diff As Decimal = newValue - oldValue
			Dim fact As Decimal = If(diff = newValue, diff / source.RowCount, diff / oldValue)
			For i As Integer = 0 To source.RowCount - 1
				Dim value As Decimal = DirectCast(source.GetValue(i, "UnitPrice"), Decimal)
				newValue = (If(value = 0, 1, value)) * (1D + fact)
				Dim dt As DataTable = DirectCast(Session("PivotData"), DataTable)
				Dim price As Double = Convert.ToDouble(newValue)
				Dim productID As Integer = Convert.ToInt32(source.GetValue(i, "ProductID"))
				For Each dr As DataRow In dt.Rows
					If Convert.ToInt32(dr("ProductID")) = productID Then
						dr("UnitPrice") = price
					End If
				Next dr
				Session("PivotData") = dt
				source.SetValue(i, "UnitPrice", newValue)
			Next i
		End Sub
	End Class
End Namespace
