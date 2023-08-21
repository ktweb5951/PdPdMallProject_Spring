<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" >
	<link
		href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
		rel="stylesheet">
	<link rel="stylesheet" href="../../resources/css/reset.css">
	<link rel="stylesheet"
		href="../../resources/css/bulletinBoard/freeBoard.css">
	<title>자유 게시판</title>
	</head>
	<body>
		<div id="container">
			<header>
				<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
			</header>
			<main>
				<section id="top">
					<img src="../../resources/images/components/logoimage2.png" alt="">
					<h1>자유 게시판</h1>
				</section>
				<section id="mid">
					<table>
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>추천수</th>
								<th>작성날짜 및 시간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="freeBoard" items="${requestScope.fList}">
								<tr>
									<td>${freeBoard.freeBoardNo }</td>
									<td><a href="/bulletinBoard/freeBoard/detail.do?freeBoardNo=${freeBoard.freeBoardNo}">${freeBoard.freeBoardTitle}</a></td>
									<td>${freeBoard.freeBoardWriter }</td>
									<td>${freeBoard.viewCount }</td>
									<td>${freeBoard.rcmndCount }</td>
									<td>
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${freeBoard.freeBoardDate}" />
									</td>
								</tr>
							</c:forEach>
						</tbody>
		
					</table>
				</section>
				<section id="pageNavi">
						<c:if test="${pInfo.startNavi ne 1}">
							<c:url var="pageUrl" value="/bulletinBoard/freeBoard/search.do">
								<c:param name="page" value="${pInfo.startNavi-1}"></c:param>
  								<c:param name="searchCondition" value="${searchCondition}"/>
      							<c:param name="searchKeyword" value="${searchKeyword}"/>									
							</c:url>
							<a href="${pageUrl }"><</a>
<!-- 							&nbsp; -->
						</c:if>				
						<c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi }" var="p">
							<c:url var="pageUrl" value="/bulletinBoard/freeBoard/search.do">							
								<c:param name="page" value="${p }"></c:param>
  								<c:param name="searchCondition" value="${searchCondition}"/>
      							<c:param name="searchKeyword" value="${searchKeyword}"/>										
							</c:url>
							<a href="${pageUrl }">${p }</a>		
						</c:forEach>
						<c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }"> 
							<c:url var="pageUrl" value="/bulletinBoard/freeBoard/search.do">
								<c:param name="page" value="${pInfo.endNavi+1}"></c:param>
  								<c:param name="searchCondition" value="${searchCondition}"/>
      							<c:param name="searchKeyword" value="${searchKeyword}"/>									
							</c:url>
							<a href="${pageUrl }">></a>
						</c:if>									
				</section>
				<section id="btnArea">
					<div>
						<form action="/bulletinBoard/freeBoard/search.do" method="GET">
							<select name="searchCondition">
								<option value="all" <c:if test="${searchCondition =='all'}">selected</c:if>>전체</option>
								<option value="writer" <c:if test="${searchCondition =='writer'}">selected</c:if>>작성자</option>
								<option value="title" <c:if test="${searchCondition =='title'}">selected</c:if>>제목</option>
								<option value="content" <c:if test="${searchCondition =='content'}">selected</c:if>>내용</option>
							</select>
							<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요" value="${searchKeyword}" style="witdh:150px;height:30px">					
							<input type="submit" class="write-btn" value="검색">
						</form>
					</div>
					<div>  
					<% 			      
				      if (session.getAttribute("memberId") != null) { %>
				              <a class="write-btn" href="/bulletinBoard/freeBoard/insert.do">글작성</a>
				      <% } else { %>
							<a id="write-btn" class="write-btn" href="/member/login.do">글작성</a>
								
				       <% } %>
						
					</div>
				</section>
			</main>
			<footer>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</footer>
		</div>
		<script>
		    document.addEventListener("DOMContentLoaded", function() {
		        const writeBtn = document.getElementById("write-btn");
		
		        writeBtn.addEventListener("click", function(event) {
		            if (!<%= session.getAttribute("memberId") != null %>) {
		                event.preventDefault(); 
		                alert("로그인 후에 글 작성이 가능합니다.");
		                window.location.href = "/member/login.do"; // 로그인 페이지로 이동
		            }
		        });
		    });
		</script>
		
	
	</body>
</html>