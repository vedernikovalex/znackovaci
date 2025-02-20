<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="text" encoding="UTF-8" />

  <xsl:template match="/">
    <xsl:text>{ "providers": [</xsl:text>
    <xsl:for-each select="healthcareData/providerRecord">
      <xsl:sort select="provName"/>
      <xsl:if test="position() &gt; 1">
        <xsl:text>,</xsl:text>
      </xsl:if>
      <xsl:text>{</xsl:text>
        <xsl:text>"provID": "</xsl:text><xsl:value-of select="@provID"/><xsl:text>",</xsl:text>
        <xsl:text>"provIdentifier": "</xsl:text><xsl:value-of select="provIdentifier"/><xsl:text>",</xsl:text>
        <xsl:text>"provName": "</xsl:text><xsl:value-of select="provName"/><xsl:text>",</xsl:text>
        <xsl:text>"provEstablishmentYear": </xsl:text><xsl:value-of select="provEstablishmentYear"/><xsl:text>,</xsl:text>
        <xsl:text>"provRating": </xsl:text><xsl:value-of select="provRating"/><xsl:text>,</xsl:text>
        <xsl:text>"provAddress": {</xsl:text>
          <xsl:text>"addrStreet": "</xsl:text><xsl:value-of select="provAddress/addrStreet"/><xsl:text>",</xsl:text>
          <xsl:text>"addrCity": "</xsl:text><xsl:value-of select="provAddress/addrCity"/><xsl:text>",</xsl:text>
          <xsl:text>"addrState": "</xsl:text><xsl:value-of select="provAddress/addrState"/><xsl:text>",</xsl:text>
          <xsl:text>"addrPostal": "</xsl:text><xsl:value-of select="provAddress/addrPostal"/><xsl:text>",</xsl:text>
          <xsl:text>"addrCountry": "</xsl:text><xsl:value-of select="provAddress/addrCountry"/><xsl:text>"</xsl:text>
        <xsl:text>},</xsl:text>
        <xsl:text>"provContacts": {</xsl:text>
          <xsl:text>"contactPhone": "</xsl:text><xsl:value-of select="provContacts/contactPhone"/><xsl:text>",</xsl:text>
          <xsl:text>"contactEmail": "</xsl:text><xsl:value-of select="provContacts/contactEmail"/><xsl:text>",</xsl:text>
          <xsl:text>"contactWebsite": "</xsl:text><xsl:value-of select="provContacts/contactWebsite"/><xsl:text>"</xsl:text>
        <xsl:text>},</xsl:text>
        <xsl:text>"provDepartments": [</xsl:text>
          <xsl:for-each select="provDepartments/deptRecord">
            <xsl:if test="position() &gt; 1">
              <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text>{</xsl:text>
              <xsl:text>"deptID": "</xsl:text><xsl:value-of select="@deptID"/><xsl:text>",</xsl:text>
              <xsl:text>"deptName": "</xsl:text><xsl:value-of select="deptName"/><xsl:text>",</xsl:text>
              <xsl:text>"deptHead": "</xsl:text><xsl:value-of select="deptHead"/><xsl:text>",</xsl:text>
              <xsl:text>"deptPhone": "</xsl:text><xsl:value-of select="deptPhone"/><xsl:text>",</xsl:text>
              <xsl:text>"deptLocation": "</xsl:text><xsl:value-of select="deptLocation"/><xsl:text>",</xsl:text>
              <xsl:text>"deptFloor": </xsl:text><xsl:value-of select="@deptFloor"/>
            <xsl:text>}</xsl:text>
          </xsl:for-each>
        <xsl:text>],</xsl:text>
        <xsl:text>"provServices": [</xsl:text>
          <xsl:for-each select="provServices/servRecord">
            <xsl:if test="position() &gt; 1">
              <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text>{</xsl:text>
              <xsl:text>"servID": "</xsl:text><xsl:value-of select="@servID"/><xsl:text>",</xsl:text>
              <xsl:text>"servName": "</xsl:text><xsl:value-of select="servName"/><xsl:text>",</xsl:text>
              <xsl:text>"servDesc": "</xsl:text><xsl:value-of select="servDesc"/><xsl:text>",</xsl:text>
              <xsl:text>"servFee": "</xsl:text>
              <xsl:choose>
                <xsl:when test="servFee='Variable'">
                  <xsl:text>Variable</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="servFee"/>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:text>",</xsl:text>
              <xsl:text>"servDuration": "</xsl:text><xsl:value-of select="servDuration"/><xsl:text>",</xsl:text>
              <xsl:text>"servType": "</xsl:text><xsl:value-of select="servType"/><xsl:text>",</xsl:text>
              <xsl:text>"servAvailability": "</xsl:text><xsl:value-of select="servAvailability"/><xsl:text>",</xsl:text>
              <xsl:text>"serviceStatus": "</xsl:text><xsl:value-of select="@serviceStatus"/><xsl:text>"</xsl:text>
            <xsl:text>}</xsl:text>
          </xsl:for-each>
        <xsl:text>]</xsl:text>
      <xsl:text>}</xsl:text>
    </xsl:for-each>
    <xsl:text>]}</xsl:text>
  </xsl:template>
  
</xsl:stylesheet>
