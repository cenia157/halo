<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="admin/dashboard/0.css/dashboard.css">
</head>
<body>

	<div class="deshboard-content">
		<div class="deshboard-content-box">
			<!-- 			<div class="deshboard-todo-box-1"> -->
			<!-- 				<div class="deshboard-todo-title-1">오늘의 할일</div> -->
			<!-- 				<div class="deshboard-todo-list-1 todayList"> -->
			<!-- 					안에 넣을 예시 -->
			<!-- 					<div class="deshboard-todo today">● 이것 저것</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div class="deshboard-todo-box-area">
				<div class="deshboard-todo-box-2">
					<div class="deshboard-todo-title-2">예약현황</div>
					<div class="deshboard-todo-list-2 reservationList">
						<!-- List 목록-->
						<div class="deshboard-todo reservation">
							<div class="deshboard-todo-cell service"></div>
							<div class="deshboard-todo-cell name">신청자</div>
							<div class="deshboard-todo-cell phonNum">전화번호</div>
							<div class="deshboard-todo-cell time">시간</div>
						</div>
					</div>
				</div>
				<div class="deshboard-todo-box-2">
					<div class="deshboard-todo-title-2 qa">미답변문의사항</div>
					<div class="deshboard-todo-list-2 qalist">
						<!-- 안에 넣을 예시 -->
						<div class="deshboard-todo qa">
							<div class="deshboard-todo-cell service"></div>
							<div class="deshboard-todo-cell title">문의제목</div>
							<div class="deshboard-todo-cell writer">작성자</div>
							<div class="deshboard-todo-cell reg-date">작성일자</div>
						</div>
					</div>
				</div>
			</div>
			<div class="deshboard-todo-box-area">
				<div class="deshboard-todo-box-2">
					<div class="deshboard-todo-title-2">오늘의 회사일정</div>
					<div class="deshboard-todo-list-2 eventlist">
						<!-- 안에 넣을 예시 -->
						<div class="deshboard-todo company">
							<div class="deshboard-todo-cell service"></div>
							<div class="deshboard-todo-cell company-title">일정</div>
							<div class="deshboard-todo-cell company-txt">내용</div>
						</div>
					</div>
				</div>
				<div class="deshboard-todo-box-2">
					<div class="deshboard-todo-title-2">오늘의 출근직원</div>
					<div class="deshboard-todo-list-2 staffList">
						<!-- 안에 넣을 예시 -->
						<div class="deshboard-todo staff">
							<div class="deshboard-todo-cell service"></div>
							<div class="deshboard-todo-cell staff-name">직원명</div>
							<div class="deshboard-todo-cell staff-position">직급</div>
							<div class="deshboard-todo-cell staff-phone">전화번호</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="admin/dashboard/0.js/dashboard.js"></script>
</body>
</html>