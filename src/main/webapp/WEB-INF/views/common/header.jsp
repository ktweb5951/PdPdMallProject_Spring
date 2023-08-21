<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/components/header.css">
<link rel="stylesheet" href="/resources/css/reset.css">
<title>헤더</title>
</head>
<body>
	<header>
		<!-- 로고 -->
		<div id="headerLogo">
			<a href="/index.jsp"> <img id="logoImg"
				src="/resources/images/components/mainlogo.png" alt="메인로고"></a>
		</div>
		<!-- 메뉴(네비게이터) -->
		<nav id="headerNav">
			<ul class="navMenu">
				<li><a href="#">중고거래</a>
					<div>
						<ul class="tradingMenu">
							<li><a href="/market/purchasePage.html">구매하기</a></li>
							<li><a href="/market/salesPage.html">판매하기</a></li>
							<li><a href="#">견적보기</a></li>
						</ul>
					</div></li>
				<li><a href="#">중고시세</a>
					<div>
						<ul class="priceMenu">
							<li><a href="/market/marketPricePage.html">오늘의 시세</a></li>
							<li><a href="#">신품 시세</a></li>
						</ul>
					</div></li>
				<li><a href="#">게시판</a>
					<div>
						<ul class="bulletinBoardMenu">
							<li><a href="/bulletinBoard/hotDealBoard.html">핫딜 게시판</a></li>
							<li><a href="/bulletinBoard/newsBoard.html">소식 게시판</a></li>
							<li><a href="/bulletinBoard/freeBoard/list.do?currentPage=1">자유 게시판</a></li>
						</ul>
					</div></li>
			</ul>
		</nav>
		<!-- 회원정보영역 -->
		<div id="headeritem">
			<!-- 검색영역 -->
			<div id="headerSearch">
				<input type="text" id="searchText1"> <a href="#"><img
					id="searchButton" src="/resources/images/components/searchicon.png"
					alt="검색버튼"></a>
			</div>
			<!-- 로그인영역 -->
			<div id="headerLogin">
				<%
				if (session.getAttribute("memberId") != null) {
				%>
				<form action="/member/logout.do" method="get">
					<input id="btnLogout" type="submit" value="logout">
				</form>
				<%
				} else {
				%>
				<button id="btnLogin"
					onclick="location.href='/member/login.do'">login</button>
				<%
				}
				%>
			</div>
			<!-- 프로필영역 -->
			<div id="headerProfile">
				 <% if (session.getAttribute("memberId") != null) { %>
				<a id="profileIconLink" href="#"><img id="profileIcon" src="/resources/images/components/loginProfile.png" alt="프로필"></a>
				 <% } else { %>
				<a id="profileIconLink" href="#"><img id="profileIcon" src="/resources/images/components/profileicon.png" alt="프로필"></a>
				 <% } %>
				<ul>
					<li>
						
					
				      <% 			      
				      if (session.getAttribute("memberId") != null) { %>
				                <div id="loginDiv">
				                    <%-- 로그인 상태일 때 마이페이지로 이동하는 링크 추가 --%>
				                     반갑습니다 <%= session.getAttribute("memberId") %>님 <a href="/member/myInfo.do?memberId=<%= session.getAttribute("memberId") %>"><br>[마이페이지]</a>
<%-- 				                    반갑습니다 ${member.memberId}<a href="/member/myInfo.do?memberId=${member.memberId}">[마이페이지]</a> --%>
				                    <form action="/member/logout.do" method="get">
<!-- 				                        <input id="btnLogout" type="submit" value="logout"> -->
				                    </form>
				                </div>
				      <% } else { %>
				                <div id="loginDiv">
				                    로그인후 이용가능한 서비스입니다. <a href="/member/login.do">[로그인]</a>
				                </div>
				       <% } %>
					</li>
				</ul>

			</div>
		</div>
		<!-- <div id="margin2">
                
            </div> -->
	</header>
	<script>
		// 프로필 클릭
		document.querySelector("#profileIcon").addEventListener("click",
				function() {
					const clickCheck = document.querySelector("#loginDiv")
					if (clickCheck.style.display === "none") {
						clickCheck.style.display = "block";
					} else {
						clickCheck.style.display = "none";
					}
				});
	</script>
</body>
</html>