<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 목록</title>
</head>
<body>	
	<h1>[게시판 목록]</h1>
<form action="list" name="frm">
	<select name="key">
		<option value="title"<c:out value="${param.key=='title'?'selected':''}"/>>제목</option>
		<option value="content" <c:out value="${param.key=='content'?'selected':''}"/>>내용</option>
	</select>
	<input type="text" name="word" value="${word}">
	<input type="submit" value="검색">   
	<input type="text" name="start" value="${start}">
	검색:${total}건 
</form>                                                                                                                                                                 
	<table border=1 width=700>
		<tr>
			<td>NO.</td>
			<td>TITLE.</td>
			<td>WDATE.</td>
		</tr>
	<c:forEach items="${list}" var="vo">
		<tr>
			<td>${vo.id}</td>
			<td>${vo.title}</td>
			<td><fmt:formatDate value="${vo.wdate}" pattern="yyyy-MM-dd kk:mm:ss"/></td>
		</tr>
	</c:forEach>
	</table>
	<button onClick="funPre()">이전</button>
	<button onClick="funNext()">다음</button>
	
</body>
	<script>
		var start =parseInt(frm.start.value);
		var total=${total};
		
		function funNext(){
			if(start+10 < total){
				start=start+10;
				frm.start.value=start;
				frm.submit();	
			}
			
		}
		function funPre(){
			if(start > 1){
				start=start-10;
				frm.start.value=start;
				frm.submit();
			}
			
		}
	</script>
</html>