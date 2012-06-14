package pos.inventorylistdetail;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pos.*;
import pos.config.Common;

import java.util.Map;
import net.sf.jasperreports.engine.JRException;
 public class InventorylistdetailProcessor extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		 Map parameters = request.getParameterMap();
		 //PrintWriter out = response.getWriter();
		 String keyword="";
		 String FromDay="";
		 String ToDay="";
		 Common com=new Common();
		//Lay Ngay
		 if (parameters.containsKey("date1")){
			 FromDay=request.getParameter("date1");
		 }
		 if (parameters.containsKey("date2")){
			 ToDay=request.getParameter("date2");
		 }
		// exporting process
			// 1- export to PDF
		 if (parameters.containsKey("pdf")){
			  keyword="pdf";			
			  try {
				com.openJasperReport("inventorylistdetail","inventorylistdetail.jrxml",keyword,response,FromDay,ToDay);
			} catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}						  			 
			// 2- export to HTML
		 } else if (parameters.containsKey("html")){
			 keyword="html";			
			 try {
				com.openJasperReport("inventorylistdetail","inventorylistdetail.jrxml",keyword,response,FromDay,ToDay);
			} catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}					
			// 3- export to Excel sheet
		 } else {
			 keyword="xls";			
			 try {
				com.openJasperReport("inventorylistdetail","inventorylistdetail.jrxml",keyword,response,FromDay,ToDay);
			} catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		 } 
    } 			 	  
}  		  	  	   