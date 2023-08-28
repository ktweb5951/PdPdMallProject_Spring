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
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link
			href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
			rel="stylesheet">
		<link rel="stylesheet" href="../../resources/css/bulletinBoard/post.css">
		<link rel="stylesheet" href="../../resources/css/reset.css">
	<title>자유게시판 게시물</title>
	</head>
	<scipt>
	
	</scipt>
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
					<c:if test="${sessionScope.memberId ne null}">
						<button onclick="toggleReplyForm()">댓글작성</button>
					</c:if>
					<span style="float: right"> <a
						href="javascript:void(0)" onclick="updateCheck();"><button>수정하기</button></a>
						<a href="javascript:void(0)" onclick="deleteCheck();"><button>삭제하기</button></a>
						<%-- 			<a href="/bulletinBoard/freeBoard/delete.do?freeBoardNo=${freeBoard.freeBoardNo}"><button>삭제하기</button></a> --%>
					</span>
				</div>
	<!-- 			댓글등록 -->
				<form action="/reply/add.do" method="post" id="reply-form" style="display:none;">
					<input type="hidden" name="refBoardNo" value="${freeBoard.freeBoardNo }">
					<table width="500" border="1" >
						<tr>
							<td>
								댓글작성
							</td>
							<td>
								<textarea rows="3" cols="55" name="replyContent"></textarea>
							</td>
							<td>
								<input type="submit" value="완료">
							</td>
						</tr>
					</table>
				</form>
	<!-- 			댓글등록 -->
				<table id="reply-table">
					<colgroup>
						<col width=10% />
						<col width=40% />
						<col width=20%  />
						<col width=20% />
					</colgroup>
					<tr>
						<th>작성자</th>
						<th>댓글내용</th>
						<th>작성시간</th>
					</tr>
					<c:forEach var="reply" items="${rList }">
					<tr>
						<td>${reply.replyWriter}</td>
						<td>${reply.replyContent}</td>
						<td>
						<fmt:formatDate
								pattern="yyyy-MM-dd HH:mm:ss" value="${reply.rCreateDate}" />
						</td>
						<c:if test="${sessionScope.memberName eq reply.replyWriter}">
						<td>
							<a href="javascript:void(0)" onclick="showModifyForm(this);">수정하기</a>
							<a href="javascript:void(0);" onclick="deleteReply();">삭제하기</a>
						</td>
						</c:if>
					</tr>
					<tr id="replyModifyForm" style="display:none">
							<td colspan="3"><input id="replyContent" type="text" size="50" name="replyContent" value="${reply.replyContent }"></td>
							<td><input type="button" value="완료" onclick="replyModify(this, '${reply.replyNo}', '${reply.refBoardNo }');"></td>					
					</tr>
					</c:forEach>
				</table>
		</div>
		</main>
	<!-- 	<footer> -->
	<%-- 		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>
	<!-- 	</footer> -->
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
	
			function showModifyForm(obj){
				obj.parentElement.parentElement.nextElementSibling.style.display="";
			}
			
			function replyModify(obj,replyNo, refBoardNo){
				const form = document.createElement("form");
				form.action = "/reply/update.do";
				form.method = "post";
				const input = document.createElement("input");
				input.type = "hidden";
				input.value = replyNo;
				input.name = "replyNo";
				const input2 = document.createElement("input");
				input2.type = "hidden";
				input2.value= refBoardNo;
				input2.name = "refBoardNo";
				const input3 = document.createElement("input");
				input3.type = "text";
				//this를 이용해서 내가 원하는 노드 찾기(this를 이용한 노드 탐색)
				input3.value = obj.parentElement.previousElementSibling.childNodes[0].value;
				input3.name = "replyContent";
				form.appendChild(input);	
				form.appendChild(input2);
				form.appendChild(input3);
				document.body.appendChild(form);
				form.submit();
			}	
			
		    function toggleReplyForm() {
		        const replyForm = document.getElementById("reply-form");
		        if (replyForm.style.display === "none") {
		            replyForm.style.display = "block";
		        } else {
		            replyForm.style.display = "none";
		        }
		    }
	    </script>
	</body>
</html>
