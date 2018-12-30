<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:wd="urn:com.workday/bsvc"
    exclude-result-prefixes="xs"
    version="2.0">    
    <xsl:param name="Commenter_ID"/>
    <xsl:param name = "Employee_ID"/>
    <xsl:param name = "Continuous_Service_Date"/>
    <xsl:param name = "Time_Off_Service_Date"/>
    
    <xsl:template match="/">
        
        <env:Envelope xmlns:env="http://schemas.xmlsoap.org/soap/envelope/"
            xmlns:xsd="http://www.w3.org/2001/XMLSchema">
            <env:Body>
                <wd:Edit_Service_Dates_Request xmlns:wd="urn:com.workday/bsvc" wd:version="v23.2">
                    <wd:Business_Process_Parameters>
                        <wd:Auto_Complete>true</wd:Auto_Complete>
                        <wd:Run_Now>true</wd:Run_Now>
                      <!--  <wd:Comment_Data>
                            <!-\-This is an optional Field. But advised to have a String here so that in the future it will be easy to differentiate how the dates were loaded.-\->
                            <wd:Comment>
                                <xsl:text>This is an optional Field. But advised to have a String here so that in the future it will be easy to differentiate how the dates were loaded</xsl:text>
                            </wd:Comment>
                            <wd:Worker_Reference>
                                <!-\-Input HR Partner or other User who can edit Service date Employee ID here. This will be the Workday Employee ID-\->
                                <wd:ID wd:type="Employee_ID">
                                    <xsl:value-of select="$Commenter_ID"/>
                                </wd:ID>
                            </wd:Worker_Reference>
                        </wd:Comment_Data>  -->
                    </wd:Business_Process_Parameters>
                    <wd:Edit_Service_Dates_Data>
                        <wd:Worker_Reference>
                            <!--Input the Employee ID of the Worker you wish to update the Service date for. This will be the Workday Employee ID-->
                            <wd:ID wd:type="Employee_ID">
                                <xsl:value-of select="$Employee_ID"/>
                            </wd:ID>
                        </wd:Worker_Reference>
                        <wd:Edit_Service_Dates_Event_Data>
                            <wd:Continuous_Service_Date>
                                <xsl:value-of select="$Continuous_Service_Date"/>
                            </wd:Continuous_Service_Date>
                            <xsl:if test="exists($Time_Off_Service_Date)">
                                <wd:Time_Off_Service_Date><xsl:value-of select="$Time_Off_Service_Date"/></wd:Time_Off_Service_Date>
                            </xsl:if>
                        </wd:Edit_Service_Dates_Event_Data>
                        
                    </wd:Edit_Service_Dates_Data>
                </wd:Edit_Service_Dates_Request>
            </env:Body>
        </env:Envelope>
        
    </xsl:template>
</xsl:stylesheet>