<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="css/bootstrap.min.css">

</head>
<body>
<nav class="navbar navbar-default">
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

			        <li class="active"><a href = "management.jsp">설문지 관리</a></li>
					<li ><a href = "responsesView.jsp">응답보기</a></li>
					<li><a href="logout.jsp">로그아웃</a></li>
					
			
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="ture"
					aria-expanded="false">admin님<span class="caret"></span></a>
					<ul class="dropdown-menu">
					<li ><a href="index.jsp">메인</a></li>
				    <li class="active"><a href = "management.jsp">설문지 관리</a></li>
					<li ><a href = "responsesView.jsp">응답보기</a></li>
					<li><a href="logout.jsp">로그아웃</a></li>
					</ul></li>
			</ul>


		</div>
	</nav>
	<div class="container">
	  이제 여기서 설문지관리(항목추가, 삭제)
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>