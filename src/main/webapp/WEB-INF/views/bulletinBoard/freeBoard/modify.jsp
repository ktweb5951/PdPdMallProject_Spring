<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../../resources/css/reset.css">
    <link rel="stylesheet" href="../../resources/css/bulletinBoard/write.css">
    <title>글수정 페이지</title>
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
                        <h2>글 수정</h2>
                    </div>
                    <form action="/bulletinBoard/freeBoard/update.do" method="post" enctype="multipart/form-data">
                   		<input type="hidden" name="freeBoardNo" value="${freeBoard.freeBoardNo}">
                        <label for="title">제목</label>
                        <input type="text" id="freeBoardTitle" name="freeBoardTitle" value="${freeBoard.freeBoardTitle}" required>

                        <label for="title">작성자</label>
                        <input type="text" id="freeBoardWriter" name="freeBoardWriter" value="${freeBoard.freeBoardWriter}" readOnly style="width:100px">

<!--                         <label for="title">비밀번호</label> -->
<!--                         <input type="password" id="freeBoard-password" name="freeBoard-password" required> -->
                    
                        <label for="file">이미지 첨부</label>
                        <input type="file" id="uploadFile" name="uploadFile">
                        <input type="text" id="freeBoardFilename" name="freeBoardFilename" value="${freeBoard.freeBoardFilename}">
                        <input type="text" id="freeBoardFilepath" name="freeBoardFilepath" value="${freeBoard.freeBoardFilepath}">
                        <input type="text" id="freeBoardFilelength" name="freeBoardFilelength" value="${freeBoard.freeBoardFilelength}">                        
                    
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
        </body>
</html>