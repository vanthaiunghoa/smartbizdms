package pos.inventory;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pos.*;
import pos.config.Common;
import com.mysql.jdbc.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URISyntaxException;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import src.vn.smartbiz.reportFinal.Model.Bean_Item;
import src.vn.smartbiz.reportFinal.Model.Dao_Item;
 public class InventoryProcessor extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		 Map parameters = request.getParameterMap();
		 //PrintWriter out = response.getWriter();
		 String keyword="";
		 String FromDay="";
		 String ToDay="";
		 Common com=new Common();	
		 DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");		 
		 if (parameters.containsKey("date1")){
			 FromDay=request.getParameter("date1");			
		 }
		 if (parameters.containsKey("date2")){
			 ToDay=request.getParameter("date2");
			 //ToDay=formatter.format(ToDay).toString();
		 }
		// exporting process
			// 1- export to PDF
		 if (parameters.containsKey("pdf")){
			  keyword="pdf";			
			  try {
				com.openJasperReport("inventory","inventory.jrxml",keyword,response,FromDay,ToDay);
			} catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}						  			 
			// 2- export to HTML
		 } else if (parameters.containsKey("html")){
			 keyword="html";			
			 try {
				com.openJasperReport("inventory","inventory.jrxml",keyword,response,FromDay,ToDay);
			} catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}					
			// 3- export to Excel sheet
		 } else {
			 keyword="xls";			
			 try {
				com.openJasperReport("inventory","inventory.jrxml",keyword,response,FromDay,ToDay);
			} catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		 } 
    } 			 	  
}  		  	  	   