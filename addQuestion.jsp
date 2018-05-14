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

				<li class="active"><a href="addQuestion.jsp">질문추가</a></li>
				<li ><a href="deleteQuestion.jsp">질문삭제</a></li>
				<li><a href="responsesView.jsp">응답보기</a></li>
				<li><a href="logout.jsp">로그아웃</a></li>


			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="ture"
					aria-expanded="false">admin님<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="index.jsp">메인</a></li>
						<li class="active"><a href="addQuestion.jsp">질문추가</a></li>
						<li ><a href="deleteQuestion.jsp">질문삭제</a></li>
						<li><a href="responsesView.jsp">응답보기</a></li>
						<li><a href="logout.jsp">로그아웃</a></li>
					</ul></li>
			</ul>


		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form name="form1" method="post" action="insertItemProc.jsp">
					<h3 stlye="text-align:center;">설문 항목 추가</h3>
					<div class="form-group">
						<textarea rows="5" cols="10" class="form-control" placeholder="질문"
							name="question"></textarea>
					</div>
					<div class="form-group">
						
						<table id="item" border="0" cellspacing="0" cellpadding="0"
							width="100%">
							<tr>
								<td><input type="text" class="form-control"
									placeholder="항목" name="item0"></td>
							</tr>
						</table>

					</div>
					<div class="form-group">
						<input type="button" class="btn btn-primary form-control" value="항목추가" onClick="addColumn('item')">
						<input type="button" class="btn btn-primary form-control" value="항목삭제" onClick="removeColumn('item')" style ="margin-top:15px">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"> <input
								type="radio" name="boxType" value="radioBox" checked>RadioBox
							</label> <label class="btn btn-primary"> <input type="radio"
								name="boxType" value="checkBox">CheckBox
							</label>
						</div>
					</div>
					<input type="button" class="btn btn-primary form-control"
						value="추가하기" onClick="check()">
						
						<input type = "hidden" name = "itemCount" value = "1">
				</form>
			</div>
		</div>
	</div>
	

	
	
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script>
		function addColumn(tableid) {
			var table = document.getElementById(tableid);

			var rowlen = table.rows.length + 1;
			
		
			if(rowlen > 7){
				alert("최대 7개 항목을 입력하실 수 있습니다.");
				form1.item6.focus();
				return 0;
			}
			// var row = table.insertRow(); // IE와 Chrome 동작을 달리함.
			var row = table.insertRow(rowlen - 1); // HTML에서의 권장 표준 문법

			row.insertCell(0).innerHTML = "<td><input type='text' style = 'margin-top:10px' class = 'form-control' placeholder = '항목' name = '"
					+ tableid  + (rowlen - 1) + "'> </td>";

			form1.itemCount.value = rowlen;

		}
		function removeColumn(tableid) {
			var table = document.getElementById(tableid);
			var rowlen = table.rows.length -1;
			
			if(rowlen < 1) {
				alert("1개 이상의 항목을 입력하셔야 합니다.");
				form1.item0.focus();
				return 0;
			}
			
		    document.getElementById(tableid).deleteRow(rowlen);
		    form1.itemCount.value = rowlen;
		}
		function check(){
			//TODO: 유효성 체크
			form1.submit();
		}
	</script>
	

</body>
</html>