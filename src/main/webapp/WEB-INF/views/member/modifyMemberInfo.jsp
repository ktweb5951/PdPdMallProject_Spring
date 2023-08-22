<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	   	<jsp:include page="/WEB-INF/views/common/asideHead.jsp"></jsp:include>
	   	 <link rel="stylesheet" href="../../resources/css/member/modifyMemberInfo.css">
	    <title>회원 정보 수정</title>
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
	            <section>
		            <div class="member-form">
		                <div class="top">
		                    <img src="../../resources/images/components/logoimage2.png" alt="">
		                    <h2>회원 정보 수정</h2>
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
		                            <label>비밀번호</label>
		                            <input type="password" id="memberPw" name="memberPw" placeholder="새 비밀번호 입력" style="border-color:skyblue;" />
		                        </li>
		                        <li>
		                            <label>비밀번호 확인</label><input type="password" id="pw-re" placeholder="새 비밀번호 확인" style="border-color:skyblue;">
		                        </li>
		                        <li>
		                            <label>이름</label><input type="text" id="memberName" name="memberName" value="${member.memberName}" readonly >
		                        </li>
		                        <li>
		                            <label>닉네임</label>
		                            <div>
		                                <input type="text" id="memberNickname" name="memberNickname"  value="${member.memberNickname}" style="border-color:skyblue;">
		                                <button onclick="validityBtn();">중복확인</button>
		                            </div>
		                        </li>
		                        <li>
		                            <label>핸드폰번호</label>
		                            <div>
		                                <input type="text" id="memberPhone" name="memberPhone" value="${member.memberPhone}" style="border-color:skyblue;">
		                                <button class="certifiedBtn">인증받기</button>
		                            </div>                                 
		                            <div>
		                                <input type="text" id="tel-certified" placeholder="인증번호를 입력하세요">
		                            </div>
		                        </li>
		                        <li>
		                            <label>주소</label>
		                            <div>
										<input class="addressClass" type="text" id="memberPostCode" name="memberPostCode" placeholder="우편번호" value="${member.memberPostCode}" style="border-color:skyblue;">
										<input class="address" type="text" id="memberAddress" name="memberAddress" value="${member.memberAddress}" style="border-color:skyblue;"><br>
										<input type="text" id="memberDetailAddress" name="memberDetailAddress" placeholder="상세주소" value="${member.memberDetailAddress}" style="border-color:skyblue;">
										<button type="button" onclick="sample5_execDaumPostcode()">주소 검색</button><br>
		                            </div> 	
									<div id="map" style="width:300px;height:100px;margin-top:10px;"></div>
                                </li>
		                        <li>
		                            <label>이메일</label><input type="text" id="memberEmail" name="memberEmail" value="${member.memberEmail}" style="border-color:skyblue;">
		                        </li>
		                    </ul>
		                    <span id="message" class="message"></span>
		                    <div class="form-btn">
		                        <input type="submit" value="수정 완료" style="cursor:pointer">
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
				       
						document.addEventListener("DOMContentLoaded", () => {
						    const msgTag = document.querySelector("#message");
						    const userId = document.querySelector("#memberId");
						    const userPw = document.querySelector("#memberPw");
						    const pwCheck = document.querySelector("#pw-re");
						    const userName = document.querySelector("#memberName");
						    const userNickName = document.querySelector("#memberNickname");
						    const address = document.querySelector("#memberAddress");
						    const email = document.querySelector("#memberEmail");
						    const telPhone = document.querySelector("#memberPhone");
						    const certifyButton = document.querySelector("#certifyButton");
						
						    const idRegExp = /^[a-z]\w{3,11}$/;
						    const pwRegExp = /^[a-zA-Z0-9]{6,14}$/;
						    const nameRegExp = /^[가-힣]+$/;
						    const nickNameRegExp = /^[a-zA-Z가-힣]{1,12}$/;
						    const addrRegExp = /^[a-zA-Z\s]+$/; 
						    const postNumRegExp = /^[0-9]+$/;
						    const emailRegExp = /^[a-zA-Z0-9]{4,12}@[a-z]+\.[a-z]{2,3}$/; 
						    const telRegExp = /^\d{9,11}$/; 
						

						    userId.addEventListener("input", () => {
						        const userIdValue = userId.value.trim();
						        if (!idRegExp.test(userIdValue)) {
						            showError("아이디는 영어 소문자, 숫자만 입력 가능합니다.");
						        } else {
						            clearError();
						        }
						    });
						

						    userPw.addEventListener("input", () => {
						        const userPwValue = userPw.value.trim();
						        if (!pwRegExp.test(userPwValue)) {
						            showError("비밀번호는 영어 대/소문자, 숫자만 포함하여 6~14자여야 합니다.");
						        } else {
						            clearError();
						        }
						    });
						

						    pwCheck.addEventListener("input", () => {
						        if (userPw.value !== pwCheck.value) {
						            showError("비밀번호가 일치하지 않습니다.");
						        } else {
						            clearError();
						        }
						    });
						

						    userName.addEventListener("input", () => {
						        const userNameValue = userName.value.trim();
						        if (!nameRegExp.test(userNameValue)) {
						            showError("이름은 한글로만 입력 가능합니다.");
						        } else {
						            clearError();
						        }
						    });
						

						    userNickName.addEventListener("input", () => {
						        const userNickNameValue = userNickName.value.trim();
						        if (!nickNameRegExp.test(userNickNameValue)) {
						            showError("닉네임은 한글 또는 영어로 1~12자로 입력 가능합니다.");
						        } else {
						            clearError();
						        }
						    });
						

						    address.addEventListener("input", () => {
						        const addressValue = address.value.trim();
						        if (!addrRegExp.test(addressValue)) {
						            showError("주소는 영어 대/소문자만 입력 가능합니다.");
						        } else {
						            clearError();
						        }
						    });
						

						    email.addEventListener("input", () => {
						        const emailValue = email.value.trim();
						        if (!emailRegExp.test(emailValue)) {
						            showError("유효한 이메일 형식이 아닙니다.");
						        } else {
						            clearError();
						        }
						    });
						

						    telPhone.addEventListener("input", () => {
						        const telPhoneValue = telPhone.value.trim();
						        if (!telRegExp.test(telPhoneValue)) {
						            showError("전화번호는 9~11자의 숫자로 입력해야 합니다.");
						            certifyButton.setAttribute("disabled", "disabled"); // 버튼 비활성화
						        } else {
						            clearError();
						            certifyButton.removeAttribute("disabled"); // 버튼 활성화
						        }
						    });
						    
						    certifyButton.addEventListener("click", (event) => {
						        const telPhoneValue = telPhone.value.trim();
						        if (!telRegExp.test(telPhoneValue)) {
						            event.preventDefault(); 
						            alert("핸드폰 번호를 확인해주세요.");
						        } else {
						            alert("인증 메시지가 발송되었습니다.");
						            // 여기에 인증받기 로직 추가
						        }
						    });
						
						    function showError(errorMessage) {
						        msgTag.style.color = "red";
						        msgTag.style.fontWeight = "bolder";
						        msgTag.style.fontSize = "10px";
						        msgTag.innerText = errorMessage;
						    }
						

						    function clearError() {
						        msgTag.innerText = "";
						    }
						    
						    pwCheck.addEventListener("input", () => {
						        if (userPw.value !== pwCheck.value) {
						            showError("비밀번호가 일치하지 않습니다.");
						            pwCheck.style.borderColor = "red"; 
						        } else {
						        	msgTag.style.color = "blue";
						        	showError("비밀번호가 일치합니다.");
						            pwCheck.style.borderColor = "blue";
						        }
						    });
						    
						    function isPhoneNumberValid() {
						        const telPhoneValue = telPhone.value.trim();
						        return telRegExp.test(telPhoneValue);
						    }

						});
	    </script>
	</body>
</html>
