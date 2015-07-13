<cfinclude template="authenticateExe.cfm">
<cfif IsDefined("FORM.caller")>
	<cfif FORM.caller eq "incMaterials">
		<cfscript>
			UserID = SESSION.LibID;
		</cfscript>
		<cfif FORM.matCount eq 0>
			<cfinclude template="formMateriaExstNewSwitch.cfm">
		<cfelse>
			<cfinclude template="formMaterialAddRemSwitch.cfm">
		</cfif>
	<cfelseif FORM.caller eq "incSession">
		<cfscript>
			if (not IsDefined("FORM.ActID") or not IsDefined("FORM.SessID"))
			{
				up2snuff = 0;
				em = "Invalid or missing parameters";
			}
			else
			{
				ActID = FORM.ActID;
				SessID = FORM.SessID;
				up2snuff = 1;
			}
		</cfscript>
		<cfif not up2snuff>
			<cfinclude template="incBegin.cfm">
			<cfinclude template="incError.cfm">
		<cfelse>
			<cfif FORM.matCount eq 0>
				<cfinclude template="formMateriaExstNewSwitch.cfm">
			<cfelse>
				<cfinclude template="formMaterialAddRemSwitch.cfm">
			</cfif>
		</cfif>
	<cfelseif FORM.caller eq "formMateriaExstNewSwitch">
		<cfscript>
			newMat = FORM.newMat;
			if (IsDefined("FORM.ActID") and FORM.ActID neq 0)
			{
				ActID = FORM.ActID;
				SessID = FORM.SessID;
				UserID = 0;
				up2snuff = 1;
			}
			else if (IsDefined("FORM.UserID"))
			{
				ActID = 0;
				SessID = 0;
				UserID = SESSION.LibID;
				up2snuff = 1;
			}
			else
			{
				up2snuff = 0;
				em = "Invalid or missing parameters";
			}
		</cfscript>
		<cfif not up2snuff>
			<cfinclude template="incBegin.cfm">
			<cfinclude template="incError.cfm">
		<cfelse>
			<cfif newMat eq "1">
				<cfinclude template="formMaterialTypeSwitch.cfm">
			<cfelse>
				<cfinclude template="formMaterialSource.cfm">
			</cfif>
		</cfif>
	<cfelseif FORM.caller eq "formMaterialAddRemSwitch">
		<cfscript>
			Add = FORM.Add;
			if (IsDefined("FORM.ActID"))
			{
				ActID = FORM.ActID;
				SessID = FORM.SessID;
				UserID = 0;
				up2snuff = 1;
			}
			else if (IsDefined("FORM.UserID"))
			{
				ActID = 0;
				SessID = 0;
				UserID = SESSION.LibID;
				up2snuff = 1;
			}
			else
			{
				up2snuff = 0;
				em = "Invalid or missing parameters";
			}
		</cfscript>
		<cfif not up2snuff>
			<cfinclude template="incBegin.cfm">
			<cfinclude template="incError.cfm">
		<cfelse>
			<!--- if adding, ask if new or existing material --->
			<cfif Add neq "0">
				<cfinclude template="formMateriaExstNewSwitch.cfm">
			<cfelse>
				<!--- get materials associated with session or user --->
				<cfscript>
					// initialize variables for uspGetLinkedMaterial stored procedure
					LibID = UserID;
					ActID = ActID;
				</cfscript>
				<cfinclude template="uspGetLinkedMaterial.cfm">
				<cfif not up2snuff>
					<cfinclude template="incBegin.cfm">
					<cfinclude template="incError.cfm">
				<cfelse>
					<cfinclude template="formMaterialList.cfm">
				</cfif>
			</cfif>
		</cfif>
	<cfelseif FORM.caller eq "formMaterialSource">
		<cfscript>
			Add = 1;
			LibID = SESSION.LibID;
			if (IsDefined("FORM.ActID") and FORM.ActID neq 0)
			{
				ActID = FORM.ActID;
				SessID = FORM.SessID;
				UserID = 0;
				up2snuff = 1;
			}
			else if (IsDefined("FORM.UserID"))
			{
				ActID = 0;
				SessID = 0;
				UserID = SESSION.LibID;
				up2snuff = 1;
			}
			else
			{
				up2snuff = 0;
				em = "Invalid or missing parameters";
			}
		</cfscript>
		<cfif not up2snuff>
			<cfinclude template="incBegin.cfm">
			<cfinclude template="incError.cfm">
		<cfelse>
			<cfscript>
				if (IsDefined("FORM.MatTypeID"))
				{
					MatTypeID = FORM.MatTypeID;
				}
				else
				{
					MatTypeID = 0;
				}
				if (IsDefined("FORM.UnitID"))
				{
					UnitID = FORM.UnitID;
				}
				else
				{
					UnitID = 0;
				}
				if (IsDefined("FORM.OwnerID"))
				{
					OwnerID = FORM.OwnerID;
				}
				else
				{
					OwnerID = 0;
				}
			</cfscript>
			<cfinclude template="uspGetUnlinkedMaterials.cfm">
			<cfif not up2snuff>
				<cfinclude template="incBegin.cfm">
				<cfinclude template="incError.cfm">
			<cfelse>
				<cfinclude template="formMaterialList.cfm">
			</cfif>
		</cfif>
	<cfelseif FORM.caller eq "formMaterialList">
		<cfscript>
			if (not isDefined("FORM.MatID") and (not isDefined("FORM.ActID") or not isDefined("FORM.UserID")))
			{
				em = "Invalid or missing parameters";
				up2snuff = 0;
				missingRequired = 0;
			}
			else
			{
				if (FORM.Submit eq "Add Selected")
				{
					Add = 1;
				}
				else
				{
					Add = 0;
				}
				if (isDefined("FORM.ActID"))
				{
					ActID = FORM.ActID;
				}
				else if (isDefined("URL.ActID"))
				{
					ActID = URL.ActID;
				}
				else
				{
					ActID = 0;
				}
				if (isDefined("FORM.SessID"))
				{
					SessID = FORM.SessID;
				}
				else if (isDefined("URL.SessID"))
				{
					SessID = URL.SessID;
				}
				else
				{
					SessID = 0;
				}
				if (isDefined("FORM.UserID"))
				{
					UserID = FORM.UserID;
				}
				else if (isDefined("URL.UserID"))
				{
					UserID = URL.UserID;
				}
				else
				{
					UserID = 0;
				}
			}
			if (not isDefined("FORM.MatID"))
			{
				up2snuff = 0;
				missingRequired = 1;
				if (FORM.Submit eq "Add Selected")
				{
					em = "You must select a material to add.";
				}
				else if (FORM.Submit eq "Remove Selected")
				{
					em = "You must select a material to remove.";
				}
				else
				{
					em = "Invalid or missing parameters";
				}
			}
			else
			{
				up2snuff = 1;
				missingRequired = 0;
			}
		</cfscript>
		<cfif not up2snuff and not missingRequired>
			<cfinclude template="incBegin.cfm">
			<cfinclude template="incError.cfm">
		<cfelse>
			<cfif Add eq "1">
				<cfscript>
					LibID = SESSION.LibID;
					if (IsDefined("FORM.MatTypeID"))
					{
						MatTypeID = FORM.MatTypeID;
					}
					else
					{
						MatTypeID = 0;
					}
					if (IsDefined("FORM.UnitID"))
					{
						UnitID = FORM.UnitID;
					}
					else
					{
						UnitID = 0;
					}
					if (IsDefined("FORM.OwnerID"))
					{
						OwnerID = FORM.OwnerID;
					}
					else
					{
						OwnerID = 0;
					}
				</cfscript>
				<cfinclude template="uspGetUnlinkedMaterials.cfm">
				<cfif not up2snuff>
					<cfinclude template="incBegin.cfm">
					<cfinclude template="incError.cfm">
				<cfelse>
					<cfif missingRequired>
						<cfinclude template="formMaterialList.cfm">
					<cfelse>
						<!--- get info for material --->
						<!--- remember here they can select multiple items to add --->
						<cfloop index="theMaterial" list="#FORM.MatID#">
							<cfscript>
							// initialize variables for uspGetMaterial stored procedure
							MatID = theMaterial;
							MatTypID = 0;
							LibID = 0;
							ActID = ActID;
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
							<cfif not up2snuff>
								<cfinclude template="incBegin.cfm">
								<cfinclude template="incError.cfm">
							<cfelse>
								<!--- either adding material to session or adding material to account --->
								<cfif ActID neq "0">
									<!--- adding material to session could be yours or someone else's --->
									<cfif Material.DBRCreatorID eq SESSION.LibID>
										<!--- if material is yours just add new ActivityMaterial record --->
										<cfscript>
											// initialize variables for uspAddActivityMaterial stored procedure
											ActID = ActID;
											MatID = FORM.MatID;
										</cfscript>
										<cfinclude template="uspAddActivityMaterial.cfm">
										<cfif not up2snuff>
											<cfinclude template="incBegin.cfm">
											<cfinclude template="incError.cfm">
										</cfif>
									<cfelse>
										<!--- otherwise copy material --->
										<cfinclude template="uspCopyMaterial.cfm">
										<cfif not up2snuff>
											<cfinclude template="incBegin.cfm">
											<cfinclude template="incError.cfm">
										<cfelse>
											<!--- if file, copy file to new user --->
											<cfif IsDefined("Material.IsFile") and Material.IsFile>
												<cfinclude template="incCopyFile.cfm">
												<cfif not up2snuff>
													<cfinclude template="incBegin.cfm">
													<cfinclude template="incError.cfm">
												</cfif>
											</cfif>
										</cfif>
									</cfif>
								<cfelse>
									<!--- adding material to account is always someone else's so always copy material --->
									<cfinclude template="uspCopyMaterial.cfm">
									<cfif not up2snuff>
										<cfinclude template="incBegin.cfm">
										<cfinclude template="incError.cfm">
									<cfelse>
										<!--- if file, copy file to new user --->
										<cfif IsDefined("Material.IsFile") and Material.IsFile>
											<cfinclude template="incCopyFile.cfm">
											<cfif not up2snuff>
												<cfinclude template="incBegin.cfm">
												<cfinclude template="incError.cfm">
											</cfif>
										</cfif>
									</cfif>
								</cfif>
							</cfif>
						</cfloop>
						<cfif ActID neq "0">
							<cflocation url="session.cfm?ActID=#ActID#&SessID=#SessID#" addtoken="no">
						<cfelse>
							<cflocation url="materials.cfm?LibID=#SESSION.LibID#" addtoken="no">
						</cfif>
					</cfif>
				</cfif>
			<cfelse>
				<cfscript>
					// initialize variables for uspGetLinkedMaterial stored procedure
					LibID = UserID;
					ActID = ActID;
				</cfscript>
				<cfinclude template="uspGetLinkedMaterial.cfm">
				<cfif not up2snuff>
					<cfinclude template="incBegin.cfm">
					<cfinclude template="incError.cfm">
				<cfelse>
					<cfif missingRequired>
						<cfinclude template="formMaterialList.cfm">
					<cfelse>
						<cfif ActID neq "0">
							<cfscript>
								// initialie variables for uspRemoveMaterialActivity stored procedure
								ActID = ActID;
								MatID = FORM.MatID;
							</cfscript>
							<cfinclude template="uspRemoveMaterialActivity.cfm">
							<cfif not up2snuff>
								<cfinclude template="incBegin.cfm">
								<cfinclude template="incError.cfm">
							<cfelse>
								<cflocation url="session.cfm?ActID=#ActID#&SessID=#SessID#" addtoken="no">
							</cfif>
						<cfelse>
							<cfscript>
								// initialie variables for uspRemoveMaterialLibrarian stored procedure
								LibID = LibID;
								MatID = FORM.MatID;
							</cfscript>
							<cfinclude template="uspRemoveMaterialLibrarian.cfm">
							<cfif not up2snuff>
								<cfinclude template="incBegin.cfm">
								<cfinclude template="incError.cfm">
							<cfelse>
								<cflocation url="materials.cfm?LibID=#LibID#" addtoken="no">
							</cfif>
						</cfif>
					</cfif>
				</cfif>
			</cfif>
		</cfif>
	<cfelse>
		<cfscript>
			em = "Unknown caller";
		</cfscript>
		<cfinclude template="incBegin.cfm">
		<cfinclude template="incError.cfm">
	</cfif>
