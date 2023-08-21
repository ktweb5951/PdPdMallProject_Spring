<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="/WEB-INF/views/common/asideHead.jsp"></jsp:include>
<title>회원탈퇴</title>
<style>
#main-content {
	flex: 1;
	padding: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

/* Withdraw form styles */
#withdraw-form {
	text-align: center;
}

#withdraw-text {
	font-size: 24px;
	margin-bottom: 20px;
}

#withdraw-button {
	padding: 10px 20px;
	background-color: #ff6347;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

#withdraw-button:hover {
	background-color: #ff4433;
}
</style>
</head>

<body>
	<div id="container">
		<header>
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</header>
		<main>
			<aside>
				<h1>마이페이지</h1>
                    <ul class="myPage">
                        <li><a href="/member/myInfo.do?memberId=${memberId}">프로필</a></li>
                        <li><a href="#" onclick="loadPage('거래내역.html')">거래내역</a></li>
                        <li><a href="/member/update.do?memberId=${memberId}">회원정보수정</a></li>
                        <li><a href="/member/withdraw.do?memberId=${memberId}">회원탈퇴</a></li>
                    </ul>
			</aside>
			<section id="main-content">
				<!-- 회원탈퇴 페이지 내용 -->
				<h2 id="withdraw-text">${memberId}님 정말로 회원탈퇴를 하시겠습니까?</h2>
				<form id="withdraw-form" action="/member/withdraw.do" method="post">
					<input type="hidden" name ="memberId" value="${memberId}">
					<input type="submit" id="withdraw-button" value="회원탈퇴">
				</form>
			</section>
		</main>
		<footer>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</footer>
	</div>

	<script>
		// loadPage 함수 등 필요한 JavaScript 코드 추가
		// ...
	</script>
</body>

</html>
