
package vn.smartbiz.pos.payment;

import javax.xml.soap.*;
import javax.xml.namespace.QName;
import java.util.Iterator;
import java.net.URL;
import org.w3c.dom.*;

public class MerchantWARE_Request {
	
  private SOAPBodyElement bodyElement;
  private String strName;
  private String strSiteId;
  private String strKey;
  private String strOrderNumber;
  private String strAmount;
  private String strPAN;
  private String strExpDate;
  private String strCardHolder;
  private String strAVSStreetAddress;
  private String strAVSZipCode;
  private String strCVCode;
  private String strAllowDuplicates;
  private String strReferenceCode;
  private MerchantWARE_Example mwJavaExample;
  private String issueRequest;
  
  //This is for Issue Keyed Sales case
  MerchantWARE_Request(String name, String siteId, String key, String orderNumber,
		  String amount, String pan, String expDate, String cardHolder, 
		  String avsStreetAddress, String avsZipCode, String cvCode, Boolean allowDuplicates,
		  MerchantWARE_Example javaExample) 
  {
	strName = name;
	strSiteId = siteId;
	strKey = key;
	strOrderNumber = orderNumber;
	strAmount = amount;
	strPAN = pan;
	strExpDate = expDate;
	strCardHolder = cardHolder;
	strAVSStreetAddress = avsStreetAddress;
	strAVSZipCode = avsZipCode;
	strCVCode = cvCode;
	strAllowDuplicates = "";
	if(allowDuplicates)
	{
		strAllowDuplicates = "True";
	}
	mwJavaExample = javaExample;
	issueRequest = "IssueKeyedSale";
  }
  
  //This is for Issue Batch case
  MerchantWARE_Request(String name, String siteId, String key,
		  MerchantWARE_Example javaExample)
  {
	strName = name;
	strSiteId = siteId;
	strKey = key;
	mwJavaExample = javaExample;
	issueRequest = "IssueBatch";
  }
  
  //This is for Issue Keyed Refund case
  MerchantWARE_Request(String name, String siteId, String key, String orderNumber,
		  String amount, String pan, String expDate, String cardHolder,
		  MerchantWARE_Example javaExample)
  {
	strName = name;
	strSiteId = siteId;
	strKey = key;
	strOrderNumber = orderNumber;
	strAmount = amount;
	strPAN = pan;
	strExpDate = expDate;
	strCardHolder = cardHolder;
	mwJavaExample = javaExample;
	issueRequest = "IssueKeyedRefund";
  }
  
  //This is for Issue Void case
  MerchantWARE_Request(String name, String siteId, String key, String referenceCode,
		  MerchantWARE_Example javaExample)
  {
	strName = name;
	strSiteId = siteId;
	strKey = key;
	strReferenceCode = referenceCode;
	mwJavaExample = javaExample;
	issueRequest = "IssueVoid";
  }
    
  public void send()  {
    try {
    	SOAPConnectionFactory soapConnectionFactory =
        SOAPConnectionFactory.newInstance();
      SOAPConnection connection =
        soapConnectionFactory.createConnection();

      MessageFactory factory =
        MessageFactory.newInstance();
      SOAPMessage message = factory.createMessage();
      SOAPFactory soapFactory = SOAPFactory.newInstance();

      SOAPPart part = message.getSOAPPart();
      SOAPEnvelope envelope = part.getEnvelope();
      SOAPHeader header = message.getSOAPHeader();
      SOAPBody body = message.getSOAPBody();
      
      QName envelopeAttri = new QName("http://schemas.xmlsoap.org/soap/encoding/",
      "encodingStyle", "SOAP-ENV");
      envelope.addAttribute(envelopeAttri, "http://schemas.xmlsoap.org/soap/encoding/");
      
      header.detachNode();

      QName bodyName = new QName("http://merchantwarehouse.com/MerchantWARE/Client/TransactionRetail",
    	issueRequest);
      bodyElement =
        body.addBodyElement(bodyName);

      addBodyElement("strName", strName);
      addBodyElement("strSiteId", strSiteId);
      addBodyElement("strKey", strKey);
      if (issueRequest.equalsIgnoreCase("IssueKeyedSale") || issueRequest.equalsIgnoreCase("IssueKeyedRefund"))
      {
    	  addBodyElement("strOrderNumber", strOrderNumber);
    	  addBodyElement("strAmount", strAmount);
    	  addBodyElement("strPAN", strPAN);
    	  addBodyElement("strExpDate", strExpDate);
    	  addBodyElement("strCardHolder", strCardHolder);
    	  if (issueRequest.equalsIgnoreCase("IssueKeyedSale"))
    	  {
    		  addBodyElement("strAVSStreetAddress", strAVSStreetAddress);
    		  addBodyElement("strAVSZipCode", strAVSZipCode);
    		  addBodyElement("strCVCode", strCVCode);
    		  addBodyElement("strAllowDuplicates", strAllowDuplicates);
    	  }
      } else if (issueRequest.equalsIgnoreCase("IssueVoid"))
      {
    	  addBodyElement("strReferenceCode", strReferenceCode);
      }
      URL endpoint = new URL
        ("https://ps1.merchantware.net/MerchantWARE/ws/RetailTransaction/TXRetail.asmx");
      SOAPMessage response = 
        connection.call(message, endpoint);

      connection.close();
      
      outputResults(response);
      
    } catch (Exception ex) {
      ex.printStackTrace();
    }
  }
  
