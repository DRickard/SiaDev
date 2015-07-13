<cfset request = GetHttpRequestData()>
<cfset browser = StructFind(request.headers, "User-Agent")>
<cfif Find("MSIE",browser) neq 0>
	<cfset isIE = 1>
<cfelse>
	<cfset isIE = 0>
</cfif>

<html>
<head>
<title>Testing JavaScript</title>
<style type="text/css">
<!--
.tblcopy {
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 11px;
}
.form1 {
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 11px;
color: #0000CC;
border: 0px solid;
text-align: center;
}
.form2 {
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 11px;
color: #0000CC;
border: 0px solid;
background-color: #FFFFCC;
text-align: center;
}
.form3 {
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 11px;
border: 0px solid;
background-color: #DEDEDE;
text-align: left;
line-height: 7pt;
}
.small {
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 11px;
line-height: 1em;
}
input, textarea, select {
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 11px;
margin-bottom: 0px;
}
-->
</style>
</head>
<body>
<form action="temp.html" method="post" id="form1" name="KeyPad">
<table width="75%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td bgcolor="#CCCCCC" class="small">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small">Directional</td>
<td bgcolor="#CCCCCC" class="small">&nbsp;</td>
<td bgcolor="#999999" class="small" align="center">
<input type="text" name="BIO04010101" <cfif not isIE>id="BIO04010101"<cfelse>onMouseDown="JavaScript:Increment('BIO04010101')"</cfif> size="1" maxlength="2" class="form1">
</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#999999" class="small" align="center">
<input type="text" name="BIO04010102" <cfif not isIE>id="BIO04010102"<cfelse>onMouseDown="JavaScript:Increment('BIO04010102')"</cfif> size="1" maxlength="2" class="form1">
</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
</tr>
<tr>
<td bgcolor="#CCCCCC" class="small">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small">Inquiry</td>
<td bgcolor="#CCCCCC" class="small">&nbsp;</td>
<td bgcolor="#999999" class="small" align="center">
<input type="text" name="BIO04010201" <cfif not isIE>id="BIO04010201"<cfelse>onMouseDown="JavaScript:Increment('BIO04010201')"</cfif> size="1" maxlength="2" class="form1">
</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#999999" class="small" align="center">
<input type="text" name="BIO04010202" <cfif not isIE>id="BIO04010202"<cfelse>onMouseDown="JavaScript:Increment('BIO04010202')"</cfif> size="1" maxlength="2" class="form1">
</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
</tr>
<tr>
<td bgcolor="#CCCCCC" class="small">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small">Strategy</td>
<td bgcolor="#CCCCCC" class="small">&nbsp;</td>
<td bgcolor="#999999" class="small" align="center">
<input type="text" name="BIO04010301" <cfif not isIE>id="BIO04010301"<cfelse>onMouseDown="JavaScript:Increment('BIO04010301')"</cfif> size="1" maxlength="2" class="form1">
</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#999999" class="small" align="center">
<input type="text" name="BIO04010302" <cfif not isIE>id="BIO04010302"<cfelse>onMouseDown="JavaScript:Increment('BIO04010302')"</cfif> size="1" maxlength="2" class="form1">
</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
</tr>
<tr>
<td bgcolor="#CCCCCC" class="small">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small">Tutorial</td>
<td bgcolor="#CCCCCC" class="small">&nbsp;</td>
<td bgcolor="#999999" class="small" align="center">
<input type="text" name="BIO04010401" <cfif not isIE>id="BIO04010401"<cfelse>onMouseDown="JavaScript:Increment('BIO04010401')"</cfif> size="1" maxlength="2" class="form1">
</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#999999" class="small" align="center">
<input type="text" name="BIO04010402" <cfif not isIE>id="BIO04010402"<cfelse>onMouseDown="JavaScript:Increment('BIO04010402')"</cfif> size="1" maxlength="2" class="form1">
</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
</tr>
<tr>
<td bgcolor="#CCCCCC" class="small">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small">Research assistance</td>
<td bgcolor="#CCCCCC" class="small">&nbsp;</td>
<td bgcolor="#999999" class="small" align="center">
<input type="text" name="BIO04010501" <cfif not isIE>id="BIO04010501"<cfelse>onMouseDown="JavaScript:Increment('BIO04010501')"</cfif> size="1" maxlength="2" class="form1">
</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#999999" class="small" align="center">
<input type="text" name="BIO04010502" <cfif not isIE>id="BIO04010502"<cfelse>onMouseDown="JavaScript:Increment('BIO04010502')"</cfif> size="1" maxlength="2" class="form1">
</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
<td bgcolor="#CCCCCC">&nbsp;</td>
<td bgcolor="#CCCCCC" class="small" align="center">&nbsp;</td>
</tr>
<tr>
<td height="1" colspan="12" bgcolor="#FFFFFF" class="small">&nbsp;</td>
</tr>
<tr bgcolor="#999999">
<td width="1" class="small">&nbsp;</td>
<td height="8" class="small">Transaction</td>
<td width="1" class="small">&nbsp;</td>
<td class="small" align="center">
<input type="text" name="BIO04010000" size="1" maxlength="2" class="form2">
</td>
<td colspan="8" class="small">&nbsp;</td>
</tr>
<tr><td colspan="12" align="center"><input type="reset" value="Reset"></td></tr>
</table>
</form>
<script language="JavaScript" type="text/javascript">
<!--
var Transaction = false;
<cfif isIE>
<cfinclude template="incrementIE.cfm">
<cfelse>
<cfinclude template="incrementFF.cfm">
</cfif>
-->
</script>
</body>


