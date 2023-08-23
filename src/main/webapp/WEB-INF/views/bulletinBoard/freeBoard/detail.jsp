<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../../resources/css/bulletinBoard/post.css">
<link rel="stylesheet" href="../../resources/css/reset.css">
<title>자유게시판 게시물</title>
</head>

<body>
	<div id="container">
		<header>
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</header>
		<main>
			<div class="top">
				<img src="../../resources/images/components/logoimage2.png" alt="로고">
				<h2>자유 게시판</h2>
			</div>
			<div class="post-container">
				<h2 class="post-title">
					<span><h2>${freeBoard.freeBoardTitle}</h2></span>
				</h2>
				<!--             <p class="post-details">작성자: 감스트 | 작성시간: 2023-06-06 10:30:00</p> -->
				<p class="post-details">
					<span>글번호 : ${freeBoard.freeBoardNo} | 작성자 :
						${freeBoard.freeBoardWriter} | 작성 시간 : <fmt:formatDate
							pattern="yyyy-MM-dd HH:mm:ss" value="${freeBoard.freeBoardDate}" />
					</span>
				</p>
				<div class="post-content">
					<c:if test="${freeBoard.freeBoardFilename != '' || freeBoard.freeBoardFilename ne null}">
						<img src="/resources/nuploadFiles/${freeBoard.freeBoardFileRename}"
						alt="포스트이미지"><br> 
						<a href="../resources/nuploadFiles/${freeBoard.freeBoardFileRename }" download>${freeBoard.freeBoardFileRename }</a>
					</c:if>
						<br>
						<span>${freeBoard.freeBoardContent}</span>
				</div>
			</div>
			<div class="bottom">
				<p>
					추천 수 <span id="recommendCount">40</span>
				</p>
				<button class="recommend-button" onclick="incrementRecommendCount()">추천하기</button>
				<a href="/bulletinBoard/freeBoard/list.do?currentPage=1"><button>글목록</button></a>
				<span style="float: right"> <a
					href="javascript:void(0)" onclick="updateCheck();"><button>수정하기</button></a>
					<a href="javascript:void(0)" onclick="deleteCheck();"><button>삭제하기</button></a>
					<%-- 			<a href="/bulletinBoard/freeBoard/delete.do?freeBoardNo=${freeBoard.freeBoardNo}"><button>삭제하기</button></a> --%>
				</span>
			</div>
	</div>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</footer>
	<script>

	const deleteCheck= () => {
		const freeBoardNo = '${freeBoard.freeBoardNo}';
		if(confirm("정말 삭제하시겠습니까?")){
			location.href ="/bulletinBoard/freeBoard/delete.do?freeBoardNo="+freeBoardNo;
		}
	}
	
	const updateCheck= () => {
		const freeBoardNo = '${freeBoard.freeBoardNo}';
		if(confirm("게시글을 수정하시겠습니까?")){
			location.href ="/bulletinBoard/freeBoard/update.do?freeBoardNo="+freeBoardNo;
		}
	}
    </script>
</body>
</html>
