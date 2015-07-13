<cfscript>
	// initialize variables for uspGetAccount stored procedure
	up2snuff = 0;
	LibID = 0;
	UserName = "drickard1967";
	Password = "4uwg204";
</cfscript>
<cfinclude template="uspGetAccount.cfm">
<cfset fiscalYear="">
<cfset FiscalY="2008">
<cflock timeout="#CreateTimeSpan(0, 0, 120, 0)#" type="readonly" scope="session">
	<cfset SESSION.isAuthentic = 1>
	<cfset SESSION.LibID = Account.LibrarianID>
	<cfset SESSION.UserName = Account.UserName>
	<cfset SESSION.UserLevelID = Account.UserLevelID>
	<cfset SESSION.Administrator = Account.Administrator>
	<cfset SESSION.UID = Account.UnitID>
	<cfset SESSION.fiscalYear = fiscalYear>
</cflock>
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
<cfscript>
// initialize variables for uspGetMaterial stored procedure
	MatID = 0;
	MatTypID = 0;
	LibID = SESSION.LibID;
	ActID = 0;
	CntctID = 0;
	UID = 0;
	sDT = '';
	eDT = '';
	QuartID = 0;
	Yr = 0;
	FiscalY = 0;
	Set = "";
</cfscript>
<cfinclude template="uspGetMaterial.cfm">
<cfset ord = "a">
<cfinclude template="incBegin.cfm">
<cfinclude template="incMaterials.cfm">
<cfinclude template="incEnd.cfm">