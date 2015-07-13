<html>
<head><title>Test Page</title></head>
<body>
<cfset todayDate = Now()>
<h3>DatePart Example</h3>
<p>Today's date is <cfoutput>#todayDate#</cfoutput>.
<p>Using datepart, we extract an integer representing the dateparts from that value
<cfoutput>
<ul>
   <li>year: #DatePart("yyyy", todayDate)#
   <li>quarter: #DatePart("q", todayDate)#
   <li>month: #DatePart("m", todayDate)#
   <li>day of year: #DatePart("y", todayDate)#
   <li>day: #DatePart("d", todayDate)#
   <li>weekday: #DatePart("w", todayDate)#
   <li>week: #DatePart("ww", todayDate)#
   <li>hour: #DatePart("h", todayDate)#
   <li>minute: #DatePart("n", todayDate)#
   <li>second: #DatePart("s", todayDate)#
</ul>
</cfoutput>
</body>
</html>