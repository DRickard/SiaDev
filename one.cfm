<html>
<head>
<title>Testing multi-select input</title>
</head>
<body>
<form action="two.cfm" method="post" name="Session" id="Session">
<cfoutput>
Learner category<br>
<cfset Lookup = "LearnerCategory">
<cfset Header = "">
<cfinclude template="uspGetLookup.cfm">
<select name="LearnerCategoryID" multiple size="10"><!-- onChange="javascript:alertLearner(Session)"-->
<cfloop query="LearnerCategory">
<option value="#LearnerCategory.LearnerCategoryID#">#LearnerCategory.LearnerCategory#</option>
</cfloop>
</select>
</cfoutput>
<br/>
<br/>
<input name="Submit" type="submit" class="mainControl" style="width:100px;" value="OK">
</form>
</body>
</html>