Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxPivotGrid

Namespace Q240884
	Public Class [Global]
		Inherits System.Web.HttpApplication

		Protected Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
			ASPxPivotGrid.LockDataRefreshOnCustomCallback = True
		End Sub

		Protected Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)

		End Sub
	End Class
End Namespace