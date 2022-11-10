<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	
	<main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">공지사항</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">관리자용</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                관리페이지 공지사항
                            </div>
                            <div class="card-body">
                                <div style="font-size: 15px; padding-bottom: 10px;">게시글 총<code id="totalCount">[${totalNotice }]</code>건</div>
                                <c:if test="${not empty sessionScope.g }">
                                <div id="notice-write">
                                    <!-- <input type="hidden" id="memberId" value="${sessionScope.m.memberId}"> -->
                                            <a class="btn bc22 writeBtn" href="/adminNoticeWriteFrm.do">글쓰기</a> 
                                </div>
                               </c:if>
                                <table class="table">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">작성일</th>
                                        <th scope="col">조회수</th>
                                        <th scope="col">관리</th>
                                    </tr>
                                    </thead>
                                   
                                    <tbody>
                                    <c:forEach items="${list }" var="ng" varStatus="i">
                                    <tr>
                                        <th scope="row">${(reqPage-1)*numPerPage + i.count }</th>
                                        <td><a href="/noticeGView.do?noticeGNo=${ng.noticeGNo }" style="text-decoration: none;color: #282f44;">${ng.noticeGTitle }</a></td>
                                        <td>${ng.noticeGWriter }</td>
                                        <td>${ng.noticeGDate }</td>
                                        <td>${ng.readGCount }</td>
                                        <td><button class="bc77"><a href="/delete.do?noticeGNo=${ng.noticeGNo }" class="bc77" style="text-decoration: none;border: none;">삭제</a></button></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div style="text-align: right;font-size: 20px;letter-spacing: 3px;margin-right: 25px;font-weight: bolder;">${pageNavi }</div>
                            <!--  
                            <ul style="text-align: center;font-size: 20px;letter-spacing: 3px;" list-style-type: disc>${pageNavi }</ul>
                            -->
                            <!--  
                            <nav aria-label="Page navigation example" style="margin-right: 20px;">
                                <ul class="pagination justify-content-end">
                                
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                                </li>
                                
                                <br>
                                <li style="text-align: center;">${pageNavi }</li>
                                <br>
                                <!--  
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                
                                <!--  
                                <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                                
                                </ul>
                            </nav>
                            -->
                            <div id="titleContentSerarch-Box">
                                <select style="width: 100px; height: 40px; margin-right: -4px;" >
                                    <option>제목</option>
                                    <option>제목+내용</option>
                                </select>
                                <input type="text" placeholder="입력하세요" style="width: 400px; height: 40px;" name="keyword" id="keyword">
                                <button class="searchbox-btn btn bc22 searchBtn" name="btnSearch" id="btnSearch">검색</button>
                            </div>
                        </div>
                        
                        
                        
                        
                    </div>
                </main>
	
	
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
</body>
</html>