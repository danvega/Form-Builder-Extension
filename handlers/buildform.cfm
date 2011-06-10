<cfsetting showdebugoutput="false"/>
<cfparam name="IDEEventInfo">

<cfset EventInfoParser = new org.vega.builder.EventInfoParser(IDEEventInfo)>
<cfset AdobeUtil = new com.adobe.Util()>
<cfset Application.EventInfo = EventInfoParser.parse()>

<cfswitch expression="#Application.EventInfo.eventType#">
	<cfcase value="rds">
		<cfset next = "fromtable.cfm"/>
	</cfcase>
	<cfcase value="project">
		<cfset next = "frommodel.cfm"/>
	</cfcase>
</cfswitch>

<cfheader name="Content-Type" value="text/xml">
<cfoutput>
	<response showresponse="true">
		<ide url="#adobeUtil.generateURL('#next#')#">
			<dialog width="625" height="450"/>
		</ide>
	</response>
</cfoutput>
