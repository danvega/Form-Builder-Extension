<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->

<cfcomponent name="Util" output="false" >
	
	<cfset this.javaString = createObject("java", "java.lang.String")>
	 

	<cffunction name="getArrayCount" returntype="numeric" output="false">
		<cfargument name="arrayVar" type="Any" >

		<cfif isArray(arguments.arrayVar)>
			<cfreturn ArrayLen(arguments.arrayVar)>
		<cfelse>
			<cfreturn 0>
		</cfif>
    </cffunction>

	<cffunction name="generateURL" output="false">
		<cfargument name="templateName" required="true" type="string" >
		
		<cfreturn getURLBasePath() & "/" & templateName>
	</cffunction>
	
	<cffunction name="getURLBasePath" output="false" >
		<cfset scriptPath = CGI.script_name>
		<cfset javaStrObj = createJavaString(scriptPath)>
		<cfset index = javaStrObj.lastIndexOf("/")>
		<cfset scriptPath = javaStrObj.subString(0,index)>
		
		<cfreturn "http://"&#CGI.SERVER_NAME# &":" &#CGI.SERVER_PORT# & scriptPath>
    </cffunction>
	
	<cffunction name="createJavaString" returntype="any" output="false" >
		<cfargument name="arg" required="true" >
		<cfreturn this.javaString.init(arg)>		
	</cffunction>
	
</cfcomponent>
