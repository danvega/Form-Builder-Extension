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
<form <cfif len(attributes.formName)>name="#attributes.formName#"</cfif> <cfif len(attributes.formAction)>action="#attributes.formAction#"</cfif> method="#attributes.formMethod#" <cfif len(attributes.classname)>class="#attributes.classname#"</cfif> <cfif len(attributes.enctype)>#attributes.enctype#</cfif>>

	<cfloop list="#columns#" index="col">
	<cfif structKeyExists(attributes,col)>
	<p>
		<label for="#col#">#attributes['#col#-label']#</label>
		<!--- switch case for types --->
		<cfswitch expression="#attributes['#col#-htmltype']#">
		<cfcase value="text">
		<input type="text" id="#col#" name="#col#" value="##form.#col###">
		</cfcase>
		<cfcase value="password">
		<input type="password" id="#col#" name="#col#" value="##form.#col###">
		</cfcase>
		<cfcase value="select">
		<select name="#col#">
			<option value="">Select #attributes['#col#-label']#</option>
		</select>
		</cfcase>
		<cfcase value="textarea">
		<textarea name="#col#"></textarea>
		</cfcase>
		<cfcase value="checkbox">
		<input type="checkbox" name="#col#" checked="checked">
		</cfcase>
		<cfcase value="radio">
		<input type="radio" name="#col#" value="yes"> Yes<br/>
		<input type="radio" name="#col#" value="no"> No<br/>
		</cfcase>
		<cfcase value="image">
		<input type="image" name="#col#" src="">
		</cfcase>
		</cfswitch>
	</p>
	</cfif>
	</cfloop>

	<p align="right">
		<input type="submit" name="submit" value="#attributes.submitvalue#">
	</p>

</form>
</cfoutput>
<cfsetting enablecfoutputonly="false">
</cfprocessingdirective>
