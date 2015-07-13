<!---
// Required variables for uspAsscMaterial
@ActID INT,
@MatID INT
--->
<cftry>
	<cfloop index="theMaterial" list="#FORM.MatID#">
		<cfstoredproc procedure="uspRemoveMaterialLibrarian" datasource="#APPLICATION.dsn#">
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@MatID" value="#theMaterial#" null="no">
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@LibID" value="#LibID#" null="no">
		</cfstoredproc>
	</cfloop>
	<cfcatch type="Database">
		<cfset em = "#cfcatch.Message#" & "#cfcatch.Detail#">
		<cfscript>
			up2snuff = 0;
			//em = "Database deletion error. Please try again.";
		</cfscript>
	</cfcatch>
</cftry>
