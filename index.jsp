<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>설문조사</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
.jumbotron {
	background-image: url(images/survey-tools.jpg);
	background-size: cover;
	text-shadow: gray 0.2em 0.2em 0.2em;
}
</style>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">유기견 설문조사</h1>
			<p class="text-center">
				유기견 캠페인을 위한 간단한 설문조사입니다.<br>신중하게 답변해주시기 바랍니다.
			</p>
			<p class="text-center">
				<a class="btn btn-primary btn-lg" href="#" role="button">응답 보러
					가기</a>
			</p>
		</div>
		<section>
			<form method="post" action="answerProc.jsp">
				<%
					BufferedReader reader = null;
				int cnt = 0; // n번쨰 문항입니다.
					try {
						String filePath = application.getRealPath("/WEB-INF/question.txt");
						reader = new BufferedReader(new FileReader(filePath));
						String str;
						String tmpArray[];
						

						while ((str = reader.readLine()) != null) {
							cnt++;
							tmpArray = str.split("/");
				%>
				<h5><%=cnt%>번 문항입니다.
				</h5>
				<h6><%=tmpArray[2]%></h6>
				<%
					for (int i = 3; i < tmpArray.length; i++) {
								if (tmpArray[1].equals("N")) {
				%>

				<label><input type="radio" name="question<%=tmpArray[0]%>"
					value="<%=i - 2%>"><%=tmpArray[i]%></label><br>

				<%
					} else {
				%>
				<label><input type="checkbox"
					name="question<%=tmpArray[0]%>" value="<%=i - 2%>"><%=tmpArray[i]%></label><br>
				<%
					}
							}
				%>

				<%
					}

					} catch (Exception e) {
						System.out.println("오류가 발생했습니다.");
					}
				%>

				<p>
					<input type="submit" value="제출하기">
				</p>
				<input type ="hidden" name = "cnt" value = "<%=cnt%>">
			</form>
		</section>
		<footer style="background-color: #000000; color: #FFFFFF">
			<div style="text-align: center">
				<small>Copyright &copy; 2018 김소언(Soeon Kim)
					</h5>
				</small>
		</footer>
	</div>
</body>
</html>