<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svg="http://www.w3.org/2000/svg">

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:if test="name()='text'">
        <xsl:if test="count(./@x)=0">
          <xsl:attribute name="x">
            <xsl:value-of select="number(.//*[@class='TextPosition']/@x)" />
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="count(./@y)=0">
          <xsl:attribute name="y">
            <xsl:value-of select="number(.//*[@class='TextPosition']/@y)" />
          </xsl:attribute>
        </xsl:if>
      </xsl:if>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="svg:tspan[@class='TextPosition']">
    <xsl:copy>
      <xsl:apply-templates select="../@*|node()" />
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="svg:text/@x">
    <xsl:choose>
      <xsl:when test="count(..//*[@class='TextPosition']) > 0">
        <xsl:attribute name="{name()}">
          <xsl:value-of select="number(.) + number(..//*[@class='TextPosition']/@x)" />
        </xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="{name()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="svg:text/@y">
    <xsl:choose>
      <xsl:when test="count(..//*[@class='TextPosition']) > 0">
        <xsl:attribute name="{name()}">
          <xsl:value-of select="number(.) + number(..//*[@class='TextPosition']/@y)" />
        </xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="{name()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>

