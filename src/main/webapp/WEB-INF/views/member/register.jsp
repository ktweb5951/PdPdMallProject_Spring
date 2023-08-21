<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../../resources/css/member/register.css">
        <link rel="stylesheet" href="../../resources/css/reset.css">
        <title>회원가입 페이지</title>
    </head>
    <body>
    	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb1cec621a02b6e3c670182d4f972d38&libraries=services"></script>
        <script>
            document.addEventListener("DOMContentLoaded", () => {          


                document.querySelector("form").addEventListener("submit", (e)=>{
                    // 화면출력
                    const msgTag = document.querySelector("#message");
                    msgTag.style.color= "red";
                    msgTag.style.fontWeight = "bolder";

                    const userId = document.querySelector("#memberId").value;
                    const userPw = document.querySelector("#memberPw").value;
                    const pwCheck = document.querySelector("#pw-re").value;
                    const userName = document.querySelector("#member-name").value;
                    const userNickName = document.querySelector("#member-nickname").value;
                    const address = document.querySelector("#member-address").value;
                    const email = document.querySelector("#member-email").value;
                    const telPhone = document.querySelector("#member-phone").value;
                    
                    const idRegExp = /^[a-z]\w{3,11}$/g;
                    const pwRegExp = /^[a-zA-Z0-9]{6,14}$/g;
                    const nameRegExp = /^[가-힣]+$/g;   
                    const nickNamRegExp = /^[a-zA-Z가-힣]{1,12}$/g;   
                    const addrRegExp = /[^a-zA-Z/s]+$/gm;
                    const postNumRegExp = /^[0-9]+$/g;
                    const emailRegExp = /^[a-zA-Z0-9]{4,12}@[a-z]+\.[a-z]{3}/g;
                    const telRegExp = /^[0-9]+$/g;

                    if(!idRegExp.test(userId)){
                        e.preventDefault();
                        msgTag.innerText = "아이디는 영어소문자,숫자만 입력 가능합니다.";   
                    } else if(!pwRegExp.test(userPw)){
                        e.preventDefault();
                        msgTag.innerText = "비밀번호는 영어소문자,대문자,숫자만 입력가능합니다.";
                    } else if(userPw !== pwCheck){
                        e.preventDefault();
                        msgTag.innerText = "비밀번호가 일치하지 않습니다.";
                    } else if(!nameRegExp.test(userName)){
                        e.preventDefault();
                        msgTag.innerText = "이름은 무조건 한글만 입력 가능합니다.";
                    } else if(!nickNamRegExp.test(userNickName)){
                        e.preventDefault();
                        msgTag.innerText = "닉네임은 한글,영어만 입력 가능합니다.";
                    } else if(!telRegExp.test(telPhone)){
                        e.preventDefault();
                        msgTag.innerText = "전화번호는 숫자만 입력 가능합니다. ";  
                    }  else if(!addrRegExp.test(address)){
                        e.preventDefault();
                        msgTag.innerText = "주소에는 영어 사용 불가(공백 불가)";  
                    } else if(!emailRegExp.test(email)){
                        e.preventDefault();
                        msgTag.innerText = "이메일은 @가 포함 되어야 합니다. ";
                    } 
                });

                document.querySelector(".certifiedBtn").addEventListener("click", ()=>{
                    alert("인증번호를 발송했습니다.");
                });
            });

            function validityBtn() {
                if(document.querySelector("#user-id").value!==""){
                    alert("사용가능합니다.");
                }
            }

            function addrSearch() {
                const addrVal = prompt("주소를 입력하세요.");
                const inputAddr = document.querySelector("#addr");
                inputAddr.value = addrVal;
            }



        </script>        
        <div id="container">
            <header>
    			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
            </header>
            <main>
                <div class="member-form">
                    <div class="top">
                        <img src="/resources/images/components/logoimage2.png" alt="">
                        <h2>회원가입</h2>
                    </div>
                    <form action="/member/register.do" method="post" id="memberForm">
                            <ul>
                                <li>
                                    <label>아이디</label>
                                    <div>
                                    <input type="text" id="memberId" name="memberId">
                                        <button onclick="validityBtn();">중복확인</button>
                                    </div>
                                </li>
                                <li>
                                    <label>비밀번호</label>
                                    <input type="password" id="memberPw" name="memberPw">
                                </li>
                                <li>
                                    <label>비밀번호 확인</label><input type="password" id="pw-re" name="pw-re">
                                </li>
                                <li>
                                    <label>이름</label><input type="text" id="memberName" name="memberName">
                                </li>
                                <li>
                                    <label>닉네임</label>
                                    <div>
                                        <input type="text" id="memberNickname" name="memberNickname">
                                        <button onclick="validityBtn();">중복확인</button>
                                    </div>
                                </li>
                                <li>
                                    <label>핸드폰번호</label>
                                    <div>
                                        <input type="text" id="memberPhone"  name="memberPhone" placeholder="'-'없이 입력">
                                        <button class="certifiedBtn">인증받기</button>
                                    </div>                                 
                                    <div>
                                        <input type="text" id="tel-certified" placeholder="인증번호를 입력하세요">
                                    </div>
                                </li>
                                <li>
                                   <label>주소</label>
		                            <div>
										<input class="addressClass" type="text" id="memberPostCode" name="memberPostCode" placeholder="우편번호">
										<input type="text" id="memberAddress" name="memberAddress" placeholder="주소"><br>
										<input type="text" id="memberDetailAddress" name="memberDetailAddress" placeholder="상세주소">
										<button type="button" onclick="sample5_execDaumPostcode()">주소 검색</button><br>
		                            </div>
									<div id="map" style="width:300px;height:100px;margin-top:10px;"></div>
                                </li>
                                <li>
                                    <label>이메일</label><input type="text" id="memberEmail" name="memberEmail"><br>
                                </li>
                            </ul>
                            <span id="message" class="message"></span>
                            <div class="form-btn">
                                <input type="submit" value="회원가입" style="cursor:pointer">
    
                            </div>
                    </form>
                </div>
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