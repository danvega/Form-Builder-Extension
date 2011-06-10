<h1>Generated form has been saved!</h1>
<cfset coldfish = createObject("component","org.delmore.coldfish").init()/>
<cfset coldfish.setStyle("cfcomment","color:gray;background-color:white")/>
<div class="code"><cfoutput>#coldfish.formatString(application.generatedForm)#</cfoutput></div>
