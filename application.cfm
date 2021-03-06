<cfapplication name="SIA"
			   clientmanagement="no"
		       sessionmanagement="yes"
			   setclientcookies="yes"
			   setdomaincookies="no"
			   sessiontimeout="#CreateTimeSpan(0, 0, 120, 0)#">
<!---<cfset APPLICATION.dsn = "SIA">--->
<cfset APPLICATION.dsn = "SIA_Test">
<!---<cfset APPLICATION.HostServer = "http://sia.library.ucla.edu">--->
<cfset APPLICATION.HostServer = "http://siadev.library.ucla.edu">
<!---cfset APPLICATION.FileDirectory = "f:\Inetpub\wwwroot\mainlib\sia\files\"--->
<cfset APPLICATION.FileDirectory = "f:\Inetpub\Development\sia\files\">
<cfset APPLICATION.Path = "/">
<!---cfset APPLICATION.FilePath = "/mainlib/sia/files/"--->
<cfset APPLICATION.FilePath = "/files/">
<cfset APPLICATION.legalDomains = "library.ucla.edu,law.ucla.edu,ucla.edu,english.ucla.edu">
<cfset APPLICATION.nullCaption = "Unspecified">
<cfset APPLICATION.dateFormat = "mm/dd/yy"> <!---"yyyy-mm-dd"--->
<cfset APPLICATION.timeFormat = "HH:mm">
<cfset APPLICATION.maxLdap = "250">
<cfparam name="SESSION.isAuthentic" default="0" type="boolean">
<cfparam name="SESSION.LibID" default="0">
<cfparam name="SESSION.UserName" default="">
<cfparam name="SESSION.UserLevelID" default="1">
<cfparam name="SESSION.UID" default="0">
<cfparam name="SESSION.ActID" default="0">
<cflock timeout="#CreateTimeSpan(0, 0, 120, 0)#" throwontimeout="no" type="exclusive" scope="session">
	<cfset SESSION.FileLocation = APPLICATION.FileDirectory & SESSION.UserName & "\">
</cflock>
<cfparam name="HTTP_REFERER" default="">
<cfset fiscalYear="">
<cfmodule template="modFiscalYear.cfm" sDate = #Now()#>
<cfscript>
	//ActURL = "";
	SessURL = "";
	CntctURL = "";
	ClassURL = "";
	ReportURL = "selReport.cfm"; //"reports.cfm";
	if (SESSION.UserLevelID eq 1)
	{
		SessURL = "sessions.cfm?LibID=" & SESSION.LibID & "&ShowAll=1";
		//ActURL = "activities.cfm?LibID=" & SESSION.LibID;
		MatURL = "materials.cfm?LibID=" & SESSION.LibID;
		CntctURL = "contacts.cfm?LibID=" & SESSION.LibID;
		ClassURL = "classrooms.cfm";
	}
	else if (SESSION.UserLevelID eq 2)
	{
		SessURL = "sessions.cfm?UID=" & SESSION.UID;
		//ActURL = "activities.cfm?UID=" & SESSION.UID;
		MatURL = "materials.cfm?UID=" & SESSION.UID;
		CntctURL = "contacts.cfm?UID=" & SESSION.UID;
		ClassURL = "classrooms.cfm";
	}
	else if (SESSION.UserLevelID eq 3)
	{
		SessURL = "sessions.cfm?FiscalY=" & fiscalYear;
		//ActURL = "activities.cfm?FiscalY=" & fiscalYear;
		MatURL = "materials.cfm?FiscalY=" & fiscalYear;
		CntctURL = "contacts.cfm?FiscalY=" & fiscalYear;
		ClassURL = "classrooms.cfm";
	}
	else
	{
		SessURL = "sessionsSupe.cfm?FiscalY=" & fiscalYear;
		//ActURL = "activities.cfm?FiscalY=" & fiscalYear;
		MatURL = "materials.cfm?FiscalY=" & fiscalYear;
		CntctURL = "contacts.cfm?FiscalY=" & fiscalYear;
		ClassURL = "classrooms.cfm";
	}

	navArray = ArrayNew(2);
	navArray[1][1] = "mySIA.cfm";
	navArray[1][2] = "mySIA";
	//navArray[2][1] = ActURL;
	//navArray[2][2] = "Activities";
	navArray[2][1] = SessURL;
	navArray[2][2] = "Sessions";
	navArray[3][1] = MatURL;
	navArray[3][2] = "Materials";
	navArray[4][1] = CntctURL;
	navArray[4][2] = "Contacts/Outreach";
	navArray[5][1] = ClassURL;
	navArray[5][2] = "Classrooms";
	navArray[6][1] = ReportURL;
	navArray[6][2] = "Reports";
</cfscript>
