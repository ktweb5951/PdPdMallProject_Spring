<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/resources/css/member/loginPage.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
        <title>로그인창</title>
    </head>
    <body>
        <div id="container">
            <header>
            </header>
            <main>
                <section id="loginArea">
                    <div id="loginLogo">
                        <img src="/resources/images/components/logoimage1.png" alt="로고이미지">
                    </div>
                    <h2>🎉 폰다판다 회원이 되신걸 환영합니다. 🎉</h2>
                    <div id="loginBox">
                        <form id="loginForm" action="#" method="post">
                            <div class="inputClass">
                                <input id="memberId" type="text" placeholder="아이디를 입력해 주세요." name="memberId" required>
                            </div>
                            <div class="inputClass">
                                <input id="memberPw" type="password" placeholder="비밀번호를 입력해 주세요." name="memberPw" required>
                            </div>
                            <div class="inputClass">
                                <label class="formLabel"><input type="radio">자동로그인</label>
                            </div>
                            <div class="inputClass">
                                <button id="loginButton" onclick="location.href='../index.jsp'">로그인</button>
                            </div>
                            <div id="formFooter" class="inputClass">
                                <div id="signDiv">
                                    <a class="aFormFooter" href="./register.html">회원가입</a>
                                </div>
                                <div id="findDiv">
                                    <a class="aFormFooter" href="./findIdPassword.html">아이디 / 비밀번호 찾기</a>
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
        
            </footer>
            <script>
            //헤더불러오기
            function loadHTML(url, element) {
                const xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState === 4 && this.status === 200) {
                        const content = this.responseText;
                        element.innerHTML = content;

                        // 포함된 자바스크립트 코드 실행
                        const scriptTags = element.getElementsByTagName("script");
                        for (var i = 0; i < scriptTags.length; i++) {
                            eval(scriptTags[i].innerText);
                        }
                    }
                };
                xhttp.open("GET", url, true);
                xhttp.send();
            }

            document.addEventListener("DOMContentLoaded", function() {
                const headerElement = document.querySelector("header");
                loadHTML("../components/header.html", headerElement);

                const footerElement = document.querySelector("footer");
                loadHTML("../components/footer.html", footerElement);
            });

            const result = '${ msg }';
			alert(result);
            
            </script>

        </div>
        
    </body>
</html>