<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template> 
   <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:web="http://www.webserviceX.NET">
     <soap:Header/>
     <soap:Body>
        <web:GetInfoByCity>
           <web:USCity><xsl:value-of select="city" /></web:USCity>
        </web:GetInfoByZIP>
     </soap:Body>
   </soap:Envelope>
  </xsl:template> 
</xsl:stylesheet>
