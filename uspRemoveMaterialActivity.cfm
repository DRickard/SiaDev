<!---
// Required variables for uspAsscMaterial
@ActID INT,
@MatID INT
--->
<cftry>
	<cfloop index="theMaterial" list="#FORM.MatID#">
		<cfstoredproc procedure="uspRemoveMaterialActivity" datasource="#APPLICATION.dsn#">
			<cfprocparam type = "In" CFSQLType = "CF_SQL_INTEGER" dbvarname="@ActID" value = "#ActID#" null="no">
			<cfprocparam type = "In" CFSQLType = "CF_SQL_INTEGER" dbvarname="@MatID" value = "#theMaterial#" null="no">
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
