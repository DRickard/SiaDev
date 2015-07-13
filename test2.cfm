<cfset kwords=#replace("E Coli"," ","+","all")#>
<html>
<head><title>CFHTTP Test</title></head>
<body>
<cfhttp method="get" url="http://www.cas.org/cgi-bin/ddssearch.pl?type=titlekywd&string=E%20Coli" timeout="60">
<cfset fileContent=RemoveChars("#cfhttp.FileContent#", 1, 2981+#Len(kwords)#)>
</body>
</html>