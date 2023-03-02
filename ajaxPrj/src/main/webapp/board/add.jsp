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
 #bottom{
     height: 20px;
}
        
* {
    margin: 0;
    padding: 0;
}

html {
    font-size: 10px;
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

.bt_wrap input {
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

.bt_wrap input:first-child {
    margin-left: 0;
}

.bt_wrap input.on {
    background: #000;
    color: #fff;
}


.board_write {
    border-top: 2px solid #000;
}

.board_write .title,
.board_write .info {
    padding: 15px;
}

.board_write .info {
    border-top: 1px dashed #ddd;
    border-bottom: 1px solid #000;
    font-size: 0;
}

.board_write .title dl {
    font-size: 0;
}

.board_write .info dl {
    display: inline-block;
    width: 50%;
    vertical-align: middle;
}

.board_write .title dt,
.board_write .title dd,
.board_write .info dt,
.board_write .info dd {
    display: inline-block;
    vertical-align: middle;
    font-size: 1.4rem;
}

.board_write .title dt,
.board_write .info dt {
    width: 100px;
}

.board_write .title dd {
    width: calc(100% - 100px);
}

.board_write .title input[type="text"],
.board_write .info input[type="text"],
.board_write .info input[type="password"] {
    padding: 10px;
    box-sizing: border-box;
}

.board_write .title input[type="text"] {
    width: 80%;
}

.board_write .cont {
    border-bottom: 1px solid #000;
}

.board_write .cont textarea {
    display: block;
    width: 100%;
    height: 300px;
    padding: 15px;
    box-sizing: border-box;
    border: 0;
    resize: vertical;
}
@media (max-width: 1000px) {
    .board_wrap {
        width: 100%;
        min-width: 320px;
        padding: 0 30px;
        box-sizing: border-box;
    }


    .board_write .info dl {
        width: 49%;
    }

    .board_write .info dl:first-child {
        margin-right: 2%;
    }

    .board_write .title dt,
    .board_write .info dt {
        display: none;
    }

    .board_write .title dd,
    .board_write .info dd {
        width: 100%;
    }

    .board_write .title input[type="text"],
    .board_write .info input[type="text"],
    .board_write .info input[type="password"] {
        width: 100%;
    }
}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/menu.js"></script>
<script type="text/javascript" >
var addList=function(){
	//var param=$('#content form').serialize();
	var param={
				title:$('#content input').eq(0).val()
				,writer:$('#content input').eq(1).val()
				,content:$('#content input').eq(2).val()
				}; 
	$.post('add.do',$.param(param),function(data,msg){
		console.log(data,msg);
		location.href='list.jsp';
	});
};
$(function(){
	$('.board_write_wrap>form').submit(function(){
		$(this).find('span').remove();
		$(this).find(":text").each(function(idx,ele){
			if($(ele).val()=='')
				$(ele).after('<span class="err">빈값허용안함</span>');
		});
		addList();
		return false;
	});
});

</script>
</head>
<body>
	<div id="container">
		<div id="content">
			<div class="board_wrap">
        <div class="board_title">
            <strong>Write</strong>
        </div>
        <div class="board_write_wrap">
            <form>
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력" name="title" id="title"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>작성자</dt>
                        <dd>
                        <input type="text"  placeholder="작성자 입력" name="writer" id="writer"/>
                        </dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력" name="content" id="writer"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <input type="submit" value="입력">
                <input type="button" value="뒤로" onclick="history.back()">
            </div>
            </form>
        </div>
    </div>
		</div>
	</div>
</body>
</html>