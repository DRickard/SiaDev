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
						<td colspan="3">
							<em class="required">*</em>
							<cfset elementName = "Title">
							<cfset elementLabel = "Activity/course title">
							<cfinclude template="incHiLiteMissingElement.cfm"><br>
							<input
								name="Title"
								type="text"
								size="55"
								maxlength="255"
								<cfif isDefined("FORM.Title")>
								value="#FORM.Title#"
								<cfelseif isDefined("Activity.Title")>
									value="#Activity.Title#"
								<cfelse>
									value=""
								</cfif>
							>
							&nbsp;
							<a href="http://www.registrar.ucla.edu/schedule/" target="_blank" class="navLink0">Schedule of Classes</a>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="3">
							Activity/course description<br>
							<textarea name="Description" cols="48" rows="4"><cfif isDefined("FORM.Description")>#FORM.Description#<cfelseif isDefined("Activity.Description")>#Activity.Description#<cfelse></cfif></textarea>
						</td>
					</tr>
					<tr valign="top">
						<td>
							<em class="required">*</em>
							Activity/course type<br>
							<cfset Lookup = "ActivityType">
							<cfset Header = "-select-">
							<cfinclude template="uspGetLookup.cfm">
							<select name="ActivityTypeID">
								<cfloop query="ActivityType">
									<option
										value="#ActivityType.ActivityTypeID#"
										<cfif isDefined("FORM.ActivityTypeID") and FORM.ActivityTypeID eq ActivityType.ActivityTypeID>selected<cfelseif isDefined("Activity.ActivityTypeID") and Activity.ActivityTypeID eq ActivityType.ActivityTypeID>selected</cfif>
									>#ActivityType.ActivityType#</option>
								</cfloop>
							</select>
						</td>
						<td>
							<em class="required">*</em>
							Delivery mode<br>
							<cfset Lookup = "DeliveryMode">
							<cfset Header = "-select-">
							<cfinclude template="uspGetLookup.cfm">
							<select name="DeliveryModeID">
								<cfloop query="DeliveryMode">
									<option
										value="#DeliveryMode.DeliveryModeID#"
										<cfif isDefined("FORM.DeliveryModeID") and FORM.DeliveryModeID eq DeliveryMode.DeliveryModeID>selected<cfelseif isDefined("Activity.DeliveryModeID") and Activity.DeliveryModeID eq DeliveryMode.DeliveryModeID>selected</cfif>
									>#DeliveryMode.DeliveryMode#</option>
								</cfloop>
							</select>
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
				</table>
				<table border="0" cellpadding="0" cellspacing="0">
					<tr valign="top">
						<td colspan="4">
							Instructional activity title<br>
							<cfif Find("updateSession.cfm", SCRIPT_NAME)>
								<input name="Title" type="text" disabled="true" value="#Sess.Title#" size="65" readonly="true">
							<cfelseif  Find("addSession.cfm", SCRIPT_NAME)>
								<input name="Title" type="text" disabled="true" value="#Activity.Title#" size="65" readonly="true">
							<cfelse>
							</cfif>
						</td>
					</tr>
					<tr valign="top">
						<td>
							<em class="required">*</em>Quarter<br>
							<cfset Lookup = "Quarter">
							<cfset Header = "-select-">
							<cfinclude template="uspGetLookup.cfm">
							<select name="QuarterID">
								<cfloop query="Quarter">
									<option value="#Quarter.QuarterID#"
											<cfif isDefined("FORM.QuarterID") and FORM.QuarterID eq Quarter.QuarterID>
												selected
											<cfelseif isDefined("Sess.QuarterID") and Sess.QuarterID eq Quarter.QuarterID>
												selected
											<cfelse>
											</cfif>
									>#Quarter.Quarter#</option>
								</cfloop>
							</select>
						</td>
						<td>
							<em class="required">*</em>
							<cfset elementName = "SessionDate">
							<cfset elementLabel = "Session date">
							<cfinclude template="incHiLiteMissingElement.cfm"><br>
							<input
								type="text"
								name="SessionDate"
								size="12"
								maxlength="10"
								<cfif isDefined("FORM.SessionDate")>
									value="#FORM.SessionDate#"
								<cfelseif isDefined("FORM.sDT")>
									value="#FORM.sDT#"
								<cfelseif isDefined("Sess.SessionDateTime")>
									value="#DateFormat(Sess.SessionDateTime, "mm/dd/yyyy")#"
								<cfelse>
									value=""
								</cfif>
							><br>
							<a href="javascript:ShowCalendar('Session','SessionDate')">Select Date</a><!--EZ-D8 Select</a><sup>&reg;</sup-->
						</td>
						<td nowrap>
							<em class="required">*</em>Session time<br>
							<select name="Hour">
								<option value="">--</option>
								<cfloop index="Hr" from="1" to="12" step="1">
									<option value="#Hr#"
										<cfif isDefined("FORM.Hour") and FORM.Hour eq Hr>
											selected
										<cfelseif isDefined("Sess.SessionDateTime") and TimeFormat(Sess.SessionDateTime, "h") eq Hr>
											selected
										</cfif>
									>#Hr#</option>
								</cfloop>
							</select>
							<span style="font-size:150%;">:</span>
							<select name="Minute">
								<cfloop index="Minute" from="0" to="55" step="5">
									<option value="#TimeFormat(CreateTime(00, Minute, 00), "mm")#"
										<cfif isDefined("FORM.Minute") and TimeFormat(CreateTime(00, Minute, 00), "mm") eq FORM.Minute>
											selected
										<cfelseif isDefined("Sess.SessionDateTime") and TimeFormat(CreateTime(00, Minute, 00), "mm") eq Minute(Sess.SessionDateTime)>
											selected
										<cfelse>
										</cfif>
									>#TimeFormat(CreateTime(00, Minute, 00), "mm")#</option>
								</cfloop>
							</select>
							<select name="Marker">
								<option value="">--</option>
								<cfif isDefined("FORM.Marker")>
									<option value="AM" <cfif FORM.Marker eq "AM">selected</cfif>>A.M.</option>
									<option value="PM" <cfif FORM.Marker eq "PM">selected</cfif>>P.M.</option>
								<cfelseif isDefined("Sess.SessionDateTime")>
									<option value="AM" <cfif Hour(Sess.SessionDateTime) lt 12>selected</cfif>>A.M.</option>
									<option value="PM" <cfif Hour(Sess.SessionDateTime) gt 11>selected</cfif>>P.M.</option>
								<cfelse>
									<option value="AM">A.M.</option>
									<option value="PM">P.M.</option>
								</cfif>
							</select>
						</td>
						<td>
							<cfset elementName = "Duration">
							<cfset elementLabel = "Duration">
							<cfinclude template="incHiLiteMissingElement.cfm"><br>
							<input
								name="Duration"
								type="text"
								style="text-align:right;" size="5" maxlength="6"
								<cfif isDefined("FORM.Duration")>
								value="#FORM.Duration#"
								<cfelseif isDefined("Sess.Duration")>
								value="#Sess.Duration#"
								<cfelse>
								value=""
								</cfif>
							>  min.
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