  private void addBodyElement(String name, String value) throws Exception
  {
	  QName elementName = new QName(name);
	  SOAPElement element = bodyElement.addChildElement(elementName);
	  element.addTextNode(value);
  }

  private void outputResults(SOAPMessage response) throws SOAPException
  {
	  resetOutputFields();
	  
	  SOAPBody soapBody = response.getSOAPBody();
      
      String result = issueRequest + "Result";
      NodeList Results = soapBody.getElementsByTagName(result);
           
      Iterator iter = ((SOAPElement)Results.item(0)).getChildElements();
      while(iter.hasNext())
      {
        SOAPElement element = (SOAPElement)iter.next();
        if (element.getLocalName().equals("ReferenceID"))
        {
          mwJavaExample.setReferenceIdTextField(element.getValue());
          mwJavaExample.setReferenceCodeTextField(element.getValue());
        } else if (element.getLocalName().equals("OrderNumber"))
        {
          mwJavaExample.setOutOrderNumberTextField(element.getValue());
     	} else if (element.getLocalName().equals("TXDate"))
     	{
      	  mwJavaExample.setTxDateTextField(element.getValue());
      	} else if (element.getLocalName().equals("ApprovalStatus") || element.getLocalName().equals("BatchStatus"))
     	{
      	  mwJavaExample.setApprovalStatusTextField(element.getValue());
      	} else if (element.getLocalName().equals("AuthCode"))
     	{
      	  mwJavaExample.setAuthCodeTextField(element.getValue());
      	} else if (element.getLocalName().equals("CardHolder"))
     	{
       	  mwJavaExample.setOutCardHolderTextField(element.getValue());
       	} else if (element.getLocalName().equals("Amount") || element.getLocalName().equals("BatchAmount"))
     	{
          mwJavaExample.setOutAmountTextField(element.getValue());
        } else if (element.getLocalName().equals("Type"))
     	{
          mwJavaExample.setTypeTextField(element.getValue());
        } else if (element.getLocalName().equals("CardNumber"))
     	{
          mwJavaExample.setCardNumberTextField(element.getValue());
        } else if (element.getLocalName().equals("CardType"))
     	{
          mwJavaExample.setCardTypeTextField(element.getValue());
        } else if (element.getLocalName().equals("AVSResponse"))
     	{
          mwJavaExample.setAvsResponseTextField(element.getValue());
        } else if (element.getLocalName().equals("CVResponse"))
     	{
          mwJavaExample.setCvResponseTextField(element.getValue());
        } else if (element.getLocalName().equals("POSEntryType"))
     	{
          mwJavaExample.setPosEntryTypeTextField(element.getValue());
        } else if (element.getLocalName().equals("TXCount"))
     	{
            mwJavaExample.setTxCountTextField(element.getValue());
        }
 //        	   System.out.print(element.getLocalName() + " = ");
 //        	   System.out.println(element.getValue());
     }
  }
  
  private void resetOutputFields()
  {
      mwJavaExample.setReferenceIdTextField("N/A");
      mwJavaExample.setOutOrderNumberTextField("N/A");
   	  mwJavaExample.setTxDateTextField("N/A");
      mwJavaExample.setTxDateTextField("N/A");
      mwJavaExample.setApprovalStatusTextField("N/A");
      mwJavaExample.setAuthCodeTextField("N/A");
      mwJavaExample.setOutCardHolderTextField("N/A");
      mwJavaExample.setOutAmountTextField("N/A");
      mwJavaExample.setOutAmountTextField("N/A");
      mwJavaExample.setTypeTextField("N/A");
      mwJavaExample.setCardNumberTextField("N/A");
      mwJavaExample.setCardTypeTextField("N/A");
      mwJavaExample.setAvsResponseTextField("N/A");
      mwJavaExample.setCvResponseTextField("N/A");
      mwJavaExample.setPosEntryTypeTextField("N/A");
      mwJavaExample.setTxCountTextField("N/A");
  }
} 
