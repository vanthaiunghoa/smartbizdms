package pos.config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
public class Common {
   private static Connection  connection = null;
   //TODO Log4J
   //TODO JDBCBase class
   /**
    * 
    * @author: www.smartbiz.vn
    * @DateTime: Aug 2, 2011, 3:34:38 PM
    * 
    * Hàm openConnection(): kết nối tới CSDL MySQL với các thông số được định nghĩa
    * trong lớp src/pos/config/WebReportCONST.java
    */
   public static Connection openConnection() {
       connection=null;
       try {
           String connString = "jdbc:mysql://localhost:3333/" + WebReportCONST.dbname;//lay cai nay o dau
           String driver = "com.mysql.jdbc.Driver";
           //load driver
           Class.forName(driver);          
           connection = DriverManager.getConnection(connString, WebReportCONST.user, WebReportCONST.pass);         
       } catch (SQLException ex) {
           Logger.getLogger(Common.class.getName()).log(Level.SEVERE, null, ex);
       } catch (ClassNotFoundException ex) {
           Logger.getLogger(Common.class.getName()).log(Level.SEVERE, null, ex);
       }
       return connection;
     }
     public void closeConnection() {
       try {
           connection.close();
       } catch (SQLException eSQL) {
       } finally {
           connection = null;
       }
     }     
     /**
      * openFile() Hàm mở đọc file excel,html,pdf với các params:
      *  + @param sReportName : tên report
      *  + @param sPathFileOutput : đường dẫn tới file report cần mở
      *  + @param sReportType : kiểu report
      *  + @param response
      */
     public void openFile(String sReportName,String sPathFileOutput,String sReportType,HttpServletResponse response){
    	 try {
    		/**
    		 * 1. Load file HTML/PDF/EXCEL đã xuất ra ở ổ 'D:/' và lưu vào trong bộ nhớ đệm BufferedInputStream
    		 *    với các params:
    		 *    + sPathFileOutput: Đường dẫn tới file HTML/PDF/EXCEL được lưu trong ổ D:/
    		 *    + size: file size (in bytes)
    		 *    + [] data: allocate byte array of right size
    		 *    + bstr.read( data, 0, size ): read into byte array
    		 */
    		sPathFileOutput="D://"+sReportName+"."+sReportType;    		
  			File f = new File(sPathFileOutput);
  			FileInputStream istr = new FileInputStream(sPathFileOutput);
  			BufferedInputStream bstr = new BufferedInputStream(istr);
  			int size = (int) f.length(); 
  			byte[] data = new byte[size]; 
  			bstr.read( data, 0, size );
  			bstr.close();  			
  			if(sReportType=="xls"){
  				sReportType="application/vnd.ms-excel";
  			}
  			else{
  				sReportType="application/"+sReportType;
  			}
  			/**
  			 * 2. Open Browser để đọc file
  			 */
  			String content="inline;filename="+sReportName;
  			response.setContentType(sReportType);
  			response.setHeader("Content-Disposition",content); 
  			response.setHeader("Cache-Control", "cache"); // to make IE work!
  	        response.setHeader("Pragma", "cache"); // to make IE work!
  	        response.setDateHeader("Expires", 1); 
  			OutputStream OutStrm = response.getOutputStream();
  			OutStrm.write(data);
  			OutStrm.flush();
  			OutStrm.close();
  			}catch(Exception e ){
  				//TODO using logger & prevent of using printStackTrace.
  				Logger.getLogger(Common.class.getName()).log(Level.SEVERE, null, e);
  			    System.out.println(e);
  			    e.printStackTrace();
  			}
      }     
     
     /**
      *  Hàm printReport(): Lấy dữ liệu input params vào Report xử lý và in ra báo cáo
      *  @param  sReportName: tên report
      *  @param  inpReportName : file report design
      *  @param  sReportType: kiểu report
      *  @param  response
      *  @param  mReportInputParams : mảng băm chứa các giá trị params input
      *  @throws JRException
      *  @throws IOException
      */
     @SuppressWarnings("unchecked")
	public void printReport(String sReportName, String inpReportName, String sReportType, HttpServletResponse response, HashMap mReportInputParams) throws JRException, IOException
     {
    	 /**
    	  * 1. Load report input
    	  *    + sPathFileInput: Đường dẫn tới file report design trong folder src/pos/reports
    	  *    + JasperReport  : Chứa report design
    	  *    + JasperPrint   : Đổ dữ liệu vào report
    	  */
    	 JasperReport jasperReport;
		 JasperPrint  jasperPrint; 			  		
		 Connection conn= (Connection)openConnection();		 
		 String sPathFileOutput = "";		
		 String sPathFileInput="../../reports/"+inpReportName;			 
         JasperDesign design = null;
         InputStream input = new FileInputStream(new File(this.getClass().getResource(sPathFileInput).getFile())); 
		 design = JRXmlLoader.load(input);
         jasperReport = JasperCompileManager.compileReport(design);          
         jasperPrint  = JasperFillManager.fillReport(jasperReport, mReportInputParams, conn);
         /**
          * 2.export to PDF/HTML/PDF with params:
          *   + sReportType: kiểu report
          *   + sPathFileOutput: đường dẫn để lưu file report xuất ra
          *   + openFile(): Mở đọc file report (được lưu trong ổ D:/) với định dạng tương ứng(html/pdf/xls)
          */
         if(sReportType=="pdf"){
        	sPathFileOutput="D://"+sReportName+".pdf";        	
     		JasperExportManager.exportReportToPdfFile(jasperPrint, sPathFileOutput);
     		openFile(sReportName, sPathFileOutput, sReportType, response);
         }         
         else if(sReportType=="html"){
        	 sPathFileOutput="D://"+sReportName+".html";  
     		JasperExportManager.exportReportToHtmlFile(jasperPrint, sPathFileOutput);
     		openFile(sReportName, sPathFileOutput, sReportType, response);
         }else{
        	 sPathFileOutput="D://"+sReportName+".xls";
        	 ByteArrayOutputStream output = new ByteArrayOutputStream();
             OutputStream outputfile= new FileOutputStream(new File(sPathFileOutput));        	          
             JRXlsExporter exporterXLS = new JRXlsExporter();
             exporterXLS.setParameter(JRXlsExporterParameter.JASPER_PRINT,jasperPrint);
             exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME,sPathFileOutput);
             exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_STREAM,output);
             exporterXLS.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);
             exporterXLS.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
             exporterXLS.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
             exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
             exporterXLS.exportReport();
             outputfile.write(output.toByteArray()); 
     		 openFile(sReportName, sPathFileOutput, sReportType, response);
             
         }
     }
}
