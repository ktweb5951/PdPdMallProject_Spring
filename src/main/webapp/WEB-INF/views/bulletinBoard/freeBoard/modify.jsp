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
    <link rel="stylesheet" href="../../resources/css/reset.css">
    <link rel="stylesheet" href="../../resources/css/bulletinBoard/write.css">
    <title>글작성 페이지</title>
    </head>
    <body>
        <div id="container">
            <header>
     			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
            </header>
            <main>
                <div class="write-form">
                    <div class="top">
                        <img src="../../resources/images/components/logoimage2.png" alt="">                        
                        <h2>글 작성</h2>
                    </div>
                    <form action="/bulletinBoard/freeBoard/update.do" method="post">
                    	<input type="hidden" id="freeBoardNo" name="freeBoardNo" value="${freeBoard.freeBoardNo}">
                        <label for="title">제목</label>
                        <input type="text" id="freeBoardTitle" name="freeBoardTitle" value="${freeBoard.freeBoardTitle}" required>

<!--                         <label for="title">작성자</label> -->
<!--                         <input type="text" id="freeBoard-writer" name="freeBoard-writer" required> -->

<!--                         <label for="title">비밀번호</label> -->
<!--                         <input type="password" id="freeBoard-password" name="freeBoard-password" required> -->
                    
                        <label for="file">이미지 첨부</label>
                        <input type="file" id="image-path" name="image-path">
                    
                        <label for="content">내용</label>
                        <textarea id="freeBoardContent" name="freeBoardContent" rows="20" required>${freeBoard.freeBoardContent}</textarea>
                    
                        <div>
                        <input class=btn type="submit" value="수정">
                        <input class=btn type="reset" value="취소">
                        </div>
                    </form>
                </div>
            </main>
            <footer>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
            </footer>
        </div>
            
        
        <script>
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

  
            function cancel() {
                if (confirm("작성을 취소하시겠습니까?")) {
                window.location.href = "../index.html"; // Replace with the URL of the main page
                }
            }
            

            function registerBtn(){
                if(document.querySelector("#title").value!==""){
                    alert("게시물이 수정되었습니다.");
                }
            }
            
        </script>
        </body>
</html>