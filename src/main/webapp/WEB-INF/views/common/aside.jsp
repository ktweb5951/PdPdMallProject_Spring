<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside>
        <h1>마이페이지</h1>
                    <ul class="myPage">
                        <li><a href="#" onclick="loadPage('modifyMemberInfo.jsp')">프로필</a></li>
                        <li><a href="#" onclick="loadPage('거래내역.html')">거래내역</a></li>
                        <li><a href="/member/update.do?memberId=${memberId}">회원정보수정</a></li>
                        <li><a href="#" onclick="loadPage('회원탈퇴.html')">회원탈퇴</a></li>
                    </ul>
</aside>