<cfset FileSource = APPLICATION.FileDirectory & Material.FileDirectory & "\" & Material.FileName>
<cftry>
	<cffile action = "copy"
		source="#FileSource#"
		destination = "#SESSION.FileLocation#">
	<cfcatch type="Any">
		<cfset up2snuff = 0>
		<cfset em = "An error ocurred while attempting to copy the file. Please try again.">
	</cfcatch>
</cftry>
