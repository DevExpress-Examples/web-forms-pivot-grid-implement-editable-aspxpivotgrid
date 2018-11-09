<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Q240884._Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v16.2, Version=16.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
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
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT Categories.CategoryID, Categories.CategoryName, Products.ProductID, Products.ProductName, Products.UnitPrice, Customers.CompanyName FROM ((((Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID) INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID) INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID) INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)" UpdateCommand="UPDATE Products SET UnitPrice = @UnitPrice WHERE (ProductID = @ID)">
        </asp:AccessDataSource>
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientInstanceName="pivot" OnCustomCallback="OnPivotCustomCallback" 
            ClientIDMode="AutoID">
            <ClientSideEvents CellClick="DxSample.onPivotCellClick" />
            <Fields>
                <dx:PivotGridField ID="fieldCategoryID" AreaIndex="0" FieldName="CategoryID" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCategoryName" Area="ColumnArea" AreaIndex="0" FieldName="CategoryName">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProductID" AreaIndex="0" FieldName="ProductID" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProductName" Area="FilterArea" AreaIndex="0" FieldName="ProductName" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldUnitPrice" Area="DataArea" AreaIndex="0" FieldName="UnitPrice">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCompanyName" Area="RowArea" AreaIndex="0" FieldName="CompanyName">
                </dx:PivotGridField>
            </Fields>
        </dx:ASPxPivotGrid>
</div>
    </form>
</body>
</html>
