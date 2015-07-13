<!---
// Required variables for uspGetMaterial
@ActID INT = NULL,
@UserID INT = NULL,
@MatTypeID INT = NULL,
@UnitID INT = NULL,
@OwnerID INT = NULL
--->
<cftry>
	<cfstoredproc procedure="uspGetUnlinkedMaterials" datasource="#APPLICATION.dsn#">
		<cfif ActID neq 0>
			<cfprocparam type = "In" CFSQLType = "CF_SQL_INTEGER" dbvarname="@ActID" value = "#ActID#" null="no">
		<cfelse>
			<cfprocparam type = "In" CFSQLType = "CF_SQL_INTEGER" dbvarname="@ActID" null="yes">
		</cfif>
		<cfif UserID neq 0>
			<cfprocparam type = "In" CFSQLType = "CF_SQL_INTEGER" dbvarname="@UserID" value = "#UserID#" null="no">
		<cfelse>
			<cfprocparam type = "In" CFSQLType = "CF_SQL_INTEGER" dbvarname="@UserID" null="yes">
		</cfif>
		<cfif MatTypeID neq 0>
			<cfprocparam type = "In" CFSQLType = "CF_SQL_INTEGER" dbvarname="@MatTypeID" value = "#MatTypeID#" null="no">
		<cfelse>
			<cfprocparam type = "In" CFSQLType = "CF_SQL_INTEGER" dbvarname="@MatTypeID" null="yes">
		</cfif>
		<cfif UnitID neq 0>
			<cfprocparam type = "In" CFSQLType = "CF_SQL_INTEGER" dbvarname="@UnitID" value = "#UnitID#" null="no">
		<cfelse>
			<cfprocparam type = "In" CFSQLType = "CF_SQL_INTEGER" dbvarname="@UnitID" null="yes">
		</cfif>
		<cfif OwnerID neq 0>
			<cfprocparam type = "In" CFSQLType = "CF_SQL_INTEGER" dbvarname="@OwnerID" value = "#OwnerID#" null="no">
		<cfelse>
			<cfprocparam type = "In" CFSQLType = "CF_SQL_INTEGER" dbvarname="@OwnerID" null="yes">
		</cfif>
		<cfprocresult name="Material">
	</cfstoredproc>
	<cfcatch type="Database">
		<cfset up2snuff = 0>
		<cfset em = "#cfcatch.Message#" & "#cfcatch.Detail#">
		<!---cfset em = "Database query error"--->
	</cfcatch>
</cftry>
<cfif up2snuff and Material.RecordCount neq 0>
	<cfscript>
		if (not isDefined("URL.fld")) {fld = "t";}
		else {fld = URL.fld;}
		if (not isDefined("URL.ord")) {ord = "a";}
		else {ord = URL.ord;}
	</cfscript>
	<cfquery name="Material" dbtype="query">
	SELECT *
	FROM Material
	ORDER BY
		<cfoutput>
			<cfswitch expression="#fld#">
				<cfcase value="mt">MaterialTitle #IIf(ord eq "a", DE("DESC"), DE("ASC"))#</cfcase>
				<cfcase value="my">MaterialType #IIf(ord eq "a", DE("DESC"), DE("ASC"))#</cfcase>
				<cfcase value="ml">LibrarianLastName #IIf(ord eq "a", DE("DESC"), DE("ASC"))#</cfcase>
				<cfcase value="mu">Unit #IIf(ord eq "a", DE("DESC"), DE("ASC"))#</cfcase>
				<cfcase value="mq">Quarter #IIf(ord eq "a", DE("DESC"), DE("ASC"))#, CompletionDT DESC</cfcase>
				<cfcase value="mc">CompletionDT #IIf(ord eq "a", DE("DESC"), DE("ASC"))#</cfcase>
				<cfcase value="mp">FileUpdatedDT #IIf(ord eq "a", DE("DESC"), DE("ASC"))#</cfcase>
				<cfdefaultcase>MaterialTitle DESC</cfdefaultcase>
			</cfswitch>
		</cfoutput>
	</cfquery>
	<cfset UniqueRec = 0>
	<cfoutput query="Material" group="MaterialID">
		<cfset UniqueRec = UniqueRec + 1>
	</cfoutput>
	<cfscript>
		MatEditorID = ValueList(Material.LibrarianID, ",");
		MatEditorID = ListAppend(MatEditorID, ValueList(Material.LibrarianID, ","), ",");
	</cfscript>
	<cfscript>
		ord = IIf(ord eq "d", DE("a"), DE("d"));
	</cfscript>
	<cfif Find("materials.cfm", SCRIPT_NAME)>
<!--- lookup query for material types --->
		<cfif MatTypID neq 0>
			<cfscript>
				Lookup = "MaterialType";
				Header = "-select-";
			</cfscript>
			<cfinclude template="uspGetLookup.cfm">
			<cfif up2snuff and MaterialType.RecordCount neq 0>
				<cfquery name="MaterialType" dbtype="query">
					SELECT * FROM MaterialType WHERE MaterialType.MaterialTypeID = <cfoutput>#MatTypID#</cfoutput>
				</cfquery>
			</cfif>
		</cfif>
<!--- lookup query for units --->
		<cfif UID neq 0>
			<cfscript>
				Lookup = "Unit";
				Header = "-select-";
			</cfscript>
			<cfinclude template="uspGetLookup.cfm">
			<cfif up2snuff and Unit.RecordCount neq 0>
				<cfquery name="Unit" dbtype="query">
					SELECT * FROM Unit WHERE Unit.UnitID = <cfoutput>#UID#</cfoutput>
				</cfquery>
			</cfif>
		</cfif>
<!--- lookup query for quarters --->
		<cfif Yr neq "" and QuartID neq 0>
			<cfscript>
				Lookup = "Quarter";
				Header = "-select-";
			</cfscript>
			<cfinclude template="uspGetLookup.cfm">
			<cfif up2snuff and Quarter.RecordCount neq 0>
				<cfquery name="Quarter" dbtype="query">
					SELECT * FROM Quarter WHERE Quarter.QuarterID = <cfoutput>#QuartID#</cfoutput>
				</cfquery>
			</cfif>
		</cfif>
<!--- lookup query for librarians --->
		<cfif LibID neq 0>
			<cfscript>
				LibID = LibID;
				UID = 0;
				DeptID = 0;
				CntctID = 0;
				ActID = 0;
				SessID = 0;
				MatID = 0;
				Set = '';
				DevPres = 0;
			</cfscript>
			<cfinclude template="uspGetLibrarian.cfm">
		</cfif>
	</cfif>
</cfif>