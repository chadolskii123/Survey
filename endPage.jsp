<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>적어라</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-default">
<% 	String userID = (String)session.getAttribute("userID"); %>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">설문조사</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-exapmple-navbar-collapse-1">
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
					<li><a href = "responsesView.jsp">응답보기</a></li>
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
 응답해주셔서 감사합니다.

 <input type=  "button" value = "홈화면으로 돌아가기" onClick = "location.href = 'index.jsp'">
  </div>
 <jsp:include page="footer.jsp"></jsp:include>
 	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>