<!---cfquery name="Librarians" datasource="#APPLICATION.dsn#">
	SELECT LibrarianID, LastName, FirstName, Title
	FROM Librarian
	WHERE UnitID = 8
	ORDER BY LastName
</cfquery>
		<table width="98%" border="1">
			<tr><th>Surname</th><th>First Name</th><th>Title</th><th>Activities</th></tr>
			<cfoutput query="Librarians">
				<tr>
					<td>#Librarians.LastName#</td><td>#Librarians.FirstName#</td><td>#Librarians.Title#</td>
					<td>
						<cfquery name="Activities" datasource="#APPLICATION.dsn#">
							SELECT a.Title, atl.ActivityType
							FROM Activity a, ActivityTypeLookup atl, ActivityLibrarian al
							WHERE al.LibrarianID = #Librarians.LibrarianID#
								AND al.ActivityID = a.ActivityID
								AND a.ActivityTypeID = atl.ActivityTypeID
							ORDER BY a.Title
						</cfquery>
						<cfif Activities.RecordCount neq 0>
							<cfloop query="Activities">
								#Activities.Title#(#Activities.ActivityType#)<br>
							</cfloop>
						<cfelse>
							&nbsp;
						</cfif>
					</td>
				</tr>
			</cfoutput>
		</table--->

<!---html>
	<head><title>HTML Headers Testing</title></head>
	<body>
		<cfset x = GetHttpRequestData()>
		<cfoutput>
			<table cellpadding = "2" cellspacing = "2">
				<tr>
					<td><b>HTTP Request item</b></td>
					<td><b>Value</b></td>
				</tr>
				<cfloop collection = #x.headers# item = "http_item">
					<tr>
						<td>#http_item#</td>
						<td>#StructFind(x.headers, http_item)#</td>
					</tr>
				</cfloop>
				<tr>
					<td>request_method</td>
					<td>#x.method#</td>
				</tr>
				<tr>
					<td>server_protocol</td>
					<td>#x.protocol#</td>
				</tr>
			</table>
			<b>http_content --- #x.content#</b>
		</cfoutput>
		<cfset browser=StructFind(x.headers, "User-Agent")>
		<div>
			<p>Browser = <cfoutput>#browser#</cfoutput></p>
			<cfif Find("MSIE",browser) neq 0>
				<p>Browser is IE</p>
			<cfelse>
				<p>Browser is not IE</p>
			</cfif>
		</div>
	</body>
</html--->