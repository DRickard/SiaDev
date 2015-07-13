<cfquery name="Librarians" datasource="#APPLICATION.dsn#">
	SELECT DISTINCT
		l.LastName,
		l.FirstName,
		l.LibrarianID
	FROM
		dbo.Librarian l
		JOIN dbo.SessionLibrarian sl ON l.LibrarianID = sl.LibrarianID
	ORDER BY
		l.LastName
</cfquery>
<cfset pageTitle = "Add an Instructional Material">
<cfinclude template="incBegin.cfm">
<span class="dataSectionTitle"><cfoutput>#pageTitle#</cfoutput></span>
<div class="data">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td colspan="3">
				Select one method to list available materials:
			</td>
		</tr>
		<tr valign="top">
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr valign="top">
			<td>
				<form method="post" action="addRemoveMaterial.cfm">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr><td>View by material type:</td></tr>
						<tr>
							<td>
								<cfset Lookup = "MaterialType">
								<cfset Header = "-select-">
								<cfinclude template="uspGetLookup.cfm">
								<select name="MatTypeID">
									<cfoutput query="MaterialType">
										<option value="#MaterialType.MaterialTypeID#">#MaterialType.MaterialType#</option>
									</cfoutput>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<cfoutput>
									<cfif isDefined("ActID")>
										<input name="ActID" type="hidden" value="#ActID#">
									</cfif>
									<cfif isDefined("SessID")>
										<input name="SessID" type="hidden" value="#SessID#">
									</cfif>
									<cfif isDefined("UserID")>
										<input name="UserID" type="hidden" value="#UserID#">
									</cfif>
								</cfoutput>
								<input type="hidden" name="caller" value="formMaterialSource">
								<input type="submit" class="mainControl" value="View">
							</td>
						</tr>
					</table>
				</form>
			</td>
			<td>
				<form method="post" action="addRemoveMaterial.cfm">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr><td>View by library unit:</td></tr>
						<tr>
							<td>
								<cfset Lookup = "Unit">
								<cfset Header = "">
								<cfinclude template="uspGetLookup.cfm">
								<select name="UnitID">
									<option value="0">-select-</option>
									<cfoutput query="Unit">
										<option value="#Unit.UnitID#">#Unit.Unit#</option>
									</cfoutput>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<cfoutput>
									<cfif isDefined("ActID")>
										<input name="ActID" type="hidden" value="#ActID#">
									</cfif>
									<cfif isDefined("SessID")>
										<input name="SessID" type="hidden" value="#SessID#">
									</cfif>
									<cfif isDefined("UserID")>
										<input name="UserID" type="hidden" value="#UserID#">
									</cfif>
								</cfoutput>
								<input type="hidden" name="caller" value="formMaterialSource">
								<input type="submit" class="mainControl" value="View">
							</td>
						</tr>
					</table>
				</form>
			</td>
			<td>
				<form method="post" action="addRemoveMaterial.cfm">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr><td>View by librarian:</td></tr>
						<tr>
							<td>
								<select name="OwnerID">
									<option value="0">-select-</option>
									<cfoutput query="Librarians">
										<option value="#Librarians.LibrarianID#">#Librarians.LastName#, #Librarians.FirstName#</option>
									</cfoutput>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<cfoutput>
									<cfif isDefined("ActID")>
										<input name="ActID" type="hidden" value="#ActID#">
									</cfif>
									<cfif isDefined("SessID")>
										<input name="SessID" type="hidden" value="#SessID#">
									</cfif>
									<cfif isDefined("UserID")>
										<input name="UserID" type="hidden" value="#UserID#">
									</cfif>
								</cfoutput>
								<input type="hidden" name="caller" value="formMaterialSource">
								<input type="submit" class="mainControl" value="View">
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</div>
<cfinclude template="incEnd.cfm">