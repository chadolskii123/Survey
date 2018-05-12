<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/vGraph.css" />
</head>
<body>

	<%
		BufferedReader reader = null;
		String filePath;
		String str;
		String tmpText = "";

		String questionText = ""; //질문들만 모아놓은 문자열
		String[] questionTextArray; //질문들만 모아놓은 배열 

		String answerText = ""; //답변들만 모아놓은 문자열
		String[] answerTextArray1; //답변들만 모아놓은 배열 (엔터기준)
		String[] answerTextArray2; //답변들만 모아놓은 배열 (/기준)

		try {
			filePath = application.getRealPath("/WEB-INF/question.txt");
			reader = new BufferedReader(new FileReader(filePath));

			while ((str = reader.readLine()) != null) {
				tmpText += str + System.lineSeparator();
			}
		} catch (Exception e) {
			out.print("오류가 발생하였습니다.");
		}

		String[] questionArray1 = tmpText.split(System.lineSeparator());
		for (int i = 0; i < questionArray1.length; i++) {
			String[] questionArray2 = questionArray1[i].split("/");
			questionText += questionArray2[2] + System.lineSeparator();
			for (int j = 3; j < questionArray2.length; j++) {
				if (j != questionArray2.length - 1)
					answerText += questionArray2[j] + "/";
				else
					answerText += questionArray2[j] + System.lineSeparator();
			}

		}
		questionTextArray = questionText.split(System.lineSeparator());
		answerTextArray1 = answerText.split(System.lineSeparator());
	%>


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

				<li><a href="management.jsp">설문지 관리</a></li>
				<li class="active"><a href="responsesView.jsp">응답보기</a></li>
				<li><a href="logout.jsp">로그아웃</a></li>


			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="ture"
					aria-expanded="false">admin님<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="index.jsp">메인</a></li>
						<li><a href="management.jsp">설문지 관리</a></li>
						<li class="active"><a href="responsesView.jsp">응답보기</a></li>
						<li><a href="logout.jsp">로그아웃</a></li>
					</ul></li>
			</ul>


		</div>
	</nav>
	<div class="container">
		<%
			reader = null;
			String tmpArray[];
			int cnt = 0; // n번쨰 문항입니다.
			double data = 0;

			try {
				filePath = application.getRealPath("/WEB-INF/data.txt");
				reader = new BufferedReader(new FileReader(filePath));

				while ((str = reader.readLine()) != null) {
					cnt++;
					tmpArray = str.split("/");
		%>
		<div class="vGraph">
			<h5><%=cnt%>번째 항목(총합:
				<%=tmpArray[tmpArray.length - 1]%>)
			</h5>
			<h6><%=questionTextArray[cnt - 1]%></h6>
			<ul>
				<%
					for (int i = 1; i < tmpArray.length - 1; i++) {
						
							answerTextArray2 = answerTextArray1[cnt-1].split("/");
					
						int tmp1 = Integer.parseInt(tmpArray[i]);
						int tmp2 = Integer.parseInt(tmpArray[tmpArray.length - 1]);
						data = (double) tmp1 / tmp2 * 100;
				%>
				<%-- <li><%= data %></li> --%>
				<li><span class="gTerm"><%=answerTextArray2[i-1]%></span><span class="gBar"
					style="height:<%=String.format("%.2f", data)%>%"><span><%=String.format("%.2f", data)%>%(<%=tmpArray[i]%>)</span></span></li>
				<%
					}
				%>
			</ul>
		</div>
		<%
			}
			} catch (Exception e) {
				out.print("오류 발생");
			}
		%>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-latest.js"></script>

</body>
</html>