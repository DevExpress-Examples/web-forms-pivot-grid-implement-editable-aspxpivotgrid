Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports System.Globalization
Imports DevExpress.XtraPivotGrid
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxPivotGrid
Imports System.Data

Namespace Q240884
	Partial Public Class _Default
		Inherits Page
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
			ASPxPivotGrid1.CellTemplate = New CellTemplate()
		End Sub

		Protected Sub OnPivotCustomCallback(ByVal sender As Object, ByVal e As PivotGridCustomCallbackEventArgs)
			Dim pivot As ASPxPivotGrid = CType(sender, ASPxPivotGrid)
			Dim args() As String = e.Parameters.Split("|"c)
			Dim colIndex As Integer = Integer.Parse(args(1))
			Dim rowIndex As Integer = Integer.Parse(args(2))
			ChangeCellValue(pivot.CreateDrillDownDataSource(colIndex, rowIndex), CDec(pivot.GetCellValue(colIndex, rowIndex)), Decimal.Parse(args(3), NumberStyles.Currency))
		End Sub

		Private Sub ChangeCellValue(ByVal source As PivotDrillDownDataSource, ByVal oldValue As Decimal, ByVal newValue As Decimal)
			Dim diff As Decimal = newValue - oldValue
			Dim fact As Decimal
			If diff = newValue Then
				fact = diff / source.RowCount
			Else
				fact = diff / oldValue
			End If
			For i As Integer = 0 To source.RowCount - 1
				AccessDataSource1.UpdateParameters.Clear()
				Dim value As Decimal = CDec(source.GetValue(i, "UnitPrice"))
				If value = 0 Then
					newValue = (1) * (1D + fact)
				Else
					newValue = (value) * (1D + fact)
				End If
				AccessDataSource1.UpdateParameters.Add("UnitPrice", DbType.Decimal, newValue.ToString())
				AccessDataSource1.UpdateParameters.Add("ID", DbType.Int32, source.GetValue(i, "ProductID").ToString())
				AccessDataSource1.Update()
				source.SetValue(i, "UnitPrice", newValue)
			Next i
		End Sub
	End Class

	Public Class CellTemplate
		Implements ITemplate
		#Region "ITemplate Members"

		Public Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
			Dim c As PivotGridCellTemplateContainer = CType(container, PivotGridCellTemplateContainer)
			Dim l As New ASPxLabel()
			l.ClientSideEvents.Click = "function(s, e) { editor.SetText(s.GetText()); editPopup.ShowAtPos(e.htmlEvent.clientX, e.htmlEvent.clientY); }"
			l.Text = c.Text
			c.Controls.Add(l)
		End Sub

		#End Region
	End Class
End Namespace
