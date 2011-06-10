<cfif structKeyExists(form,"submit.x")>

	<!--- build the form --->
	<cfsavecontent variable="formcontent">
		<cfmodule template="..\templates\#form.template#" attributecollection="#form#">
	</cfsavecontent>

	<cfset formcontent = REReplace(formcontent, "[\s]+[#Chr(13)##Chr(10)#]+", "#Chr(10)#", "ALL")>

	<!--- save the form --->
	<cffile action="write" file="#form.location#\#form.filename#" output="#formcontent#">

	<!--- save and show user a response --->
	<cfset application.generatedForm = formcontent>
	<cflocation url="complete.cfm" addtoken="false">

</cfif>

<html>
<head>
	<title>Build Form From Table</title>
	<link href="../assets/css/formbuilder.css" type="text/css" rel="stylesheet">
</head>
<body>

	<cfif arrayLen(application.eventInfo.tables) GT 1>
		<p>The form builder only supports generating 1 table at a time.</p>
	<cfelse>

		<!--- extract what we need so we don't have to keep working with the application scope --->
		<cfset table = application.eventInfo.tables[1].name>
		<cfset columns = application.eventInfo.tables[1].columns>
		<cfset filename = application.eventInfo.user.filename>
		<cfset location = application.eventInfo.user.location>

		<form id="frmBuilder" name="frmBuilder" method="post">
		<input type="hidden" name="filename" value="<cfoutput>#filename#</cfoutput>">
		<input type="hidden" name="location" value="<cfoutput>#location#</cfoutput>">
		<cflayout type="tab">

			<cflayoutarea title="Form Info" style="padding:10px;">
				<p>
					<label for="formTitle">Form Title:</label>
					<input type="text" name="formTitle">
				</p>
				<p>
					<label for="formName">Form Name:</label>
					<input type="text" name="formName">
				</p>
				<p>
					<label for="formAction">Form Action:</label>
					<input type="text" name="formAction">
				</p>
				<p>
					<label for="formMethod">Form Method:</label>
					<select name="formMethod">
						<option value="POST">POST</option>
						<option value="GET">GET</option>
					</select>
				</p>
				<p>
					<label for="classname">Class Name:</label>
					<input type="text" name="classname">
				</p>
				<p>
					<label for="enctype">Enctype:</label>
					<select name="enctype">
						<option value=""></option>
						<option value="multipart/form-data">multipart/form-data</option>
						<option value="application/x-www-form-urlencoded">application/x-www-form-urlencoded</option>
						<option value="text/plain">text/plain</option>
					</select>
				</p>
				<p>
					<label for="submitValue">Submit Value:</label>
					<input type="text" name="submitValue" value="Save">
				</p>
			</cflayoutarea>

			<cflayoutarea title="Look & Feel" style="padding:10px;">
				<p>
					<label for="template">Template:</label>
					<select name="template">
						<cfdirectory action="list" directory="#expandPath('../templates')#" name="templates" filter="*.cfm">
						<cfoutput query="templates">
						<option value="#name#">#name#</option>
						</cfoutput>
					</select>
				</p>
				<!---
				<p>
					<label for="template">StyleSheet:</label>
					<select name="stylesheet">
						<cfdirectory action="list" directory="#expandPath('../templates/css')#" name="stylesheets">
						<option value=""></option>
						<cfoutput query="stylesheets">
						<option value="#name#">#name#</option>
						</cfoutput>
					</select>
				</p>
				--->
			</cflayoutarea>

			<cflayoutarea title="Column Info" style="padding:10px;">
				<table width="95%" cellpadding="0" cellspacing="0">
				<thead>
					<tr>
						<th>&nbsp;</th>
						<th>Column</th>
						<th>Type</th>
						<th>HTML</th>
						<th>Label</th>
					</tr>
				</thead>
				<tbody>
					<cfoutput>
					<cfloop array="#columns#" index="column">
					<input type="hidden" name="columns" value="#column.name#">
					<tr>
						<td><input type="checkbox" name="#column.name#" checked="checked"></td>
						<td>#column.name#</td>
						<td>#column.type#</td>
						<td>
							<select name="#column.name#-htmltype">
								<option value="text" <cfif findNoCase("varchar",column.type)>selected</cfif>>Text</option>
								<option value="textarea" <cfif findNoCase("text",column.type)>selected</cfif>>Text Area</option>
								<option value="password" <cfif findNoCase("password",column.name)>selected</cfif>>Password</option>
								<option value="select">Select</option>
								<option value="checkbox">Checkbox</option>
								<option value="radio">Radio</option>
								<option value="file">File</option>
								<option value="image">Image</option>
							</select>
						</td>
						<td><input type="text" name="#column.name#-label" value="#column.name#"></td>
					</tr>
					</cfloop>
					</cfoutput>
				</tbody>
				</table>
			</cflayoutarea>

			<cflayoutarea title="Generate Form" align="center" style="padding:20px;">
				<!---<input type="submit" name="submit" value="Generate Form"/>--->
				<input type="image" name="submit" src="../assets/images/generateform.jpg" onclick="document.forms[0].submit();">
			</cflayoutarea>

		</cflayout>

		</form>

	</cfif>


</body>
</html>