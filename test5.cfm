<html>
	<head><title>Test Page</title></head>
	<body>
		<cfoutput>
			<cfloop collection="#Form#" item="VarName">
				<p>Param "VarName" = #Form[VarName]#</p>
			</cfloop>
		</cfoutput>
	</body>
</html>