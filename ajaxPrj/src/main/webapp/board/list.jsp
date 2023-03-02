<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container {
	width: 1200px;
	margin: auto;
	min-height: 800px;
}

#bottom {
	height: 20px;
}

* {
	margin: 0;
	padding: 0;
}

html {
	font-size: 10px;
}

ul, li {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}

.board_title {
	margin-bottom: 30px;
}

.board_title strong {
	font-size: 3rem;
}

.board_title p {
	margin-top: 5px;
	font-size: 1.4rem;
}

.board_wrap {
	width: 1000px;
	margin: 100px auto;
}

.bt_wrap {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
}

.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 10px;
	border: 1px solid #000;
	border-radius: 2px;
	font-size: 1.4rem;
	background-color: #2a2a2a;
	color: white;
}

.bt_wrap a:first-child {
	margin-left: 0;
}

.bt_wrap a.on {
	background: #000;
	color: #fff;
}

.board_list {
	width: 100%;
	border-top: 2px solid #000;
}

.board_list>div {
	border-bottom: 1px solid #ddd;
	font-size: 0;
}

.board_list>div.top {
	border-bottom: 1px solid #999;
}

.board_list>div:last-child {
	border-bottom: 1px solid #000;
}

.board_list>div>div {
	display: inline-block;
	padding: 15px 0;
	text-align: center;
	font-size: 1.4rem;
}

.board_list>div.top>div {
	font-weight: 600;
}

.board_list .num {
	width: 10%;
}

.board_list .title {
	width: 60%;
	text-align: left;
}

.board_list .top .title {
	text-align: center;
}

.board_list .writer {
	width: 10%;
}

.board_list .date {
	width: 10%;
}

.board_list .count {
	width: 10%;
}

.board_page {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
}

.board_page a {
	display: inline-block;
	width: 32px;
	height: 32px;
	box-sizing: border-box;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-left: 0;
	line-height: 100%;
}

.board_page a.bt {
	padding-top: 10px;
	font-size: 1.2rem;
	letter-spacing: -1px;
}

.board_page a.num {
	padding-top: 9px;
	font-size: 1.4rem;
}

.board_page a.num.on {
	border-color: #000;
	background: #000;
	color: #fff;
}

.board_page a:first-child {
	border-left: 1px solid #ddd;
}

@media ( max-width : 1000px) {
	.board_wrap {
		width: 100%;
		min-width: 320px;
		padding: 0 30px;
		box-sizing: border-box;
	}
	.board_list .num, .board_list .writer, .board_list .count {
		display: none;
	}
	.board_list .date {
		width: 40%;
	}
	.board_list .title {
		text-indent: 10px;
	}
	.board_list .top .title {
		text-indent: 0;
	}
	.board_page a {
		width: 26px;
		height: 26px;
	}
	.board_page a.bt {
		padding-top: 7px;
	}
	.board_page a.num {
		padding-top: 6px;
	}
}
</style>

<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/menu.js"></script>
<script type="text/javascript" >
var listLoading = function(){
	$.get('http://localhost:8080/ajaxPrj/board/list.do', function(data){
		console.log(data);
		data.list.forEach(function(ele) {

			$('<div/>')
			.append($('<div/>').addClass('num').html('<a href = "detail.jsp?writer='+ ele.writer +'">'+ele.num+'</a>'))
			.append($('<div/>').addClass('title').html('<a href = "detail.jsp?writer='+ ele.writer +'">'+ele.title+'</a>'))
			.append($('<div/>').addClass('writer').html('<a href = "detail.jsp?writer='+ ele.writer +'">'+ele.writer+'</a>'))
			.append($('<div/>').addClass('date').html('<a href = "detail.jsp?writer='+ ele.writer +'">'+ele.regdate+'</a>'))
			.append($('<div/>').addClass('count').html('<a href = "detail.jsp?writer='+ ele.writer +'">'+ele.visitcnt+'</a>'))
			.appendTo('.board_list');
		});
    }, "json");
};


$(function(){
	listLoading();
});
</script>
</head>
<body>
	<div id="container">
    	<div id="content">
    	<div class="board_wrap">
    	   <div class="board_title">
            <strong><게시판></strong>
           </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">작성자</div>
                    <div class="date">작성일</div>
                    <div class="count">조회수</div>
                </div>
            	</div>
             </div>
            <div class="bt_wrap">
                <a href="add.jsp">글쓰기</a>
                <!--<a href="#">수정</a>-->
            </div>
        </div>
    </div>
    </div>
</body>
</html>