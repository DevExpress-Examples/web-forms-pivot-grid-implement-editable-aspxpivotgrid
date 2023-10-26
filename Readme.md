<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128577606/10.2.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E1949)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx.cs](./CS/Q240884/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Q240884/Default.aspx.vb))
* [Global.asax.cs](./CS/Q240884/Global.asax.cs) (VB: [Global.asax.vb](./VB/Q240884/Global.asax.vb))
<!-- default file list end -->
# How to implement an editable ASPxPivotGrid
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/128577606/)**
<!-- run online end -->


<p>This example demonstrates how to allow end-users to modify data cell values within the ASPxPivotGrid.</p>


<h3>Description</h3>

<p>Starting from version 10.2, data is not refreshed on custom callbacks. This example updates data on callbacks, and require the ASPxPivotGrid row refresh data. To enable this feature again, set the ASPxPivotGrid.LockDataRefreshOnCustomCallback static property to true. </p><p>In addition, please track the <a data-ticket="S37596">The ASPxPivotGrid.LockDataRefreshOnCustomCallback property should be instance-specific</a> suggestion if you want to see this property non-static.</p>

<br/>


