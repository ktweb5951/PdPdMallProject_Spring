<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/member/loginPage.css">
<link rel="stylesheet" href="/resources/css/reset.css">
<title>로그인창</title>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</header>
		<main>
			<section id="loginArea">
				<div id="loginLogo">
					<img src="/resources/images/components/logoimage1.png" alt="로고이미지">
				</div>
				<div id="loginBox">
					<form id="loginForm" action="/member/login.do" method="post">
						<div class="inputClass">
							<input id="memberId" type="text" name="memberId"
								placeholder="아이디를 입력해 주세요." required>
						</div>
						<div class="inputClass">
							<input id="memberPw" type="password" name="memberPw"
								placeholder="비밀번호를 입력해 주세요." required>
						</div>
						<div class="inputClass">
							<label class="formLabel"><input type="radio">자동로그인</label>
						</div>
						<div class="inputClass">
							<input type="submit" id="loginButton" value="로그인"
								style="cursor: pointer">
						</div>
						<div id="formFooter" class="inputClass">
							<div id="signDiv">
								<a class="aFormFooter" href="/member/register.do">회원가입</a>
							</div>
							<div id="findDiv">
								<a class="aFormFooter" href="./findIdPassword.html">아이디 /
									비밀번호 찾기</a>
							</div>
						</div>
					</form>
				</div>
			</section>
			<section id="adArea">
				<div id="adImg">
					<img src="/resources/images/ad/adImage-login.png" alt="광고이미지">
				</div>
			</section>
		</main>
		<footer>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</footer>


	</div>

</body>
</html>