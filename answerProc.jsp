<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>적어라</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String cnt = request.getParameter("cnt");

		BufferedReader reader = null;
		String filePath;
		String str;

		/* data.txt읽어서저장 */
		String dataText = "";
		String[] dataTextSplit;
		String IncreaseDataText = "";

		String[] tmpArray;
		String[] CheckBoxQuestion;
		String RadioBoxQuestion;
		/* String WriteText; */

		try {
			filePath = application.getRealPath("/WEB-INF/data.txt");
			reader = new BufferedReader(new FileReader(filePath));
			while (true) {
				str = reader.readLine();
				if (str == null)
					break;
				dataText += str + "\n";
			}
		} catch (Exception e) {
			out.println("지정된 파일을 찾을 수 없습니다.1");
		} finally {
			reader.close();
		}

		dataTextSplit = dataText.split("\n");
		

		try {
			filePath = application.getRealPath("/WEB-INF/question.txt");

			reader = new BufferedReader(new FileReader(filePath));
			while (true) {
				str = reader.readLine();
				if (str == null)
					break;
				tmpArray = str.split("/");
				if (tmpArray[1].equals("Y")) { //중복정답가능한것		
					CheckBoxQuestion = request.getParameterValues("question" + tmpArray[0]);
					

					for (int i = 0; i < dataTextSplit.length; i++) {
						String dataOneline[] = dataTextSplit[i].split("/");
						if (tmpArray[0].equals(dataOneline[0])) {
							for (int j = 0; j < CheckBoxQuestion.length; j++) {
								int tmpInt = Integer.parseInt(dataOneline[Integer.parseInt(CheckBoxQuestion[j])]);
								tmpInt++;
								dataOneline[Integer.parseInt(CheckBoxQuestion[j])] = String.valueOf(tmpInt);
							}
							for (int k = 0; k < dataOneline.length; k++) {
								if (k != dataOneline.length - 1)
									IncreaseDataText += dataOneline[k] + "/";
								else
									IncreaseDataText += dataOneline[k] + "\n";
							}

						}
				
						

					}
				} // end of id 
				else {
					RadioBoxQuestion = request.getParameter("question" + tmpArray[0]);
					/* out.print(RadioBoxQuestion + "<br>"); */
					 for (int i = 0; i < dataTextSplit.length; i++) {
						String dataOneline[] = dataTextSplit[i].split("/");
						if (tmpArray[0].equals(dataOneline[0])) {
								int tmpInt = Integer.parseInt(dataOneline[Integer.parseInt(RadioBoxQuestion)]);
								tmpInt++;
								dataOneline[Integer.parseInt(RadioBoxQuestion)] = String.valueOf(tmpInt);
								for (int k = 0; k < dataOneline.length; k++) {
									if (k != dataOneline.length - 1)
										IncreaseDataText += dataOneline[k] + "/";
									else
										IncreaseDataText += dataOneline[k] + "\n";
								}
						}
					
					
					
					}
				
				} // end of else

			}

		} catch (Exception e) {

			out.println("지정된 파일을 찾을 수 없습니다.2");
		} finally {
			reader.close();
		}

		System.out.println(IncreaseDataText);

		/*
		
		BufferedWriter writer = null;
		try{
		String filePath = application.getRealPath("/WEB-INF/data/member.txt");
		
		writer = new BufferedWriter(new FileWriter(filePath,true));
		writer.write( member_id + "," + name + "," + pwd + "," + pwd2 + "," + phone1 + "," + phone2 + "," + phone3 + "," + etc5 + "/");
		}catch(Exception e){
		out.print("오류 발생");
		}
		finally{
		writer.close();
		}
		
		*/

		/*
		
		for (int i = 0; i < CheckBoxQuestion.length; i++) {
						int tmp = Integer.parseInt(tmpArray[i]);
						//tmpArray[i] = String.valueOf(tmp + 1);
					}
					for(int i = 0; i < tmpArray.length; i++){
						out.print(tmpArray[i] + " ");
					}
					/*
					for (int i = 0; i < tmpArray.length; i++) {
						if (i == (tmpArray.length - 1)) {
							/* WriterText += tmpArray[i] + "/";
							out.print(tmpArray[i] + "/");
						} //마지막이 아니면
						else {
							out.print(tmpArray[i] + "\\n\\r");
						} //마지막이면 /가 아니라 \n
					} */
	%>

	<%-- <jsp:forward page="endPage.jsp"></jsp:forward> --%>
</body>
</html>