<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2013sp1

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://hl7.org/fhir" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="ns0 xs fn">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<patientDataFact>
			<xsl:attribute name="xsi:noNamespaceSchemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'JSONFact_Demographic.xsd'"/>
			<xsl:for-each select="ns0:Patient">
				<xsl:variable name="var1_details" as="node()?" select="ns0:details"/>
				<facts>
					<xsl:for-each select="($var1_details/ns0:name/ns0:text)[fn:exists(@value)]">
						<name>
							<xsl:sequence select="fn:string(@value)"/>
						</name>
					</xsl:for-each>
					<xsl:for-each select="($var1_details/ns0:birthDate)[fn:exists(@value)]">
						<xsl:variable name="var2_resultof_cast" as="xs:double" select="xs:double(xs:decimal('2'))"/>
						<xsl:variable name="var3_resultof_cast" as="xs:string" select="fn:string(@value)"/>
						<age>
							<xsl:sequence select="xs:string(xs:integer(fn:floor((fn:days-from-duration((fn:current-date() - xs:date(fn:concat(fn:concat(fn:concat(fn:concat(fn:substring($var3_resultof_cast, xs:double(xs:decimal('1')), xs:double(xs:decimal('4'))), '-'), fn:substring($var3_resultof_cast, xs:double(xs:decimal('5')), $var2_resultof_cast)), '-'), fn:substring($var3_resultof_cast, xs:double(xs:decimal('7')), $var2_resultof_cast))))) div xs:integer('365')))))"/>
						</age>
					</xsl:for-each>
					<xsl:for-each select="($var1_details/ns0:birthDate)[fn:exists(@value)]">
						<xsl:variable name="var4_resultof_cast" as="xs:double" select="xs:double(xs:decimal('2'))"/>
						<xsl:variable name="var5_resultof_cast" as="xs:string" select="fn:string(@value)"/>
						<dob>
							<xsl:sequence select="fn:concat(fn:concat(fn:concat(fn:concat(fn:substring($var5_resultof_cast, xs:double(xs:decimal('1')), xs:double(xs:decimal('4'))), '-'), fn:substring($var5_resultof_cast, xs:double(xs:decimal('5')), $var4_resultof_cast)), '-'), fn:substring($var5_resultof_cast, xs:double(xs:decimal('7')), $var4_resultof_cast))"/>
						</dob>
					</xsl:for-each>
					<xsl:for-each select="($var1_details/ns0:gender/ns0:display)[fn:exists(@value)]">
						<sex>
							<xsl:sequence select="fn:string(@value)"/>
						</sex>
					</xsl:for-each>
				</facts>
			</xsl:for-each>
		</patientDataFact>
	</xsl:template>
</xsl:stylesheet>