<cfelse>
	<cfscript>
		em = "No caller value";
	</cfscript>
	<cfinclude template="incBegin.cfm">
	<cfinclude template="incError.cfm">
</cfif>

<!---cfif not isDefined("FORM.Submit")>
	<cfif isDefined("FORM.addRem")>
		<cfscript>
			if (not IsDefined("FORM.ActID") or not IsDefined("FORM.SessID"))
			{
				up2snuff = 0;
				em = "Invalid or missing parameters";
			}
			else
			{
				ActID = FORM.ActID;
				SessID = FORM.SessID;
				up2snuff = 1;
			}
		</cfscript>
		<cfif not up2snuff>
			<cfinclude template="incBegin.cfm">
			<cfinclude template="incError.cfm">
		<cfelse>
			<cfinclude template="formMaterialAddRemSwitch.cfm">
		</cfif>
	<cfelseif isDefined("FORM.Add")>
		<cfscript>
			if (not IsDefined("FORM.ActID") or not IsDefined("FORM.SessID"))
			{
				up2snuff = 0;
				em = "Invalid or missing parameters";
			}
			else
			{
				Add = FORM.Add;
				ActID = FORM.ActID;
				SessID = FORM.SessID;
				up2snuff = 1;
			}
		</cfscript>
		<cfif not up2snuff>
			<cfinclude template="incBegin.cfm">
			<cfinclude template="incError.cfm">
		<cfelse>
			<cfscript>
				// initialize variables for uspGetMaterial stored procedure
				MatID = 0;
				MatTypID = 0;
				LibID = 0;
				ActID = ActID;
				CntctID = 0;
				UID = SESSION.UID;
				sDT = '';
				eDT = '';
				QuartID = 0;
				Yr = 0;
				FiscalY = 0;
				if (Add neq "0")
				{
					Set = "neg";
				}
				else
				{
					Set = "pos";
				}
			</cfscript>
			<cfinclude template="uspGetMaterial.cfm">
			<cfif not up2snuff>
				<cfinclude template="incBegin.cfm">
				<cfinclude template="incError.cfm">
			<cfelse>
				<cfif Material.RecordCount eq 0>
					<cfinclude template="formMaterialTypeSwitch.cfm">
				<cfelse>
					<cfif Add neq "0">
						<cfinclude template="formMateriaExstNewSwitch.cfm">
					<cfelse>
						<cfinclude template="formMaterialList.cfm">
					</cfif>
				</cfif>
			</cfif>
		</cfif>
	<cfelseif isDefined("FORM.newMat")>
		<cfif FORM.newMat eq "1">
			<cfinclude template="formMaterialTypeSwitch.cfm">
		<cfelse>
			<cfscript>
				if (isDefined("FORM.ActID"))
				{
					ActID = FORM.ActID;
				}
				else
				{
					ActID = 0;
				}
				if (isDefined("FORM.SessID"))
				{
					SessID = FORM.SessID;
				}
				else
				{
					SessID = 0;
				}
				up2snuff = 1;
				Add = 1;
				// initialize variables for uspGetMaterial stored procedure
				MatID = 0;
				MatTypID = 0;
				LibID = 0;
				ActID = ActID;
				CntctID = 0;
				UID = SESSION.UID;
				sDT = '';
				eDT = '';
				QuartID = 0;
				Yr = 0;
				FiscalY = 0;
				if (Add neq "0")
				{
					Set = "neg";
				}
				else
				{
					Set = "pos";
				}
			</cfscript>
			<cfinclude template="uspGetMaterial.cfm">
			<cfif not up2snuff>
				<cfinclude template="incBegin.cfm">
				<cfinclude template="incError.cfm">
			<cfelse>
				<cfinclude template="formMaterialList.cfm">
			</cfif>
		</cfif>
	<cfelseif isDefined("FORM.isFile")>
		<cfinclude template="formMaterial.cfm">
	<cfelseif isDefined("URL.Add")>
		<cfscript>
			if (isDefined("URL.ActID"))
			{
				if (not isNumeric(URL.ActID))
				{
					up2snuff = 0;
					em = "Invalid or missing parameters";
				}
				else
				{
					ActID = URL.ActID;
					up2snuff = 1;
				}
			}
			else
			{
				ActID = 0;
			}
			if (isDefined("URL.SessID"))
			{
				if (not isNumeric(URL.SessID))
				{
					up2snuff = 0;
					em = "Invalid or missing parameters";
				}
				else
				{
					SessID = URL.SessID;
					up2snuff = 1;
				}
			}
			else
			{
				SessID = 0;
			}
		</cfscript>
		<cfif not up2snuff>
			<cfinclude template="incBegin.cfm">
			<cfinclude template="incError.cfm">
		<cfelse>
			<cfscript>
				Add = URL.Add;
				// initialize variables for uspGetMaterial stored procedure
				MatID = 0;
				MatTypID = 0;
				LibID = 0;
				ActID = ActID;
				CntctID = 0;
				UID = SESSION.UID;
				sDT = '';
				eDT = '';
				QuartID = 0;
				Yr = 0;
				FiscalY = 0;
				if (Add neq "0")
				{
					Set = "neg";
				}
				else
				{
					Set = "pos";
				}
			</cfscript>
			<cfinclude template="uspGetMaterial.cfm">
			<cfif not up2snuff>
				<cfinclude template="incBegin.cfm">
				<cfinclude template="incError.cfm">
			<cfelse>
				<cfinclude template="formMaterialList.cfm">
			</cfif>
		</cfif>
	<cfelse>
		<cfinclude template="formMaterialTypeSwitch.cfm">
	</cfif>
