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

.bt_wrap button {
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

.bt_wrap button:first-child {
	margin-left: 0;
}

.bt_wrap button.on {
	background: #000;
	color: #fff;
}

.board_view {
	width: 100%;
	border-top: 2px solid #000;
}

.board_view .title {
	padding: 20px 15px;
	border-bottom: 1px dashed #ddd;
	font-size: 2rem;
}

.board_view .info {
	padding: 15px;
	border-bottom: 1px solid #999;
	font-size: 0;
}

.board_view .info dl {
	position: relative;
	display: inline-block;
	padding: 0 20px;
}

.board_view .info dl:first-child {
	padding-left: 0;
}

.board_view .info dl::before {
	content: "";
	position: absolute;
	top: 1px;
	left: 0;
	display: block;
	width: 1px;
	height: 13px;
	background: #ddd;
}

.board_view .info dl:first-child::before {
	display: none;
}

.board_view .info dl dt, .board_view .info dl dd {
	display: inline-block;
	font-size: 1.4rem;
}

.board_view .info dl dt {
	
}

.board_view .info dl dd {
	margin-left: 10px;
	color: #777;
}

.board_view .cont {
	padding: 15px;
	border-bottom: 1px solid #000;
	line-height: 160%;
	font-size: 1.4rem;
}

@media ( max-width : 1000px) {
	.board_wrap {
		width: 100%;
		min-width: 320px;
		padding: 0 30px;
		box-sizing: border-box;
	}
	.board_view .info dl {
		width: 50%;
		padding: 0;
	}
	.board_view .info dl:nth-child(-n+2) {
		margin-bottom: 5px;
	}
	.board_view .info dl::before {
		display: none;
	}
	.board_view .info dl dt, .board_view .info dl dd {
		font-size: 1.2rem;
	}
}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/menu.js"></script>
<script type="text/javascript" >
var loadData=function(writer){
	$.ajax({
		  url: 'http://localhost:8080/ajaxPrj/board/detail.do',
		  type: 'get',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: {writer:writer},
		  dataType: "json",
		  success: function(data){
			  		console.log(data.list[0].title);
			  		console.log(data.list[0].content);
					$('#title').val(data.list[0].title);
					$('#writer').val(data.list[0].writer);
					$('#regdate').val(data.list[0].regdate);
					$('#visitcnt').val(data.list[0].visitcnt);
					$('#cont').val(data.list[0].content);
	
					}
					

		});
};


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


// data: $('form').serialize();
var update=function(){
// 	console.log($('form').serialize());
	$.ajax({
		  url: 'http://localhost:8080/ajaxPrj/board/update.do',
		  type: 'post',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: $('form').serialize(),
		  dataType: "text",
		  success: function(data){
				alert('성공');
			     var url='http://localhost:8080/ajaxPrj/board/list.jsp';
			     location.replace(url);
			}

		});
};
var del =function(){
	$.ajax({
		  url: 'http://localhost:8080/ajaxPrj/board/delete.do',
		  type: 'get',
		  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		  data: $('form').serialize(),
		  dataType: "text",
		  success: function(data){
				alert('성공');
			     var url='list.jsp';
			     location.replace(url);
			}

		});
};

$(function(){
	var writer=location.search.substr(location.search.indexOf('=')+1);
	loadData(writer);
	$('form')
		.find(":text")
		.prop('readonly',true)
		.css('border-color','white')
		.css('border-width',0)
		;
	$('#updatebtn').click(function () {
		$('strong').html("Update");
		$('#title').removeProp('readonly');
		$('#cont').removeProp('readonly');
		
	$(this).click(function () {
		update();
	});
	});
	
	$('#deletebtn').click(function () {
	 	console.log('딜리트 실행');
		del();
	});
	
});

</script>
</head>
<body>
<div id="container">
 <div id="content">
 	<form enctype="application/x-www-form-urlencoded">
    <div class="board_wrap">
        <div class="board_title">
            <strong>Detail</strong>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                    <input type="text" name="title" id="title"/>
                </div>
                <div class="info">
                    <dl>
                        <dt>작성자</dt>
                        <dd><input type="text" name="writer" id="writer"/></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><input type="text" name="regdate" id="regdate"/></dd>
                    </dl>
                    <dl>
                        <dt>조회수</dt>
                        <dd><input type="text" name="visitcnt" id="visitcnt"/></dd>
                    </dl>
                </div>
                <div class="cont">
                   <input type="text" name="cont" id="cont"/>
                </div>
            </div>
            <div class="bt_wrap">
                <button id="updatebtn" type="button" >수정</button>
 				<button id="deletebtn" type="button" >삭제</button>
            </div>
        </div>
    </div>
    </form>
    </div> 
    </div>
</body>
</html>