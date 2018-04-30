<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <!-- The jQuery library is a prerequisite for all jqSuite products -->
    <script type="text/ecmascript" src="resources/js/jquery.min.js"></script> 
    <!-- This is the Javascript file of jqGrid -->   
    <script type="text/ecmascript" src="resources/js/trirand/jquery.jqGrid.min.js"></script>
    <!-- This is the localization file of the grid controlling messages, labels, etc.
    <!-- We support more than 40 localizations -->
    <script type="text/ecmascript" src="resources/js/trirand/i18n/grid.locale-en.js"></script>
    <!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
    <link rel="stylesheet" type="text/css" media="screen" href="resources/css/jquery-ui.css" />
    <!-- The link to the CSS that the grid needs -->
    <link rel="stylesheet" type="text/css" media="screen" href="resources/css/trirand/ui.jqgrid.css" />
    <meta charset="utf-8" />
    <title>jqGrid Loading Data - JSON</title>
</head>
<body>

    <table id="jqGrid"></table>
    <div id="jqGridPager"></div>

    <br /><br />

    <div id="detailsPlaceholder">
        <table id="jqGridDetails"></table>
        <div id="jqGridDetailsPager"></div>
    </div>

    <script type="text/javascript"> 
    
        $(document).ready(function () {
			
			// master grid
            $("#jqGrid").jqGrid({
                url: 'data.json',
                datatype: "json",
                colModel: [
                    { label: 'ID', name: 'CustomerID', key: true, width: 75 },
                    { label: 'Company Name', name: 'CompanyName', width: 150 },
                    { label: 'Contact Name', name: 'ContactName', width: 150 },
                    { label: 'Phone', name: 'Phone', width: 150 },
                    { label: 'City', name: 'City', width: 150 }
                ],
                width: 780,
                height: 150,
                rowNum: 7,
				viewrecords: true,
				loadonce: true,
				caption: 'Master Grid',
                onSelectRow: function(rowid, selected) {
					if(rowid != null) {
						jQuery("#jqGridDetails").jqGrid('setGridParam',{url: rowid+".json",datatype: 'json'}); // the last setting is for demo only
						jQuery("#jqGridDetails").jqGrid('setCaption', 'Detail Grid::'+rowid);
						jQuery("#jqGridDetails").trigger("reloadGrid");
					}					
				}, // use the onSelectRow that is triggered on row click to show a details grid
				onSortCol : clearSelection,
				onPaging : clearSelection,
                pager: "#jqGridPager"
            });
        });
		// detail grid
        $("#jqGridDetails").jqGrid({
			url: 'empty.json',
            mtype: "GET",
            datatype: "json",
            page: 1,
			colModel: [
                    { label: 'Order ID', name: 'OrderID', key: true, width: 75 },
                    { label: 'Required Date', name: 'RequiredDate', width: 100 },
                    { label: 'Ship Name', name: 'ShipName', width: 100 },
                    { label: 'Ship City', name: 'ShipCity', width: 100 },
                    { label: 'Freight', name: 'Freight', width: 75 }
			],
			width: 780,
			rowNum: 5,
			loadonce: true,
			height: '100',
			viewrecords: true,
			caption: 'Detail grid::',
			pager: "#jqGridDetailsPager"
		});

			function clearSelection() {
				jQuery("#jqGridDetails").jqGrid('setGridParam',{url: "empty.json", datatype: 'json'}); // the last setting is for demo purpose only
				jQuery("#jqGridDetails").jqGrid('setCaption', 'Detail Grid:: none');
				jQuery("#jqGridDetails").trigger("reloadGrid");
				
			}
			
    </script>

    
</body>
</html>