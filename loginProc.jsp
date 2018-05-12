<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미림여자정보과학고등학교</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
	
		String tmpText = "";
		String[] tmpArray1;
		String[] tmpArray2;

		
		if(userID.equals("mirim") && userPassword.equals("mirim")){
			session.setAttribute("userID", "admin");
			
	
		%>
		<jsp:forward page='index.jsp'></jsp:forward>
	<%} %>
		<%
		BufferedReader reader = null;
		try {
			String filePath = application.getRealPath("/WEB-INF/member.txt");

			reader = new BufferedReader(new FileReader(filePath));
			while (true) {
				String str = reader.readLine();
				if (str == null)
					break;
				tmpText += str + System.lineSeparator();
				
			}
		} catch (Exception e) {
			out.println("지정된 파일을 읽을 수 없습니다.");
		} finally {
			reader.close();
		}
		tmpArray1 = tmpText.split(System.lineSeparator());
		
		for(int i = 0; i< tmpArray1.length; i++){
			tmpArray2 = tmpArray1[i].split(",");
			
			if(tmpArray2[0].equals(userID) && tmpArray2[1].equals(userPassword)){
				session.setAttribute("userID", userID);
			  %>
			  <jsp:forward page="index.jsp"></jsp:forward>
			  <% 		
			}
			
			else if(tmpArray2[0].equals(userID) && !(tmpArray2[1].equals(userPassword))){
				%>
				<jsp:forward page="login.jsp"></jsp:forward>
				<%
			}
			else{
				%>
				<jsp:forward page="join.jsp"></jsp:forward>
				<%
			}
		}
	
		
		

	%>
</body>
</html>
