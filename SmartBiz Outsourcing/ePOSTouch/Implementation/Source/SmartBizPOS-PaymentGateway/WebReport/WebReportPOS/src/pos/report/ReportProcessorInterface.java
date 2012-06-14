/**
 * @author www.smartbiz.vn
 */
package pos.report;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import pos.config.Common;

public abstract class ReportProcessorInterface extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet{	
	@SuppressWarnings("unchecked")
	protected void openJasperReport(HttpServletRequest request, HttpServletResponse response, String sReportType, String sReportName, HashMap mReportInputParams) throws ServletException, IOException {
		response.setContentType("text/plain");
		Common com=new Common();
		Map parameters = request.getParameterMap();		 
		 /**
		  *  1. Get input params
		  *   + sReportType : kiểu report(Vd:html/pdf/xls)
		  *   + sReportName : tên report
		  *   + Hàm sReportName() : trả về tên của report được định nghĩa lại trong từng
		  *   						 processor của mỗi report.
		  *   + mReportInputParams: mảng băm chứa giá trị của các params input
		  *   + Hàm setReportInputParams(): trả về mảng băm chứa các params input
		  *     . sDateFrom: Từ ngày
		  *     . sDateTo  : Tới ngày
		  *    và được định nghĩa lại trong từng processor của mỗi report.
		  */			
		sReportType = "";
		if (parameters.containsKey("EDIT_PDF")){
			sReportType="pdf";	
		}else if (parameters.containsKey("EDIT_HTML")){
			sReportType="html";	
		}else{
			sReportType="xls";
		}
		sReportName=setReportName();		
		mReportInputParams=setReportInputParams(request);		 
		 /**
		  *  2. printReport(): hàm nhận dữ liệu các input params và xử lí xuất ra report với từng
		  *     kiểu report tương ứng, chứa trong file src/pos/confif/Common.java		 
	      *     với các params sau:		 
		  *     + @param sReportName : tên report
		  *     + @param sReportName+".jrxml": tên file report design(xml)
		  *     + @param sReportType : kiểu report(VD:html/pdf/excel)
		  *     + @Hashmap mReportInputParams: mảng băm chứa giá trị của các params input:
		  *       . @param sDateFrom: Từ ngày
		  *       . @param sDateTo  : Tới ngày
		  */		 	
		 try {
			com.printReport(sReportName, sReportName+".jrxml", sReportType, response, mReportInputParams);
		} catch (JRException e) {
			Logger.getLogger(Common.class.getName()).log(Level.SEVERE, null, e);
			e.printStackTrace();
		}
    }
	
	@SuppressWarnings("unchecked")
	protected abstract HashMap setReportInputParams(HttpServletRequest request);

	@SuppressWarnings("unchecked")
	protected abstract String setReportName();
	
}
