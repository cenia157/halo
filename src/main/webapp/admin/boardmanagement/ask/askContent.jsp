<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Ask</title>
<link rel="stylesheet"
	href="admin/boardmanagement/ask/0.css/ask.css" />


<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />


<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
</script>
<link rel="stylesheet" href="admin/0.css/test copy.css" />

<script src="admin/_js/test2.js"></script>
<script src="admin/_js/test.js"></script>

</head>
<body>
	<div class="ontent-m-td-2-chackbox">
		<div class="ontent-m-td-2-chackbox-contain">
				<div class="ontent-m-td-2-chackbox-contain-input">
					<input type="checkbox" class="filter" id="checkbox" name="status_checkbox" value="completed">
				</div>
				<div class="ontent-m-td-2-chackbox-contain-txt">完</div>
				<div class="ontent-m-td-2-chackbox-contain-input">
					<input type="checkbox" class="filter" id="checkbox" name="status_checkbox" value="uncompleted">
				</div>
				<div class="ontent-m-td-2-chackbox-contain-txt">未</div>
			<div class="ontent-m-td-2-chackbox-contain-input"></div>
			<div class="ontent-m-td-2-chackbox-contain-txt"></div>
			<div class="ontent-m-td-2-chackbox-contain-input"></div>
			<div class="ontent-m-td-2-chackbox-contain-txt"></div>
			<div class="ontent-m-td-2-chackbox-contain-input"></div>
			<div class="ontent-m-td-2-chackbox-contain-txt"></div>
		</div>
	</div>
	<!-- 아래의 include는 for Each를 써서 게시판을 나타내는 용도다  -->
	<jsp:include page="/admin/boardmanagement/ask/askBoard.jsp"></jsp:include>
	<!-- 고객의 문의에 미답변 내용을 보여주는 곳 -->
	<jsp:include page="/admin/boardmanagement/ask/askRespone.jsp"></jsp:include>
	<!-- 고객의 문의에 답변 내용을 편집하는 곳 -->
	<jsp:include page="/admin/boardmanagement/ask/askEditPage.jsp"></jsp:include>
	
	
</body>

<script type="text/javascript">

//체크박스 제출
$(document).ready(function() {
    // 체크박스의 change 이벤트를 감지
    $('input[type="checkbox"]').change(function() {
        // 체크박스가 변경되면 바로 폼을 제출
        $('#checkbox').submit();
    });

    // 폼 제출 시의 동작을 처리하는 함수
    $('#checkbox').submit(function() {
        // 폼이 제출될 때 수행할 동작 추가
        console.log('Form submitted!');
        // 추가로 필요한 로직을 여기에 작성
        var checkboxData = [];
        $('input[type="checkbox"]').each(function() {
            checkboxData.push({
                value: $(this).val(),
                checked: $(this).prop('checked')
            });
        });
        fetchData(checkboxData);
    });
});


function fetchData(data){
	$.ajax({
		url: "CheckboxC",
		method: "POST",
		data: {
			completed: data.some(item => item.value === 'completed' && item.checked),
			uncompleted: data.some(item => item.value === 'uncompleted' && item.checked)
		},
		success: function(data){
			refreshData(data);
			console.log("newQnCs: ", data);
		},
		error: function(xhr, status, error){
			console.log("에러발생: ", xhr, status, error)
		}
	});	
	
}

function refreshData(QnCs) {
	console.log("나오는지 여부 확인: ",QnCs);
    var container = document.getElementById("FOREACH_ASK");
    container.innerHTML = ""; // 기존 내용 비우기

    
    // QnCs가 배열이 아니면 배열로 변환
    if (!Array.isArray(QnCs)) {
        QnCs = [];
    }
    
    // QnCs 데이터를 이용하여 화면 갱신
    QnCs.forEach(function(item, index) {
        var newElement = document.createElement("div");
        newElement.className = "ontent-m-td-2-content-txt-in";

        newElement.innerHTML = `
            <input hidden="1" name="q_seq" value="${item.q_seq}">
            <div class="ontent-m-td-2-content-txt-no-in">
                ${(index + 1) + (curPageNo - 1) * 8}
            </div>
            <div class="ontent-m-td-2-content-txt-kategorie-in">
                ${item.c_answer === '1' ? '完' : '未'}
            </div>
            <div class="ontent-m-td-2-content-txt-title-in">
                <a onclick="getData('${item.q_seq}');">${item.q_title}</a>
            </div>
            <div class="ontent-m-td-2-content-txt-writer-in">${item.q_name}</div>
            <div class="ontent-m-td-2-content-txt-date-in">${item.q_reg_date}</div>
            <div class="ontent-m-td-2-content-txt-delete-in">
                <a onclick="deleteQuestion(${item.q_seq})">削除</a>
            </div>`;

        container.appendChild(newElement);
    });
}

</script>

</html>