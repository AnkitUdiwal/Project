<%
String cols=request.getParameter("cols");
int n=Integer.parseInt(cols);
for(int i=1;i<=n;i++)
{
	%>
	Enter Column <%=i %> name<input type="text" name="cname">
	Enter Column <%=i %> type<input type="text" name="ctype">
	<br>
	<%
}
%>

