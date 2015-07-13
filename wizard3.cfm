<!---cfinclude template="authenticateExe.cfm"--->
<cfset pageTitle = "Add an Instructional Session">
<cfinclude template="incBegin.cfm">
<cfinclude template="incJSShowCalendar.cfm">
	<cfoutput>
		<span class="formSectionTitle">#pageTitle#</span>
		<div class="form">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr valign="top">
					<td>
						<a href="">Add Faculty</a>
					</td>
				</tr>
				<tr valign="top">
					<td>
						<a href="">Add Co_Presenters</a>
					</td>
				</tr>
				<tr valign="top">
					<td>
						<a href="">Add Developers</a>
					</td>
				</tr>
				<tr valign="top">
					<td>
						<a href="">Add Materials</a>
					</td>
				</tr>
				<tr valign="top">
					<td>
						<a href="">Add Classroom</a>
					</td>
				</tr>
				<tr valign="top">
					<td>
						<a href="">Add Assessment</a>
					</td>
				</tr>
			</table>
		</div>
	</cfoutput>
<cfinclude template="incEnd.cfm">