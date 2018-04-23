<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Q240884._Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v10.2, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Untitled Page</title>
<%--    <script type="text/javascript">
			var colIndex, rowIndex;
	</script>
--%></head>
<body>
	<form id="form1" runat="server">
	<div>
		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT Categories.CategoryID, Categories.CategoryName, Products.ProductID, Products.ProductName, Products.UnitPrice, Customers.CompanyName FROM ((((Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID) INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID) INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID) INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)" UpdateCommand="UPDATE Products SET UnitPrice = @UnitPrice WHERE (ProductID = @ID)">
		</asp:AccessDataSource>
		<dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientInstanceName="pivot" DataSourceID="AccessDataSource1" OnCustomCallback="OnPivotCustomCallback">
			<ClientSideEvents CellClick="function(s, e) {
	colIndex = e.ColumnIndex;
	rowIndex = e.RowIndex;
}" />
			<Fields>
				<dx:PivotGridField ID="fieldCategoryID" AreaIndex="0" FieldName="CategoryID" Visible="False">
				</dx:PivotGridField>
				<dx:PivotGridField ID="fieldCategoryName" Area="ColumnArea" AreaIndex="0" FieldName="CategoryName">
				</dx:PivotGridField>
				<dx:PivotGridField ID="fieldProductID" AreaIndex="0" FieldName="ProductID" Visible="False">
				</dx:PivotGridField>
				<dx:PivotGridField ID="fieldProductName" Area="ColumnArea" AreaIndex="1" FieldName="ProductName">
				</dx:PivotGridField>
				<dx:PivotGridField ID="fieldUnitPrice" Area="DataArea" AreaIndex="0" FieldName="UnitPrice">
				</dx:PivotGridField>
				<dx:PivotGridField ID="fieldCompanyName" Area="RowArea" AreaIndex="0" FieldName="CompanyName">
				</dx:PivotGridField>
			</Fields>
		</dx:ASPxPivotGrid>
		<dx:ASPxPopupControl id="ASPxPopupControl1" runat="server" ClientInstanceName="editPopup"
			ShowHeader="False">
			<contentcollection>
<dx:PopupControlContentControl runat="server"><dx:ASPxTextBox runat="server" Width="170px" ClientInstanceName="editor" ID="ASPxTextBox1"></dx:ASPxTextBox>
 <dx:ASPxButton runat="server" AutoPostBack="False" EnableClientSideAPI="True" Text="OK" ID="ASPxButton1">
	 <ClientSideEvents Click="function(s, e) {
	pivot.PerformCallback(&quot;D|&quot; + colIndex + &quot;|&quot; + rowIndex + &quot;|&quot; + editor.GetText());
	editPopup.Hide();
}" />
 </dx:ASPxButton>
</dx:PopupControlContentControl>
</contentcollection>
		</dx:ASPxPopupControl></div>
	</form>
</body>
</html>