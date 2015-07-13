<cfinclude template="incBeginReport.cfm">

<cfset colSpan = 10>
<cfset spacer = 7>

<cfset sessionCount = 0>
<cfset peopleCount = 0>
<cfset durCount = 0>
<cfset prepCount = 0>
<cfset sessionGrand = 0>
<cfset peopleGrand = 0>
<cfset durGrand = 0>
<cfset prepGrand = 0>

<cfquery name="Types" datasource="#APPLICATION.dsn#">
	SELECT * FROM dbo.ActivityTypeLookup ORDER BY ActivityTypeID
</cfquery>

<table width="98%" border="1" cellspacing="1" cellpadding="1" summary="Scholar Communication Sessions for Fiscal Year">
	<caption align="center" style="font-weight:bold">
		Scholarly Communication Sessions  FY 2009/2010
	</caption>
	<tr>
		<th scope="col" align="left">Session Type</th>
		<th scope="col" align="left">Quarter</th>
		<th scope="col" align="left">Course or Group/Session name</th>
		<th scope="col" align="left">Topics</th>
		<th scope="col" align="left">Delivery Modes</th>
		<th scope="col" align="left">Librarian(s)</th>
		<th scope="col" align="left">Date</th>
		<th scope="col" align="left">Academic Department</th>
		<th scope="col" align="right">Sessions</th>
		<th scope="col" align="right">People</th>
	</tr>

	<cfoutput query="Types">
		<cfset type="#Types.ActivityTypeID#">
		<cfinclude template="incQueryScholar.cfm">
		<tr>
			<td align="left" colspan="#colSpan#">#Types.ActivityType#</td>
		</tr>
		<cfloop query="Sessions">
			<tr>
				<td align="left">&nbsp;</td>
				<td align="left">#Sessions.Quarter#</td>
				<td align="left">#Sessions.Title#</td>
				<td scope="col" align="left">#Sessions.Topics#</td>
				<td scope="col" align="left">#Sessions.Modes#</td>
				<td scope="col" align="left">#Sessions.CoLibs#</td>
				<td scope="col" align="left">#Sessions.StyledSessionDateTime#</td>
				<td scope="col" align="left">#Sessions.Department#</td>
				<td align="right">#Sessions.Sessions#</td>
				<td align="right">#Sessions.People#</td>
			</tr>
			<cfset sessionCount = sessionCount + Sessions.Sessions>
			<cfset peopleCount = peopleCount + Sessions.People>
			<cfset durCount = durCount + Sessions.Duration>
			<cfset prepCount = prepCount + Sessions.PrepTime>
		</cfloop>
		<tr>
			<td align="left" colspan="#colSpan#">&nbsp;</td>
		</tr>
		<tr class="total">
			<td align="left">subtotal</td>
			<td align="left" colspan="#spacer#">&nbsp;</td>
			<td align="right">#sessionCount#</td>
			<td align="right">#peopleCount#</td>
			<cfif FORM.Duration>
				<td align="right"><cfmodule template="convert_time.cfm" total_time=#durCount#></td>
			</cfif>
			<cfif FORM.PrepTime>
				<td align="right"><cfmodule template="convert_time.cfm" total_time=#prepCount#></td>
			</cfif>
		</tr>
		<tr>
			<td align="left" colspan="#colSpan#">&nbsp;</td>
		</tr>
		<cfset sessionGrand = sessionGrand + sessionCount>
		<cfset peopleGrand =  peopleGrand + peopleCount>
		<cfset durGrand =  durGrand + durCount>
		<cfset prepGrand =  prepGrand + prepCount>
		<cfset sessionCount = 0>
		<cfset peopleCount = 0>
		<cfset durCount = 0>
		<cfset prepCount = 0>
	</cfoutput>
	<cfoutput>
		<tr>
			<td align="left" colspan="#colSpan#">&nbsp;</td>
		</tr>
		<tr class="total">
			<td align="left">Grand Totals</td>
			<td align="left" colspan="#spacer#">&nbsp;</td>
			<td align="right">#sessionGrand#</td>
			<td align="right">#peopleGrand#</td>
			<cfif FORM.Duration>
				<td align="right"><cfmodule template="convert_time.cfm" total_time=#durGrand#></td>
			</cfif>
			<cfif FORM.PrepTime>
				<td align="right"><cfmodule template="convert_time.cfm" total_time=#prepGrand#></td>
			</cfif>
		</tr>
	</cfoutput>
</table>