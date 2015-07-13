<!---
// Required variables for uspAddNewMaterial
@LibID INT,
@Title VARCHAR(500) = NULL,
@IsFile BIT = 0,
@URL VARCHAR(500) = NULL,
@MaterialTypeID INT= NULL,
@Description TEXT = NULL,
@FileDirectory VARCHAR(255) = NULL,
@FileName VARCHAR(255) = NULL,
@FileSize INT = NULL,
@FileExtension VARCHAR(50) = NULL,
@FileContentType VARCHAR(50) = NULL,
@FileContentSubtype VARCHAR(50) = NULL,
@QuarterID INT = NULL,
@CompletionDT SMALLDATETIME = NULL,
@FileCreatedDT SMALLDATETIME = NULL,
@FileUpdatedDT SMALLDATETIME = NULL,
@DevTime INT = NULL,
@DevComment VARCHAR(255) = NULL,
@ActID INT = NULL
--->
<cftry>
	<cfstoredproc procedure="uspAddMaterial" datasource="#APPLICATION.dsn#">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@LibID" value="#SESSION.LibID#">
		<cfif Material.MaterialTitle neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@Title" value="#Material.MaterialTitle#">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@Title" null="yes">
		</cfif>
		<cfprocparam type="In" cfsqltype="CF_SQL_BIT" dbvarname="@IsFile" value="#Material.IsFile#">
		<cfif isDefined("Material.URL") and Material.URL neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@URL" value="#Material.URL#">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@URL" null="yes">
		</cfif>
		<cfif Material.MaterialTypeID neq 0>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@MaterialTypeID" value="#Material.MaterialTypeID#" null="no">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@MaterialTypeID" null="yes">
		</cfif>
		<cfif Material.Description neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@Description" value="#Material.Description#">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@Description" null="yes">
		</cfif>
		<cfif Material.FileDirectory neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@FileDirectory" value="#SESSION.UserName#">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@FileDirectory" null="yes">
		</cfif>
		<cfif Material.FileName neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@FileName" value="#Material.FileName#">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@FileName" null="yes">
		</cfif>
		<cfif Material.FileSize neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@FileSize" value="#Material.FileSize#">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@FileSize" null="yes">
		</cfif>
		<cfif Material.FileExtension neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@FileExtension" value="#Material.FileExtension#">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@FileExtension" null="yes">
		</cfif>
		<cfif Material.FileContentType neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@FileContentType" value="#Material.FileContentType#">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@FileContentType" null="yes">
		</cfif>
		<cfif Material.FileContentSubtype neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@FileContentSubtype" value="#Material.FileContentSubtype#">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@FileContentSubtype" null="yes">
		</cfif>
		<cfif Material.QuarterID neq 0>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@QuarterID" value="#Material.QuarterID#">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@QuarterID" null="yes">
		</cfif>
		<cfif Material.CompletionDT neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_TIMESTAMP" dbvarname="@CompletionDT" value="#Material.CompletionDT#">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_TIMESTAMP" dbvarname="@CompletionDT" null="yes">
		</cfif>
		<cfif Material.FileCreatedDT neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_TIMESTAMP" dbvarname="@FileCreatedDT" value="#Material.FileCreatedDT#">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_TIMESTAMP" dbvarname="@FileCreatedDT" null="yes">
		</cfif>
		<cfif Material.FileUpdatedDT neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_TIMESTAMP" dbvarname="@FileUpdatedDT" value="#Material.FileUpdatedDT#">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_TIMESTAMP" dbvarname="@FileUpdatedDT" null="yes">
		</cfif>
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@DevTime" null="yes">
		<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@DevComment" null="yes">
		<cfif ActID neq 0>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@ActID" value="#ActID#" null="no">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@ActID" null="yes">
		</cfif>
	</cfstoredproc>
	<cfcatch type="Database">
		<cfset em = "#cfcatch.Message#" & "#cfcatch.Detail#">
		<cfscript>
			up2snuff = 0;
			//em = "Database insert error. Please try again.";
		</cfscript>
	</cfcatch>
</cftry>