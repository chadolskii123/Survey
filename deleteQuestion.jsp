<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
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

				<li><a href="addQuestion.jsp">질문추가</a></li>
				<li class="active"><a href="deleteQuestion.jsp">질문삭제</a></li>
				<li><a href="responsesView.jsp">응답보기</a></li>
				<li><a href="logout.jsp">로그아웃</a></li>


			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="ture"
					aria-expanded="false">admin님<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="index.jsp">메인</a></li>
						<li><a href="addQuestion.jsp">질문추가</a></li>
						<li class="active"><a href="deleteQuestion.jsp">질문삭제</a></li>
						<li><a href="responsesView.jsp">응답보기</a></li>
						<li><a href="logout.jsp">로그아웃</a></li>
					</ul></li>
			</ul>


		</div>
	</nav>


	<div class="container">
		<section>
			<form name="form1" method="get" action="deleteQuestionProc.jsp">
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
				<input type="button" value="<%=cnt%>번 문항 삭제" onClick="ask(<%=tmpArray[0]%>)">
				<%
					}

					} catch (Exception e) {
						System.out.println("오류가 발생했습니다.");
					}
				%>
				<input type="hidden" name="questionNum" value="0">
			</form>
		</section>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script>
		function ask(num) {
			var ask = confirm("정말 삭제하시겠습니까?");
			if (ask == true) {
				form1.questionNum.value = num;
				form1.submit();
			} else if (ask == false) {
				alert("취소하셨습니다.");

			}
			return 0;
		}
	</script>

</body>
</html>