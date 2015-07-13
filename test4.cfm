<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
	<link href="css/global.css" rel="stylesheet" type="text/css">
</head>

<body>
<form>
		<div class="form">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr valign="top">
					<td>
						<em class="required">*</em>
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
						>  min.<br>
						<p style="font-size: x-small;">
							For credit courses taught,enter duration of one session
							<b>and</b><br>enter the number of sessions in the whole course:
							<input
								name="SessionCount"
								type="text"
								style="text-align:right;" size="5" maxlength="6"
								<cfif isDefined("FORM.SessionCount")>
								value="#FORM.SessionCount#"
								<cfelseif isDefined("Activity.SessionCount")>
								value="#Activity.SessionCount#"
								<cfelse>
								value=""
								</cfif>
							>
						</p>
					</td>
				</tr>
				<tr valign="top">
					<td>
						<em class="required">*</em>
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
					<td>
						Development time comments<br>
						<textarea name="DevComment" cols="48" rows="4" ><cfif isDefined("FORM.DevComment")>#FORM.DevComment#<cfelseif isDefined("Activity.DevComment")>#Activity.DevComment#<cfelse></cfif></textarea>
					</td>
				</tr>
				<tr valign="top">
					<td>
						<em class="required">*</em>
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
					<td>
						Preparation time comments<br>
						<textarea name="PrepComment" cols="48" rows="4"><cfif isDefined("FORM.PrepComment")>#FORM.PrepComment#<cfelseif isDefined("Sess.PrepComment")>#Sess.PrepComment#<cfelse></cfif></textarea>
					</td>
				</tr>
				<!--tr valign="top">
					<td colspan="3">
						Activity Comments<br>
						<textarea name="Comments" cols="48" rows="4"><cfif isDefined("FORM.Comments")>#FORM.Comments#<cfelseif isDefined("Sess.Comments")>#Sess.Comments#<cfelse></cfif></textarea>
					</td>
				</tr-->
			</table>
		</div>
</form>
</body>
</html>
