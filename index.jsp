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
<link rel="stylesheet" href="css/bootstrap.min.css">

<style>
.jumbotron {
	background-image: url(images/survey-tools.jpg);
	background-size: cover;
	text-shadow: gray 0.2em 0.2em 0.2em;
}
</style>
</head>
<body>
<% 	String userID = (String)session.getAttribute("userID"); %>
<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">

				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">설문조사</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
		<% if(userID==null){%>
				<li><a href="login.jsp">로그인</a></li>
				<li ><a href="join.jsp">회원가입</a></li>
				<%} 
		else if(userID.equals("admin")){
					%>
					<li><a href = "addQuestion.jsp">질문추가</a></li>
					<li ><a href="deleteQuestion.jsp">질문삭제</a></li>
					<li><a href = "responsesView.jsp">응답보기</a></li>
					<li><a href="logout.jsp">로그아웃</a></li>
					<%} else{ %>
					<li><a href="logout.jsp">로그아웃</a></li>
					<% 
				}%>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="ture"
					aria-expanded="false"><% if(userID==null){%>접속하기<%} else { out.print(userID + "님"); }%><span class="caret"></span></a>
					<ul class="dropdown-menu">
					<li class="active"><a href="index.jsp">메인</a></li>
					<% if(userID==null){%>
						<li ><a href="login.jsp">로그인</a></li>
						<li ><a href="join.jsp">회원가입</a></li>
							<%} 
		else if(userID.equals("admin")){
					%>
						<li><a href = "addQuestion.jsp">질문추가</a></li>
						<li ><a href="deleteQuestion.jsp">질문삭제</a></li>
						<li><a href = "responsesView.jsp">응답 보기</a></li>
						<li ><a href="logout.jsp">로그아웃</a></li>
						
						<%} 
		else{
						%>
						<li ><a href="logout.jsp">로그아웃</a></li>
						<%} %>
					</ul></li>
			</ul>


		</div>
	</nav>

	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">유기견 설문조사</h1>
			<p class="text-center">
				유기견 캠페인을 위한 간단한 설문조사입니다.<br>신중하게 답변해주시기 바랍니다.
			</p>
			<p class="text-center">
			<%if(userID==null){ %>
				<a class="btn btn-primary btn-lg" href="login.jsp" role="button">로그인 하기</a>
					<% } else{%>
					<a class="btn btn-primary btn-lg" href="logout.jsp" role="button">로그아웃 하기</a>
					<%} %>
			</p>
		</div>
		<%if(userID!=null){ %>
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
					if(cnt==0){
						%>
						<center>등록된 질문이 없습니다.</center>
						<%
					}
				%>
				
<br>
				<p>
					<center><input type="submit" value="제출하기" class = "btn"></center>
				</p><br>
				<input type="hidden" name="cnt" value="<%=cnt%>">
			</form>
		</section>
		<%} else{
			%>
			<center>로그인을 하셔야 설문조사에 참여하실 수 있습니다.</center><br>
			
			<% 
		}%>
	
		
</div>
<jsp:include page="footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>