<cfelseif isDefined("FORM.Submit")>
	<cfscript>
		if (not isDefined("FORM.MatID") and
			not isDefined("FORM.ActID"))
		{
			em = "Invalid or missing parameters";
			up2snuff = 0;
			missingRequired = 0;
		}
		else
		{
			if (FORM.Submit eq "Add Selected")
			{
				Add = 1;
			}
			else
			{
				Add = 0;
			}
			if (isDefined("FORM.ActID"))
			{
				ActID = FORM.ActID;
			}
			else if (isDefined("URL.ActID"))
			{
				ActID = URL.ActID;
			}
			else
			{
				ActID = 0;
			}
			if (isDefined("FORM.SessID"))
			{
				SessID = FORM.SessID;
			}
			else if (isDefined("URL.SessID"))
			{
				SessID = URL.SessID;
			}
			else
			{
				SessID = 0;
			}
		}
		if (not isDefined("FORM.MatID"))
		{
			up2snuff = 0;
			missingRequired = 1;
			if (FORM.Submit eq "Add Selected")
			{
				em = "You must select a material to add.";
			}
			else if (FORM.Submit eq "Remove Selected")
			{
				em = "You must select a material to remove.";
			}
			else
			{
				em = "Invalid or missing parameters";
			}
		}
		else
		{
			up2snuff = 1;
			missingRequired = 0;
		}
	</cfscript>
	<cfif not up2snuff and not missingRequired>
		<cfinclude template="incBegin.cfm">
		<cfinclude template="incError.cfm">
	<cfelse>
		<cfscript>
		up2snuff = 1;
		// initialize variables for uspGetMaterial stored procedure
		MatID = 0;
		MatTypID = 0;
		LibID = 0;
		ActID = ActID;
		CntctID = 0;
		UID = SESSION.UID;
		sDT = '';
		eDT = '';
		QuartID = 0;
		Yr = 0;
		FiscalY = 0;
		if (Add neq "0")
		{
			Set = "neg";
		}
		else
		{
			Set = "pos";
		}
		</cfscript>
		<cfinclude template="uspGetMaterial.cfm">
		<cfif not up2snuff>
			<cfinclude template="incBegin.cfm">
			<cfinclude template="incError.cfm">
		<cfelse>
			<cfif missingRequired>
				<cfinclude template="formMaterialList.cfm">
			<cfelse>
				<cfif Add eq "1">
					<cfscript>
						// initialize variables for uspAddMaterial stored procedure
						ActID = ActID;
						MatID = FORM.MatID;
					</cfscript>
					<cfinclude template="uspAddMaterial.cfm">
					<cfif not up2snuff>
						<cfinclude template="incBegin.cfm">
						<cfinclude template="incError.cfm">
					<cfelse>
						<cflocation url="session.cfm?ActID=#ActID#&SessID=#SessID#" addtoken="no">
					</cfif>
				<cfelseif Add eq "0">
					<cfscript>
						// initialie variables for uspRemoveMaterial stored procedure
						ActID = ActID;
						MatID = FORM.MatID;
					</cfscript>
					<cfinclude template="uspRemoveMaterial.cfm">
					<cfif not up2snuff>
						<cfinclude template="incBegin.cfm">
						<cfinclude template="incError.cfm">
					<cfelse>
						<cflocation url="session.cfm?ActID=#ActID#&SessID=#SessID#" addtoken="no">
					</cfif>
				</cfif>
			</cfif>
		</cfif>
	</cfif>
<cfelse>
	<cfinclude template="incBegin.cfm">
	<cfinclude template="incError.cfm">
</cfif--->