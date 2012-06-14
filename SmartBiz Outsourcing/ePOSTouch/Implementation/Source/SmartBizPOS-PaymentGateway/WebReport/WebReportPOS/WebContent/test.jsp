<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf8" />
    <title>Report</title> 
    <link rel="stylesheet" href="css/test.css" type="text/css" />
    <script type="text/javascript" src="js/jquery.jcarousel.js"></script>  
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
<div id="body_left">
	 <div class="LeftColumn">
	 	
	 	<h2 id="tittle">Menu</h2>	 		 	
         <ul class="DefaultList ListStyle08 LavaLamp lavaLampTopStyle jcarousel-list jcarousel-list-vertical" id="lstRep"" style="height: 447px; top: 0px;">		   		
				<li class="Current jcarousel-item jcarousel-item-vertical jcarousel-item-1 jcarousel-item-1-vertical selectedLava" jcarouselindex="1">
					<div class="Item01">
						<div class="OuterText">
							<div class="MiddleText">
								<div class="InnerText">
									<a href="chartsales.jsp"title="chartsales">
									<span>ChartSales</span>
									</a>
								</div>
							</div>
						</div>
						<img alt="" src="images/s-icon1.png"/>
					</div>
				</li>
				<li class="jcarousel-item jcarousel-item-vertical jcarousel-item-2 jcarousel-item-2-vertical selectedLava" jcarouselindex="2">
					<div class="Item01">
						<div class="OuterText">
							<div class="MiddleText">
								<div class="InnerText">
									<a href="top10sales.jsp" class="" title="top10sales">
									<span>Top10Sales</span>
									</a>
								</div>
							</div>
						</div>
							<img alt="" src="images/s-icon2.png"/>
					</div>
				</li>
		   		<li class="jcarousel-item jcarousel-item-vertical jcarousel-item-2 jcarousel-item-2-vertical selectedLava" jcarouselindex="2">
					<div class="Item01">
						<div class="OuterText">
							<div class="MiddleText">
								<div class="InnerText">
									<a href="10slowestsales.jsp" class="" title="10slowestsales">
									<span>10SlowestSales</span>
									</a>
								</div>
							</div>
						</div>
							<img alt="" src="images/s-icon3.png"/>
					</div>
				</li>
				<li class="jcarousel-item jcarousel-item-vertical jcarousel-item-2 jcarousel-item-2-vertical selectedLava" jcarouselindex="2">
					<div class="Item01">
						<div class="OuterText">
							<div class="MiddleText">
								<div class="InnerText">
									<a href="salecatalog.jsp" class="" title="salecatalog">
									<span>SaleCatalog</span>
									</a>
								</div>
							</div>
						</div>
							<img alt="" src="images/s-icon4.png"/>
					</div>
				</li>
				<li class="jcarousel-item jcarousel-item-vertical jcarousel-item-2 jcarousel-item-2-vertical selectedLava" jcarouselindex="2">
					<div class="Item01">
						<div class="OuterText">
							<div class="MiddleText">
								<div class="InnerText">
									<a href="productlabels.jsp" class="" title="productlabels">
									<span>ProductLabels</span>
									</a>
								</div>
							</div>
						</div>
							<img alt="" src="images/s-icon5.png"/>
					</div>
				</li>
				<li class="jcarousel-item jcarousel-item-vertical jcarousel-item-2 jcarousel-item-2-vertical selectedLava" jcarouselindex="2">
					<div class="Item01">
						<div class="OuterText">
							<div class="MiddleText">
								<div class="InnerText">
									<a href="inventory.jsp" class="" title="inventory">
									<span>Inventory</span>
									</a>
								</div>
							</div>
						</div>
							<img alt="" src="images/s-icon6.png"/>
					</div>
				</li>
				<li class="jcarousel-item jcarousel-item-vertical jcarousel-item-2 jcarousel-item-2-vertical selectedLava" jcarouselindex="2">
					<div class="Item01">
						<div class="OuterText">
							<div class="MiddleText">
								<div class="InnerText">
									<a href="inventorylistdetail.jsp" class="" title="inventorylistdetail">
									<span>InventoryListDetail</span>
									</a>
								</div>
							</div>
						</div>
							<img alt="" src="images/s-icon8.png"/>
					</div>
				</li>
				<li class="jcarousel-item jcarousel-item-vertical jcarousel-item-2 jcarousel-item-2-vertical selectedLava" jcarouselindex="2">
					<div class="Item01">
						<div class="OuterText">
							<div class="MiddleText">
								<div class="InnerText">
									<a href="inventorydiffdetail.jsp" class="" title="inventorydiffdetail">
									<span>InventoryDiffDetail</span>
									</a>
								</div>
							</div>
						</div>
							<img alt="" src="images/s-icon5.png"/>
					</div>
				</li>
					   				                		                		                		         
          </ul>                                 
    </div>
</div>
<div id="body_main">
<form method="get" onsubmit="return validate();" action='InventoryProcessor' name="frm">
<div id="search">	
		<table border="0" cellpadding="0" cellspacing="0">
		 <tr>	
			<td><label style="font-size: 13px;font-weight:800; font-family: arial;color: blue">FromDate&nbsp;</label></td>							
		    <td><input type="text" name="date1" id="cdate1"/></td>		    		    	  
		    <td><input type="button"  class="Calendar" style="border: 0;display: block;height: 30px;width: 25px" value="" onclick="displayDatePicker('date1', this);"/></td>
		    <td><label style="font-size: 13px;font-weight:800;font-family: arial;color: blue">&nbsp;&nbsp;&nbsp;ToDate&nbsp;</label></td>							
		    <td><input type="text" name="date2" id="cdate2"/></td>		    		    	  
		    <td><input type="button" class="Calendar" style="border: 0;display: block;height: 30px;width: 25px" value="" onclick="displayDatePicker('date2', this);"/></td>
		  </tr>  
		</table>			
</div>

<ul id="bigbuttons">
<li><a><input class="gallery" style=" background: url('../images/html.png');border: 0" type="submit" name="html" value="Html" /></a></li>
<li><a><input class="gallery" style=" background: url('../images/excel.png');border: 0" type="submit" name="excel" value="Excel" /></a></li>
<li><a><input class="gallery" style=" background: url('../images/pdf.png');border: 0" type="submit" name="pdf" value="Pdf" /></a></li>
</ul>
</form>
<div id="content">	
</div>
</div>
<!-- End Wrapper-->
</div>
</body>
</html>