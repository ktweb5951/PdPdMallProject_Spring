<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

    <head>
    	<jsp:include page="/WEB-INF/views/common/asideHead.jsp"></jsp:include>
    	 <link rel="stylesheet" href="../../resources/css/member/modifyMemberInfo.css">
        <title>마이 페이지</title>
    </head>

    <body>
	    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb1cec621a02b6e3c670182d4f972d38&libraries=services"></script>    
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
                <section id="main-content" style="display: flex; justify-content: flex-start;">
		            <div class="member-form">
		                <div class="top">
		                    <img src="../../resources/images/components/logoimage2.png" alt="">
		                    <h2>프로필</h2>
		                </div>
		                <form action="/member/update.do" method="post" id="memberForm">
		                    <ul>
		                        <li>
		                            <label>아이디</label>
		                            <div>
		                                <input type="text" id="memberId" name="memberId" value="${member.memberId}" readonly>
		                            </div>
		                        </li>
		                        <li>
		                            <label>이름</label><input type="text" id="memberName" name="memberName" value="${member.memberName}" readonly >
		                        </li>
		                        <li>
		                            <label>닉네임</label>
		                            <div>
		                                <input type="text" id="memberNickname" name="memberNickname" value="${member.memberNickname}" readonly>
		                            </div>
		                        </li>
		                        <li>
		                            <label>핸드폰번호</label>
		                            <div>
		                                <input type="text" id="memberPhone" name="memberPhone" value="${member.memberPhone}" readonly>
		                            </div>                                 
		                        </li>
		                        <li>
		                            <label>주소</label>
		                            <div>
										<input class="addressClass" type="text" id="memberPostCode" name="memberPostCode" value="${member.memberPostCode}">
										<input class="address" type="text" id="memberAddress" name="memberAddress" value="${member.memberAddress}"><br>
										<input type="text" id="memberDetailAddress" name="memberDetailAddress"value="${member.memberDetailAddress}">
										<button type="button" onclick="sample5_execDaumPostcode()">주소 검색</button><br>
		                            </div> 	
									<div id="map" style="width:300px;height:100px;margin-top:10px;"></div>
		                        </li>
		                        <li>
		                            <label>이메일</label>
		                            <div>
		                           		<input type="text" id="memberEmail" name="memberEmail" value="${member.memberEmail}" readonly>
		                            </div>
		                        </li>
		                    </ul>
		                    <span id="message" class="message"></span>
		                    <div class="form-btn">
		                    </div>
		                </form>
		            </div>
	             </section>

            </main>
            <footer>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
            </footer>
        </div>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };  
		
				       //지도를 미리 생성
				       var map = new daum.maps.Map(mapContainer, mapOption);
				       //주소-좌표 변환 객체를 생성
				       var geocoder = new daum.maps.services.Geocoder();
				       //마커를 미리 생성
				       var marker = new daum.maps.Marker({
				           position: new daum.maps.LatLng(37.537187, 127.005476),
				           map: map
				       });
				
				
				       function sample5_execDaumPostcode() {
				           new daum.Postcode({
				               oncomplete: function(data) {
				                   var addr = data.address; // 최종 주소 변수
				                   var postCode = data.zonecode;
				                   // 주소 정보를 해당 필드에 넣는다.
				                   document.getElementById("memberAddress").value = addr;
				                   document.getElementById("memberPostCode").value = postCode;
				                   // 주소로 상세 정보를 검색
				                   geocoder.addressSearch(data.address, function(results, status) {
				                       // 정상적으로 검색이 완료됐으면
				                       if (status === daum.maps.services.Status.OK) {
				
				                           var result = results[0]; //첫번째 결과의 값을 활용
				
				                           // 해당 주소에 대한 좌표를 받아서
				                           var coords = new daum.maps.LatLng(result.y, result.x);
				                           // 지도를 보여준다.
				                           mapContainer.style.display = "block";
				                           map.relayout();
				                           // 지도 중심을 변경한다.
				                           map.setCenter(coords);
				                           // 마커를 결과값으로 받은 위치로 옮긴다.
				                           marker.setPosition(coords)
				                       }
				                   });
				               }
				           }).open();
				       }
		</script>

    </body>

</html>