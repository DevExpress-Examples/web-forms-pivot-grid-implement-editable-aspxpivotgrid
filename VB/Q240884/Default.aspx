<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Q240884._Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v21.2, Version=21.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Untitled Page</title>
	<script type="text/javascript" src="js/pivot-cell-editor.js"></script>
</head>
<body>
	<form id="form1" runat="server">
    <div>
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientInstanceName="pivot" OnCustomCallback="OnPivotCustomCallback" 
            ClientIDMode="AutoID" IsMaterialDesign="False" OptionsData-DataProcessingEngine="Optimized">
            <ClientSideEvents CellClick="DxSample.onPivotCellClick" />
            <Fields>
                <dx:PivotGridField ID="field2" AreaIndex="0" Visible="False" Caption="CategoryID" Name="field2">
                    <DataBindingSerializable>
                        <dx:DataSourceColumnBinding ColumnName="CategoryID" />
                    </DataBindingSerializable>
                </dx:PivotGridField>
                <dx:PivotGridField ID="field1" Area="ColumnArea" AreaIndex="0" Name="field1">
                    <DataBindingSerializable>
                        <dx:DataSourceColumnBinding ColumnName="CategoryName" />
                    </DataBindingSerializable>
                </dx:PivotGridField>
                <dx:PivotGridField ID="field3" AreaIndex="0" Visible="False" Caption="ProductID" Name="field3">
                    <DataBindingSerializable>
                        <dx:DataSourceColumnBinding ColumnName="ProductID" />
                    </DataBindingSerializable>
                </dx:PivotGridField>
                <dx:PivotGridField ID="field4" Area="FilterArea" AreaIndex="0" Visible="False" Caption="ProductName" Name="field4">
                    <DataBindingSerializable>
                        <dx:DataSourceColumnBinding ColumnName="ProductName" />
                    </DataBindingSerializable>
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldUnitPrice1" Area="DataArea" AreaIndex="0" Name="fieldUnitPrice1">
                    <DataBindingSerializable>
                        <dx:DataSourceColumnBinding ColumnName="UnitPrice" />
                    </DataBindingSerializable>
                </dx:PivotGridField>
                <dx:PivotGridField ID="field" Area="RowArea" AreaIndex="0" Name="field">
                    <DataBindingSerializable>
                        <dx:DataSourceColumnBinding ColumnName="CompanyName" />
                    </DataBindingSerializable>
                </dx:PivotGridField>
            </Fields>
            <OptionsData DataProcessingEngine="Optimized" />
        </dx:ASPxPivotGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Categories.CategoryID, Categories.CategoryName, Products.ProductID, Products.ProductName, Products.UnitPrice, Customers.CompanyName FROM ((((Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID) INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID) INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID) INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)" UpdateCommand="UPDATE Products SET UnitPrice = @UnitPrice WHERE (ProductID = @ID)"></asp:SqlDataSource>
    </div>
	</form>
</body>
</html>