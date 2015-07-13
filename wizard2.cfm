<!---cfinclude template="authenticateExe.cfm"--->
<cfset pageTitle = "Add an Instructional Session">
<cfinclude template="incBegin.cfm">
<cfinclude template="incJSShowCalendar.cfm">
	<cfoutput>
		<form action=""
	          method="post"
	          name="Session"
	          id="Session"
	          onsubmit="JavaScript:return validateForm(this);">
			<span class="formSectionTitle">#pageTitle#</span>
			<div class="form">
				<input type="hidden" name="version" value="" />
				<table border="0" cellpadding="0" cellspacing="0">
					<tr valign="top">
						<td>
							<cfset elementName = "NumAttendees">
							<cfset elementLabel = "Number of students">
							<cfinclude template="incHiLiteMissingElement.cfm">
						</td>
						<td>
							<input
								name="NumAttendees"
								type="text"
								size="5"
								maxlength="6"
								<cfif isDefined("FORM.NumAttendees")>
									value="#FORM.NumAttendees#"
								<cfelseif isDefined("Sess.NumAttendees")>
									value="#Sess.NumAttendees#"
								<cfelse>
									value=""
								</cfif>
							>
						</td>
					</tr>
					<tr valign="top">
						<td>
							Learner category<br>
							<cfset Lookup = "LearnerCategory">
							<cfset Header = "-select-">
							<cfinclude template="uspGetLookup.cfm">
							<select name="LearnerCategoryID">
								<cfloop query="LearnerCategory">
								<option value="#LearnerCategory.LearnerCategoryID#"
									<cfif isDefined("FORM.LearnerCategoryID") and FORM.LearnerCategoryID eq LearnerCategory.LearnerCategoryID>
										selected
									<cfelseif isDefined("Sess.LearnerCategoryID") and Sess.LearnerCategoryID eq LearnerCategory.LearnerCategoryID>
										selected
									</cfif>
								>#LearnerCategory.LearnerCategory#</option>
								</cfloop>
							</select>
						</td>
						<td>
							Affiliation<br>
							<cfset Lookup = "Affiliation">
							<cfset Header = "-select-">
							<cfinclude template="uspGetLookup.cfm">
							<select name="AffiliationID">
								<cfloop query="Affiliation">
									<option value="#Affiliation.AffiliationID#"
										<cfif isDefined("FORM.AffiliationID") and FORM.AffiliationID eq Affiliation.AffiliationID>
											selected
										<cfelseif isDefined("Sess.AffiliationID") and Sess.AffiliationID eq Affiliation.AffiliationID>
											selected
										<cfelse>
										</cfif>
									>#Affiliation.Affiliation#</option>
								</cfloop>
							</select>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="2">
							UCLA department<br>
							<cfset Lookup = "Department">
							<cfset Header = "-select-">
							<cfinclude template="uspGetLookup.cfm">
							<select name="DepartmentID">
								<cfloop query="Department">
								<option value="#Department.DepartmentID#"
									<cfif isDefined("FORM.DepartmentID") and FORM.DepartmentID eq Department.DepartmentID>
										selected
									<cfelseif isDefined("Sess.DepartmentID") and Sess.DepartmentID eq Department.DepartmentID>
										selected
									<cfelse>
									</cfif>
								>#Department.Department#</option>
								</cfloop>
							</select>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="2">
							<!--em class="required">*</em-->Group name<br>
							<input
								name="GroupName"
								type="text"
								size="50"
								maxlength="255"
								<cfif isDefined("FORM.GroupName")>
									value="#FORM.GroupName#"
								<cfelseif isDefined("Sess.GroupName")>
									value="#Sess.GroupName#"
								<cfelse>
									value=""
								</cfif>
							>
						</td>
					</tr>
					<tr valign="top">
						<td nowrap colspan="3">
							<cfset elementName = "DevTime">
							<cfset elementLabel = "Development time">
							<cfinclude template="incHiLiteMissingElement.cfm"><br>
							<input
								name="DevTime"
								type="text"
								style="text-align:right;"
								size="5"
								maxlength="6"
								<cfif isDefined("FORM.DevTime")>
									value="#FORM.DevTime#"
								<cfelseif isDefined("Activity.DevTime")>
									value="#Activity.DevTime#"
								<cfelse>
									value=""
								</cfif>
							> min.
						</td>
					</tr>
					<tr valign="top">
						<td colspan="3">
							Development time comments<br>
							<textarea name="DevComment" cols="48" rows="4" ><cfif isDefined("FORM.DevComment")>#FORM.DevComment#<cfelseif isDefined("Activity.DevComment")>#Activity.DevComment#<cfelse></cfif></textarea>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="3">
							<cfset elementName = "PrepTime">
							<cfset elementLabel = "Preparation time">
							<cfinclude template="incHiLiteMissingElement.cfm"><br>
							<input
								name="PrepTime"
								type="text"
								style="text-align:right;"
								size="5"
								maxlength="6"
								<cfif isDefined("FORM.PrepTime")>
									value="#FORM.PrepTime#"
								<cfelseif isDefined("Sess.PrepTime")>
									value="#Sess.PrepTime#"
								<cfelse>
									value=""
								</cfif>
							> min.
						</td>
					</tr>
					<tr valign="top">
						<td colspan="3">
							Preparation time comments<br>
							<textarea name="PrepComment" cols="48" rows="4"><cfif isDefined("FORM.PrepComment")>#FORM.PrepComment#<cfelseif isDefined("Sess.PrepComment")>#Sess.PrepComment#<cfelse></cfif></textarea>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="3">
							Activity Comments<br>
							<textarea name="Comments" cols="48" rows="4"><cfif isDefined("FORM.Comments")>#FORM.Comments#<cfelseif isDefined("Sess.Comments")>#Sess.Comments#<cfelse></cfif></textarea>
						</td>
					</tr>
				</table>
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<input name="caller" type="hidden" value="formSession">
							<cfif Find("updateSession", SCRIPT_NAME)>
								<input name="SessID" type="hidden" value="#Sess.SessionID#">
							<cfelseif Find("addSession", SCRIPT_NAME)>
								<input name="ActID" type="hidden" value="#ActID#">
							<cfelse>
							</cfif>
							<input name="reqElements" type="hidden" value="QuarterID,a quarter;SessionDate,a sesssion date;Hour,a session time;Marker,AM or PM for the session time"> <!--;GroupName, a group name"-->
							<input name="Submit" type="submit" class="mainControl" style="width:100px;" value="OK" onclick="JavaScript:setVersion(Session, 'main');">
						</td>
						<td>
							<input name="Submit" type="submit" class="mainControl" value="Cancel" onclick="JavaScript:setVersion(Session, 'alt');">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</cfoutput>
<cfinclude template="incEnd.cfm">