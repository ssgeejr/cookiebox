<%@ page
		language="java"
		contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
		%>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>


<%
	String dynamicMenuResponse = "";
	ObjectInputStream doGetResponse = null;
	ObjectOutputStream doGetCall = null;
	try{
		String oauth_token = "97ad5c9517956ad86a5ac03ed9f08f88";
		ArrayList<String> oauth = new ArrayList<String>();
		oauth.add(oauth_token);
		URL dynamicMenu = new URL("http://192.168.1.107:9001/cookiejar/cjservice");
		HttpURLConnection servletConnection = (HttpURLConnection) dynamicMenu.openConnection();
		servletConnection.setRequestMethod("GET");
		servletConnection.setDoOutput(true);
		doGetCall = new ObjectOutputStream(servletConnection.getOutputStream());
		doGetCall.writeObject(oauth);
		doGetCall.flush();

		doGetResponse = new ObjectInputStream(servletConnection.getInputStream());
		dynamicMenuResponse = (String) doGetResponse.readObject();

	}catch(Exception ex){
		try{doGetResponse.close();}catch(Exception exa){}
		try{doGetCall.close();}catch(Exception exb){}

		out.println("<font color=\"red\">");
		StackTraceElement[] ste = ex.getStackTrace();
		int counter = 0;
		out.println(ex.getMessage() + "<br>");
		while(counter < ste.length && counter < 15){
			out.println(ste[counter] + "<br>");
			counter++;
		}
		out.println("</font>");
	}
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta content="en-us" http-equiv="Content-Language" />
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
	<title>Docker Brown Bag Sign-Up</title>

	<link rel = "stylesheet"
		  type = "text/css"
		  href = "menu.css" />

</head>

<body>
<form action="" method="post">
	<table align="center" style="width: 800px">
		<tr>
			<td align="center">
				<img src="home.png" alt="Home Page: Sign-Up"/>
				<%= dynamicMenuResponse %>
			</td>
		</tr>
		<tr>
			<td>Docker Brown Bag Sign-Up for June 5th, 2018</td>
		</tr>
		<tr>
			<td>
				<table style="width: 100%">
					<tr>
						<td>Name</td>
						<td>Email</td>
						<td>Comments</td>
					</tr>
					<tr>
						<td style="width: 250px" valign="top"><input name="username" type="text" style="width: 95%"/>&nbsp;</td>
						<td style="width: 250px" valign="top"><input name="useremail" type="text" style="width: 95%"/>&nbsp;</td>
						<td style="width: 300px" valign="top">
							<textarea name="comments" rows="3" style="width: 100%"></textarea></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<input name="btnSubmit" type="submit" value="Add Me!" />&nbsp;</td>
		</tr>
	</table>
</form>

</body>

</html>
