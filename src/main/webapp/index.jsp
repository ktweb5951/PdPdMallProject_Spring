<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- 구글폰트 noto sans -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link
			href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
			rel="stylesheet">
		<link rel="stylesheet" href="../resources/css/index.css">
		<link rel="stylesheet" href="../resources/css/reset.css">
<!-- 		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
		<title>메인페이지</title>

	</head>
	<body>

		<div id="container">
			<!-- 헤더 -->
			<header>
					<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
			</header>
			<!-- 메인 -->
			<main>
				<!-- 메인배너 -->
				<section id="mainBanner">
				<div class="carousel">
					<ul class="slide">
						<li><img id="mainBanner1"
							src="/resources/images/components/mainbanner1.png" alt="메인배너">
						</li>
						<li><img id="mainBanner2"
							src="/resources/images/components/mainbanner2.png" alt="메인배너">
						</li>
						<li><img id="mainBanner3"
							src="/resources/images/components/mainbanner3.png" alt="메인배너">
						</li>
					</ul>		
				</div>
					<div class="btn-container">
						<button class="prev-btn" type="button">&#8249;</button>
						<button class="next-btn" type="button">&#8250;</button>
					</div>
			</section>
				<!-- 메인 게시판 -->
				<section id="mainBoard">
					<div id="popularPosts">
						<div class="postHead">
							<h2>👍BEST 게시물</h2>
						</div>
						<div class="posts">
							<div class="leftDiv">
								<a href="/bulletinBoard/post5.html"><img
									src="/resources/images/postPhoto1.png" alt="미리보기이미지"></a>
							</div>
							<div>
								<a href="/bulletinBoard/post5.html">아이폰 14 리얼 후기(60) <span
									class="heart">❤</span>50
								</a> <br>작성자 : 재드래곤 <br>작성일 : 2023-06-07 10:00:00
							</div>
							<div class="rightDiv">
								<a href="/bulletinBoard/post4.html"><img
									src="/resources/images/postPhoto4.png" alt="미리보기이미지"></a>
							</div>
							<div>
								<a href="/html/bulletinBoard/post4.html">난 갤럭시 폴드만 쓴다(50) <span
									class="heart">❤</span>45
								</a> <br>작성자 : 빌게이츠 <br>작성일 : 2023-06-06 12:00:00
							</div>
						</div>
						<div class="posts">
							<div>
								<a href="/bulletinBoard/post1.html"><img
									src="../resources/images/postPhoto6.png" alt="미리보기이미지"></a>
							</div>
							<div class="leftDiv">
								<a href="/bulletinBoard/post1.html">제꺼 폰 상태 어때요???(35) <span
									class="heart">❤</span>40
								</a> <br>작성자 : 감스트 <br>작성일 : 2023-06-06 10:30:00
							</div>
							<div class="rightDiv">
								<a href="/bulletinBoard/post3.html"><img
									src="../resources/images/postPhoto5.png" alt="미리보기이미지"></a>
							</div>
							<div>
								<a href="/bulletinBoard/post3.html">요즘 사기 좋은 폰 뭐있나요?(47) <span
									class="heart">❤</span>30
								</a> <br>작성자 : 고든램지 <br>작성일 : 2023-06-06 11:30:00
							</div>
						</div>
						<!-- 검색창 -->
					</div>
					<div id="customSearch">
						<div id="searchBox">
							<form name="mainSearch" action="#">
								<div id="mainSearch_header">
									<p>내게 맞는 중고폰을 찾는다면?</p>
								</div>
								<div id="mainSearch_search">
									<span> <input type="text"
										placeholder="검색어를 입력하세요(예:아이폰14,G988)">
									</span>
								</div>
							</form>
							<div id="mainSearch_table">
								<table>
									<tbody>
										<tr>
											<td><a href="/market/purchaseSearch-new.html">
													<div>
														<img src="../resources/images/icon/searchicon-new.png"
															alt="">
													</div>
													<div>새제품</div>
											</a></td>
											<td><a href="/market/purchaseSearch-fullBox.html">
													<div>
														<img src="/resources/images/icon/searchicon-fullbox.png"
															alt="">
													</div>
													<div>풀박스</div>
											</a></td>
											<td><a href="#">
													<div>
														<img src="/resources/images/icon/searchicon-rock.png"
															alt="">
													</div>
													<div>자급제</div>
											</a></td>

										</tr>
										<tr>
											<td><a href="#">
													<div>
														<img src="/resources/images/icon/searchicon-samsung.png"
															alt="">
													</div>
													<div>삼성</div>
											</a></td>
											<td><a href="#">
													<div>
														<img src="/resources/images/icon/searchicon-apple.png"
															alt="">
													</div>
													<div>애플</div>
											</a></td>
											<td><a href="#">
													<div>
														<img src="/resources/images/icon/searchicon-etc.png" alt="">
													</div>
													<div>기타제품</div>
											</a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</section>
				<!-- 메인 매물 -->
				<section id="mainSale">
					<h2>
						<span>★</span>실시간 인기 매물
					</h2>
					<div class="list-container">
						<div class="list">
							<div class="list-header">
								<div class="purchaseOption1-2">S급</div>
								<div class="purchaseOption2">풀박스</div>
								<div class="purchaseOption3">직거래</div>
							</div>
							<div class="list-img">
								<a href="/market/purchaseDetailsPage.html"><img
									src="../resources/images/product/subsaleimg1.png" alt="판매이미지"></a>
							</div>
							<div class="list-name">
								<a href="/market/purchaseDetailsPage.html">아이폰14</a>
							</div>
							<div class=list-price>1,150,000원</div>
						</div>
						<div class="list">
							<div class="list-header">
								<div class="purchaseOption1-2">S급</div>
								<div class="purchaseOption2-1">단품</div>
								<div class="purchaseOption4">AS</div>
								<div class="purchaseOption3">직거래</div>
							</div>
							<div class="list-img">
								<a href="/market/purchaseDetailsPage2.html"><img
									src="../resources/images/product/subsaleimgs23u-1.png"
									alt="판매이미지"></a>
							</div>
							<div class="list-name">
								<a href="/market/purchaseDetailsPage2.html">갤럭시S23 Ultra</a>
							</div>
							<div class=list-price>1,190,000원</div>
						</div>
						<div class="list">
							<div class="list-header">
								<div class="purchaseOption1">신품</div>
								<div class="purchaseOption2">풀박스</div>
								<div class="purchaseOption4">AS</div>
								<div class="purchaseOption3">직거래</div>
							</div>
							<div class="list-img">
								<a href="/market/purchaseDetailsPage.html"><img
									src="/resources/images/product/saleImg3.png" alt="판매이미지"></a>
							</div>
							<div class="list-name">
								<a href="/market/purchaseDetailsPage.html">갤럭시S23</a>
							</div>
							<div class=list-price>1,600,000원</div>
						</div>
						<div class="list">
							<div class="list-header">
								<div class="purchaseOption1">신품</div>
								<div class="purchaseOption2">풀박스</div>
								<div class="purchaseOption4">AS</div>
								<div class="purchaseOption3">직거래</div>
							</div>
							<div class="list-img">
								<a href="#"><img src="/resources/images/product/saleImg4.png"
									alt="판매이미지"></a>
							</div>
							<div class="list-name">
								<a href="/market/purchaseDetailsPage.html">아이폰14pro max</a>
							</div>
							<div class=list-price>1,150,000원</div>
						</div>
					</div>
					<h2>
						<span>★</span>실시간 인기 모델
					</h2>
					<div class="list-container">
						<div class="list">
							<div class="list-header">
								<div class="purchaseOption1">애플</div>
							</div>
							<div class="list-img">
								<a href="#"><img
									src="/resources/images/product/popularmodel1.png" alt="판매이미지"></a>
							</div>
							<div class="list-name">
								<a href="#">아이폰14 pro max</a>
							</div>
							<div class=list-price>평균가 1,450,000원</div>
						</div>
						<div class="list">
							<div class="list-header">
								<div class="purchaseOption2">삼성</div>
							</div>
							<div class="list-img">
								<a href="#"><img
									src="/resources/images/product/popularmodel2.png" alt="판매이미지"></a>
							</div>
							<div class="list-name">
								<a href="#">갤럭시s23 Ultra</a>
							</div>
							<div class=list-price>평균가 1,600,000원</div>
						</div>
						<div class="list">
							<div class="list-header">
								<div class="purchaseOption1">애플</div>
							</div>
							<div class="list-img">
								<a href="#"><img
									src="/resources/images/product/popularmodel3.png" alt="판매이미지"></a>
							</div>
							<div class="list-name">
								<a href="#">아이폰14</a>
							</div>
							<div class=list-price>평균가 1,100,000원</div>
						</div>
						<div class="list">
							<div class="list-header">
								<div class="purchaseOption2">삼성</div>
							</div>
							<div class="list-img">
								<a href="#"><img
									src="/resources/images/product/popularmodel4.png" alt="판매이미지"></a>
							</div>
							<div class="list-name">
								<a href="#">갤럭시s23+</a>
							</div>
							<div class=list-price>1,150,000원</div>
						</div>
					</div>
					<h2>
						<span>★</span> 실시간 등록 매물
					</h2>
					<div class="list-container">
						<div class="list">
							<div class="list-header">
								<div class="purchaseOption1-2">S급</div>
								<div class="purchaseOption2">풀박스</div>
								<div class="purchaseOption3">직거래</div>
							</div>
							<div class="list-img">
								<a href="/purchaseDetailsPage.html"><img
									src="/resources/images/product/saleImg.jpg" alt="판매이미지"></a>
							</div>
							<div class="list-name">
								<a href="/purchaseDetailsPage.html">아이폰14</a>
							</div>
							<div class=list-price>1,150,000원</div>
						</div>
						<div class="list">
							<div class="list-header">
								<div class="purchaseOption1">신품</div>
								<div class="purchaseOption2-1">단품</div>
								<div class="purchaseOption4">AS</div>
								<div class="purchaseOption3">직거래</div>
							</div>
							<div class="list-img">
								<a href="/purchaseDetailsPage.html"><img
									src="/resources/images/product/saleImg2.png" alt="판매이미지"></a>
							</div>
							<div class="list-name">
								<a href="/purchaseDetailsPage.html">갤럭시S23 Ultra</a>
							</div>
							<div class=list-price>1,250,000원</div>
						</div>
						<div class="list">
							<div class="list-header">
								<div class="purchaseOption1">신품</div>
								<div class="purchaseOption2">풀박스</div>
								<div class="purchaseOption4">AS</div>
								<div class="purchaseOption3">직거래</div>
							</div>
							<div class="list-img">
								<a href="/purchaseDetailsPage.html"><img
									src="/resources/images/product/saleImg3.png" alt="판매이미지"></a>
							</div>
							<div class="list-name">
								<a href="/purchaseDetailsPage.html">갤럭시S23</a>
							</div>
							<div class=list-price>1,600,000원</div>
						</div>
						<div class="list">
							<div class="list-header">
								<div class="purchaseOption1">신품</div>
								<div class="purchaseOption2">풀박스</div>
								<div class="purchaseOption4">AS</div>
								<div class="purchaseOption3">직거래</div>
							</div>
							<div class="list-img">
								<a href="/purchaseDetailsPage.html"> <img
									src="/resources/images/product/saleImg4.png" alt="판매이미지"></a>
							</div>
							<div class="list-name">
								<a href="/purchaseDetailsPage.html">아이폰14pro max</a>
							</div>
							<div class=list-price>1,150,000원</div>
						</div>
					</div>
				</section>
			</main>

			<!-- 푸터영역 -->
			<footer>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</footer>
		</div>


		<!-- 스크립트 -->
		<script>
			document.addEventListener("DOMContentLoaded", function() {
			    const slides = document.querySelectorAll(".slide img");
			    const prevBtn = document.querySelectorAll(".prev-btn")[0];
			    const nextBtn = document.querySelectorAll(".next-btn")[0];
			    let currentIndex = 0;
			
			    function showSlide(index) {
			        for (let i = 0; i < slides.length; i++) {
			            slides[i].style.display = "none";
			        }
			        slides[index].style.display = "block";
			    }
			
			    function goToNextSlide() {
			        currentIndex = (currentIndex + 1) % slides.length;
			        showSlide(currentIndex);
			    }
			
			    function goToPrevSlide() {
			        currentIndex = (currentIndex - 1 + slides.length) % slides.length;
			        showSlide(currentIndex);
			    }
			
			    prevBtn.addEventListener("click", goToPrevSlide);
			    nextBtn.addEventListener("click", goToNextSlide);
			
			    showSlide(currentIndex);
			    setInterval(goToNextSlide, 5000);
			});

//         $(document).ready(function() {
//             const slides = $(".slide img");
//             const prevBtn = $(".prev-btn");
//             const nextBtn = $(".next-btn");
//             let currentIndex = 0;
//             function showSlide(index) {
//               slides.fadeOut(1000);
//               slides.eq(index).fadeIn(1000);
//             }
//             function goToNextSlide() {
//               currentIndex = (currentIndex + 1) % slides.length;
//               showSlide(currentIndex);
//             }
//             function goToPrevSlide() {
//               currentIndex = (currentIndex - 1 + slides.length) % slides.length;
//               showSlide(currentIndex);
//             }
//             prevBtn.click(goToPrevSlide);
//             nextBtn.click(goToNextSlide);
//             showSlide(currentIndex);
//             setInterval(goToNextSlide, 5000);
//           });
		</script>
	</body>
</html>