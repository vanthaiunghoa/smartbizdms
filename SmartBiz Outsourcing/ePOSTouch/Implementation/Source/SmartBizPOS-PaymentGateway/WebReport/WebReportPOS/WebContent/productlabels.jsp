<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf8" />
    <title>Report</title> 
    <link rel="stylesheet" href="css/mystyle.css" type="text/css" />  
    <!-- CSS Including -->

<link rel="stylesheet" type="text/css" href="css/datepicker.css"/>
<script type="text/javascript" src="js/datepicker.js"></script>
<script>
function validate()
{
	 var  sdate1 = document.frm.date1.value;
	 var  sdate2 = document.frm.date2.value;
	 var sdateAr1=sdate1.split("-");
	 var sdateAr2=sdate2.split("-");
	if(document.frm.date1.value=="")
	{
		
		alert("Please enter the date.");
		document.frm.date1.focus();
		return false;
	}
	if(document.frm.date2.value=="")
	{
		
		alert("Please enter the date.");
		document.frm.date2.focus();
		return false;
	}
	if(document.frm.date2.value < document.frm.date1.value)
	{
		
		alert("Please ToDate > FromDate");
		document.frm.date2.focus();
		return false;
	}
	if(sdateAr1.length!=3)
	{
		alert("Please enter valid Date in mm-dd-yyyy format.");
		document.frm.date1.value="";
		document.frm.date1.focus();
		return false;
	}
	if(sdateAr2.length!=3)
	{
		alert("Please enter valid Date in mm-dd-yyyy format.");
		document.frm.date2.value="";
		document.frm.date2.focus();
		return false;
	}	
	return true;
	
}
</script>   	
</head>
<body>
<div id="wrapper"> 
<div id="body">
 <div id="body_left"><span class="menu">Menu</span><br></br>
  <div class="SubWrapper">
	        <div class="DetailPage">
	            <div class="LeftColumn1">
	               <ul class="SubMenuPages" id="left_menu"">
	               		<li class="selectedLava"><a href="chartsales.jsp" class="SubMenuPagesCur" title="chartsales"><span class="Content">ChartSales</span></a></li>
	               		<li class=""><a href="top10sales.jsp" class="" title="top10sales"><span class="Customer">Top10Sales</span></a></li>
	               		<li class=""><a href="10slowestsales.jsp" class="" title="10slowestsales"><span class="Enter">10SlowestSales</span></a></li>
	               		<li class=""><a href="salecatalog.jsp" class="" title="salecatalog"><span class="Human">SaleCatalog</span></a></li>
	               		<li class=""><a href="productlabels.jsp" class="" title="productlabels"><span class="Commerce">ProductLabels</span></a></li>
		                <li class=""><a href="inventory.jsp" class="" title="inventory"><span class="Smart">Inventory</span></a></li>
		                <li class=""><a href="inventorylistdetail.jsp" class="" title="inventorylistdetail"><span class="Business">InventoryListDetail</span></a></li>		                
		                <li class=""><a href="inventorydiffdetail.jsp" class="" title="inventorydiffdetail"><span class="Point">InventoryDiffDetail</span></a></li>		                		                		                		               
	                </ul>
	            </div>	           	            	          
	        </div>
	    </div>       
    </div>
</div>
<div id="body_main">
<form method="get" action='ProductlabelsProcessor' name="showall">
<div id="search">	
		<table border="0" cellpadding="0" cellspacing="0">
		 <tr>	
			<td><label style="font-size: 13px;font-weight:800; font-family: arial;color: blue">FromDate:</label></td>							
		    <td><input type="text" name="date1" id="cdate1"/></td>		    		    	  
		    <td><input type="button"  class="Calendar" style="border: 0;display: block;height: 30px;width: 25px" value="" onclick="displayDatePicker('date1', this);"/></td>
		    <td><label style="font-size: 13px;font-weight:800;font-family: arial;color: blue">ToDate:</label></td>							
		    <td><input type="text" name="date2" id="cdate2"/></td>		    		    	  
		    <td><input type="button"  class="Calendar" style="border: 0;display: block;height: 30px;width: 25px" value="" onclick="displayDatePicker('date2', this);"/></td>
		  </tr>  
		</table>			
</div>

<ul id="bigbuttons">
<li ><a><input class="gallery" style=" background: url('../images/btnHtml.png');border: 0" type="submit" name="html" value="HTML" /></a></li>
<li ><a><input class="gallery" style=" background: url('../images/btnExcel.png');border: 0" type="submit" name="excel" value="EXCEL" /></a> </li>
<li ><a><input class="gallery" style=" background: url('../images/btnPdf.png');border: 0" type="submit" name="pdf" value="PDF" /></a> </li>
</ul>
</form>
<div id="content">	
</div>
</div>
<!-- End Wrapper-->
</div>
</body>
</html>