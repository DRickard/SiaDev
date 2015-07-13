<html>
<head>
<title>Multi-select output</title>
</head>
<body>
<cfoutput>
<cfloop
    index = "LearnerCategory"
    delimiters = ","
    list = "#FORM.LearnerCategoryID#">

	<cftry>
		<cfstoredproc procedure="uspAddSessionLearner" datasource="#APPLICATION.dsn#">
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@SessID" value="988" null="no">
			<cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" dbvarname="@LearnID" value="#LearnerCategory#" null="no">
		</cfstoredproc>
		<cfcatch type="Database">
			<cfset em = "#cfcatch.Message#" & "#cfcatch.Detail#">
			<cfscript>
				up2snuff = 0;
				//em = "Database query error";
				//em = "Database insert error. Please try again.";
			</cfscript>
		</cfcatch>
	</cftry>

	<p>
	You selected #LearnerCategory#
	</p>
</cfloop>
</cfoutput>
</body>
</html>