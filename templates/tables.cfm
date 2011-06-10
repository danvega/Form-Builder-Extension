<cfprocessingdirective suppresswhitespace="true" pageencoding="utf-8">
<cfsetting enablecfoutputonly="true">

<!--- form properties --->
<cfparam name="attributes.formTitle" default="Form Admin">
<cfparam name="attributes.formName" default="">
<cfparam name="attributes.formAction" default="">
<cfparam name="attributes.formMethod" default="">
<cfparam name="attributes.classname" default="">
<cfparam name="attributes.enctype" default="">
<!--- look and feel --->
<cfparam name="attributes.template" default="">
<!--- columns --->
<cfparam name="attributes.columns" default="">

<cfoutput>
<h1>#attributes.formTitle#</h1>
<form name="#attributes.formName#" action="#attributes.formAction#" method="#attributes.formMethod#">

	<table width="100%" cellpadding="0" cellspacing="0">
	<cfloop list="#columns#" index="col">
	<tr>
		<td>#attributes['#col#-label']#</td>
		<cfswitch expression="#attributes['#col#-htmltype']#">
		<cfcase value="text">
		<td><input type="text" id="#col#" name="#col#" value="##form.#col###"></td>
		</cfcase>
		<cfcase value="password">
		<td><input type="password" id="#col#" name="#col#" value="">
		</cfcase>
		<cfcase value="select">
		<td>
			<select name="#col#">
				<option value="">Select #attributes['#col#-label']#</option>
			</select>
		</td>
		</cfcase>
		<cfcase value="textarea">
		<td><textarea name="#col#"></textarea></td>
		</cfcase>
		<cfcase value="checkbox">
		<td><input type="checkbox" name="#col#" checked="checked"></td>
		</cfcase>
		<cfcase value="radio">
		<td>
			<input type="radio" name="#col#" value="yes"> Yes<br/>
			<input type="radio" name="#col#" value="no"> No<br/>
		</td>
		</cfcase>
		<cfcase value="image">
		<td><input type="image" name="#col#" src=""></td>
		</cfcase>
		</cfswitch>
	</tr>
	</cfloop>
	</table>

	<p align="right">
		<input type="submit" name="submit" value="#attributes.submitvalue#">
	</p>

</form>
</cfoutput>
<cfsetting enablecfoutputonly="false">
</cfprocessingdirective>
