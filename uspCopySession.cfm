<!---
need to create activity, session, ActivityLibrarian, SessionActivity, SessionLibrarian, SessionLibrarian, SessionPreparationTime, ActivityContact, LibrarianContact, SessionContact, LibrarianContact, ActivityDevelopmentTime,
--->
<!---
// Required variables for uspUpdateSession
SessID;
LibID;
QuarterID;
SessionDateTime;
Duration;
NumAttendees;
NumEnrolled;
GroupName;
AffiliationID;
DepartmentID;
LearnerCategoryID;
PrepTime;
PrepComment;
--->

<cfinclude template="incCleanForm.cfm">
<cfscript>
	SessionDate = FORM.SessionDate;
	Hour = FORM.Hour;
	Minute = FORM.Minute;
	Marker = FORM.Marker;
	SessionDateTime = SessionDate & " " & Hour & ":" & Minute & " " & Marker;
</cfscript>
<cftry>
	<cfstoredproc procedure="uspAddActivity" datasource="#APPLICATION.dsn#">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@LibID" value="#SESSION.LibID#" null="no">
		<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@Title" value="#FORM.Title#" null="no">
		<cfif FORM.ActivityTypeID neq 0>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@ActivityTypeID" value="#FORM.ActivityTypeID#" null="no">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@ActivityTypeID" null="yes">
		</cfif>
		<cfif FORM.Description neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@Description" value="#FORM.Description#">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@Description" null="yes">
		</cfif>
		<cfprocparam type="In" cfsqltype="CF_SQL_DATE" dbvarname="@CompletionDT" null="yes">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@DevTime" null="yes">
		<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@DevComment" null="yes">
		<cfif IsDefined("FORM.ScholCommTypes") and FORM.ScholCommTypes neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@ScholCommTypes" value="#FORM.ScholCommTypes#" null="no">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@ScholCommTypes" null="yes">
		</cfif>
		<cfif IsDefined("FORM.DeliveryModes") and FORM.DeliveryModes neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@DeliveryModes" value="#FORM.DeliveryModes#" null="no">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@DeliveryModes" null="yes">
		</cfif>
		<cfprocresult name="Activity">
	</cfstoredproc>
	<cfset NewActID = Activity.ActID>

	<cfstoredproc procedure="uspAddSession" datasource="#APPLICATION.dsn#">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@LibID" value="#SESSION.LibID#">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@ActID" value="#NewActID#">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@QuarterID" null="yes">
		<cfprocparam type="In" cfsqltype="CF_SQL_TIMESTAMP" dbvarname="@SessionDateTime" value="#SessionDateTime#" null="no">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@Duration" null="yes">
		<cfif FORM.NumAttendees neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@NumAttendees" value="#FORM.NumAttendees#" null="no">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@NumAttendees" null="yes">
		</cfif>
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@NumEnrolled" null="yes">
		<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@GroupName" null="yes">
		<cfif FORM.DepartmentID neq 0>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@DepartmentID" value="#FORM.DepartmentID#" null="no">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@DepartmentID" null="yes">
		</cfif>
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@AffiliationID" null="yes">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@LearnerCategoryID" null="yes">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@PrepTime" null="yes">
		<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@PrepComment" null="yes">
		<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@Comments" null="yes">
		<cfprocparam type="In" cfsqltype="CF_SQL_BIT" dbvarname="@ScholarlyCommunication" value="0">
		<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@other_multi_dept" value="#FORM.other_multi_dept#">
		<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@CourseSection" value="#FORM.CourseSection#">
		<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@CourseNumber" value="#FORM.CourseNumber#">
		<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@Learned" value="#FORM.Learned#">
		<cfprocresult name="Sess">
	</cfstoredproc>
	<cfset NewSessID = Sess.SessionID>

	<cfstoredproc procedure="uspSetSessionDetails" datasource="#APPLICATION.dsn#">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@SessID" value="#NewSessID#">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@ActID" value="#NewActID#">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@LibID" value="#SESSION.LibID#">
		<cfif FORM.QuarterID neq 0>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@QuarterID" value="#FORM.QuarterID#" null="no">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@QuarterID" null="yes">
		</cfif>
		<cfprocparam type="In" cfsqltype="CF_SQL_TIMESTAMP" dbvarname="@SessionDateTime" value="#SessionDateTime#" null="no">
		<cfif FORM.Duration neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@Duration" value="#FORM.Duration#" null="no">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@Duration" null="yes">
		</cfif>
		<cfif FORM.SessionCount neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@SessionCount" value="#FORM.SessionCount#" null="no">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@SessionCount" null="yes">
		</cfif>
		<cfif FORM.PrepTime neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@PrepTime" value="#FORM.PrepTime#" null="no">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@PrepTime" null="yes">
		</cfif>
		<cfif FORM.PrepComment neq "">
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@PrepComment" value="#FORM.PrepComment#" null="no">
		<cfelse>
			<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" dbvarname="@PrepComment" null="yes">
		</cfif>
	</cfstoredproc>

	<cfif IsDefined("FORM.DeveloperIDs")>
		<cfloop index="theLibrarian" list="#FORM.DeveloperIDs#">
			<cfstoredproc procedure="uspGetLibrarianUnit" datasource="#APPLICATION.dsn#">
				<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@LibID" value="#theLibrarian#" null="no">
				<cfprocresult name="GetUnit">
			</cfstoredproc>
			<cfset UnitID="#GetUnit.UnitID#">
			<cfstoredproc procedure="uspAddActivityLibrarian" datasource="#APPLICATION.dsn#">
				<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@ActID" value="#NewActID#" null="no">
				<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@LibID" value="#theLibrarian#" null="no">
				<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@UnitID" value="#UnitID#" null="no">
			</cfstoredproc>
		</cfloop>
	</cfif>

	<cfif IsDefined("FORM.PresenterIDs")>
		<cfloop index="theLibrarian" list="#FORM.PresenterIDs#">
			<cfstoredproc procedure="uspGetLibrarianUnit" datasource="#APPLICATION.dsn#">
				<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@LibID" value="#theLibrarian#" null="no">
				<cfprocresult name="GetUnit">
			</cfstoredproc>
			<cfset UnitID="#GetUnit.UnitID#">
			<cfstoredproc procedure="uspAddSessionLibrarian" datasource="#APPLICATION.dsn#">
				<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@SessID" value="#NewSessID#" null="no">
				<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@LibID" value="#theLibrarian#" null="no" >
				<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@UnitID" value="#UnitID#" null="no">
			</cfstoredproc>
		</cfloop>
	</cfif>

	<cfif IsDefined("FORM.SessionDepartmentID")>
		<cfloop index="theDepartment" list="#FORM.SessionDepartmentID#">
			<cfstoredproc procedure="uspAddSessionDepartment" datasource="#APPLICATION.dsn#">
				<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@SessID" value="#NewSessID#" null="no">
				<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@DeptID" value="#theDepartment#" null="no" >
			</cfstoredproc>
		</cfloop>
	</cfif>

	<cfif IsDefined("FORM.InitiativeTypes")>
		<cfloop index="theInitiative" list="#FORM.InitiativeTypes#">
			<cfstoredproc procedure="uspAddSessionInitiative" datasource="#APPLICATION.dsn#">
				<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@SessID" value="#NewSessID#" null="no">
				<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@InitID" value="#theInitiative#" null="no" >
			</cfstoredproc>
		</cfloop>
	</cfif>

	<cfif IsDefined("FORM.LearnerCategoryID")>
		<cfloop index="theCategory" list="#FORM.LearnerCategoryID#">
			<cfstoredproc procedure="uspAddSessionLearner" datasource="#APPLICATION.dsn#">
				<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@SessID" value="#NewSessID#" null="no">
				<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@LearnID" value="#theCategory#" null="no">
			</cfstoredproc>
		</cfloop>
	</cfif>

	<cfstoredproc procedure="uspCopyExtras" datasource="#APPLICATION.dsn#">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@OldAct" value="#FORM.OldActID#">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@OldSess" value="#FORM.OldSessID#">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@NewAct" value="#NewActID#">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@NewSess" value="#NewSessID#">
		<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@LibID" value="#SESSION.LibID#">
	</cfstoredproc>

	<cfcatch type="Database">
		<cfset em = "#cfcatch.Message#" & "#cfcatch.Detail#" & "#cfcatch.NativeErrorCode#" & "#cfcatch.Sql#">
		<cfscript>
			up2snuff = 0;
			//em = "Database update error. Please try again.";
		</cfscript>
	</cfcatch>
</cftry>