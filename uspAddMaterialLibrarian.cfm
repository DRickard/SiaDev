<!---
// Required variables for uspAsscMaterial
@MatID INT = NULL,
@LibID INT = NULL
--->
<cftry>
	<cfloop index="theMaterial" list="#FORM.MatID#">
		<cfstoredproc procedure="uspAddMaterialLibrarian" datasource="#APPLICATION.dsn#">
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@MatID" value="#theMaterial#" null="no">
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@LibID" value="#UserID#" null="no">
		</cfstoredproc>
	</cfloop>
	<cfcatch type="Database">
		<cfset em = "#cfcatch.Message#" & "#cfcatch.Detail#">
		<cfscript>
			up2snuff = 0;
			//em = "Database query error";
			//em = "Database insert error. Please try again.";
		</cfscript>
	</cfcatch>
</cftry>
