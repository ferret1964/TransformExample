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
	<xsl:param name="PatientStatus" as="xs:string?" select="()"/>
	<xsl:param name="PrimaryDoctor" as="xs:string?" select="()"/>
	<xsl:template match="/">
		<patientDataFact>
			<xsl:attribute name="xsi:noNamespaceSchemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'C:/Users/JERRYG~1/Dropbox/Cognitive/CDS/JSONFact_Demographic.xsd'"/>
			<xsl:for-each select="ns0:Patient">
				<xsl:variable name="var1_details" as="node()?" select="ns0:details"/>
				<facts>
					<xsl:for-each select="(ns0:identifier/ns0:id)[fn:exists(@value)]">
						<patientId>
							<xsl:sequence select="xs:string(xs:integer(fn:string(@value)))"/>
						</patientId>
					</xsl:for-each>
					<xsl:for-each select="($var1_details/ns0:name/ns0:text)[fn:exists(@value)]">
						<contactId>
							<xsl:sequence select="fn:string(@value)"/>
						</contactId>
					</xsl:for-each>
					<xsl:for-each select="($var1_details/ns0:name/ns0:text)[fn:exists(@value)]">
						<name>
							<xsl:sequence select="fn:string(@value)"/>
						</name>
					</xsl:for-each>
					<xsl:for-each select="($var1_details/ns0:name/ns0:family)[fn:exists(@value)]">
						<lastName>
							<xsl:sequence select="fn:string(@value)"/>
						</lastName>
					</xsl:for-each>
					<xsl:for-each select="($var1_details/ns0:name/ns0:given)[fn:exists(@value)]">
						<firstName>
							<xsl:sequence select="fn:string(@value)"/>
						</firstName>
					</xsl:for-each>
					<middleName></middleName>
					<xsl:for-each select="($var1_details/ns0:birthDate)[fn:exists(@value)]">
						<age>
							<xsl:sequence select="xs:string(xs:integer(fn:floor((fn:days-from-duration((fn:current-date() - xs:date(fn:string(@value)))) div xs:integer('365')))))"/>
						</age>
					</xsl:for-each>
					<xsl:for-each select="($var1_details/ns0:gender/ns0:display)[fn:exists(@value)]">
						<gender>
							<xsl:sequence select="fn:string(@value)"/>
						</gender>
					</xsl:for-each>
					<xsl:for-each select="($var1_details/ns0:address/ns0:line)[fn:exists(@value)]">
						<address>
							<xsl:sequence select="fn:string(@value)"/>
						</address>
					</xsl:for-each>
					<xsl:for-each select="($var1_details/ns0:address/ns0:city)[fn:exists(@value)]">
						<city>
							<xsl:sequence select="fn:string(@value)"/>
						</city>
					</xsl:for-each>
					<xsl:for-each select="($var1_details/ns0:address/ns0:state)[fn:exists(@value)]">
						<state>
							<xsl:sequence select="fn:string(@value)"/>
						</state>
					</xsl:for-each>
					<xsl:for-each select="($var1_details/ns0:birthDate)[fn:exists(@value)]">
						<dateOfBirth>
							<xsl:sequence select="xs:string(xs:date(fn:string(@value)))"/>
						</dateOfBirth>
					</xsl:for-each>
					<xsl:for-each select="$var1_details/ns0:identifier">
						<xsl:variable name="var8_cur" as="node()" select="."/>
						<xsl:variable name="var5_resultof_filter" as="node()?">
							<xsl:for-each select="ns0:id[fn:exists(@value)]">
								<xsl:variable name="var3_resultof_map" as="xs:boolean?">
									<xsl:for-each select="$var8_cur/ns0:system">
										<xsl:variable name="var2_value" as="node()?" select="@value"/>
										<xsl:sequence select="(fn:exists($var2_value) and ('ssn' = xs:string(xs:anyURI(fn:string($var2_value)))))"/>
									</xsl:for-each>
								</xsl:variable>
								<xsl:variable name="var4_resultof_any" as="xs:boolean" select="fn:exists($var3_resultof_map[.])"/>
								<xsl:if test="$var4_resultof_any">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>
						<xsl:for-each select="$var5_resultof_filter">
							<xsl:variable name="var6_resultof_cast" as="xs:double" select="xs:double(xs:decimal('4'))"/>
							<xsl:variable name="var7_resultof_cast" as="xs:string" select="fn:string(@value)"/>
							<ssn>
								<xsl:sequence select="fn:concat(fn:concat(fn:concat(fn:concat(fn:substring($var7_resultof_cast, xs:double(xs:decimal('1')), xs:double(xs:decimal('3'))), '-'), fn:substring($var7_resultof_cast, $var6_resultof_cast, xs:double(xs:decimal('2')))), '-'), fn:substring($var7_resultof_cast, xs:double(xs:decimal('6')), $var6_resultof_cast))"/>
							</ssn>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="$var1_details/ns0:identifier">
						<xsl:variable name="var13_cur" as="node()" select="."/>
						<xsl:variable name="var12_resultof_filter" as="node()?">
							<xsl:for-each select="ns0:id[fn:exists(@value)]">
								<xsl:variable name="var10_resultof_map" as="xs:boolean?">
									<xsl:for-each select="$var13_cur/ns0:system">
										<xsl:variable name="var9_value" as="node()?" select="@value"/>
										<xsl:sequence select="(fn:exists($var9_value) and ('national.dfn' = xs:string(xs:anyURI(fn:string($var9_value)))))"/>
									</xsl:for-each>
								</xsl:variable>
								<xsl:variable name="var11_resultof_any" as="xs:boolean" select="fn:exists($var10_resultof_map[.])"/>
								<xsl:if test="$var11_resultof_any">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>
						<xsl:for-each select="$var12_resultof_filter">
							<medicalRecordNo>
								<xsl:sequence select="fn:string(@value)"/>
							</medicalRecordNo>
						</xsl:for-each>
					</xsl:for-each>
					<primaryDoctor>
						<xsl:choose>
							<xsl:when test="fn:exists($PrimaryDoctor)">
								<xsl:sequence select="$PrimaryDoctor"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:sequence select="'Unknown'"/>
							</xsl:otherwise>
						</xsl:choose>
					</primaryDoctor>
					<patientStatus>
						<xsl:choose>
							<xsl:when test="fn:exists($PatientStatus)">
								<xsl:sequence select="$PatientStatus"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:sequence select="'Unknown'"/>
							</xsl:otherwise>
						</xsl:choose>
					</patientStatus>
					<xsl:for-each select="(ns0:contact/ns0:details/ns0:name/ns0:text)[fn:exists(@value)]">
						<emergencyContact>
							<xsl:sequence select="fn:string(@value)"/>
						</emergencyContact>
					</xsl:for-each>
				</facts>
			</xsl:for-each>
		</patientDataFact>
	</xsl:template>
</xsl:stylesheet>
