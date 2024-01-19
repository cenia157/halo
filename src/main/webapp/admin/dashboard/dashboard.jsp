<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="admin/dashboard/0.css/dashboard.css">
<script src="admin/dashboard/0.js/dashboard.js"></script>
</head>
<body>

	<div class="deshboard-content">
		<div class="deshboard-content-box">
			<div class="deshboard-todo-box-1">
				<div class="deshboard-todo-title-1">오늘의 할일</div>
				<div class="deshboard-todo-list-1 todayList">
					<!-- 안에 넣을 예시 -->
					<div class="deshboard-todo today">● 이것 저것</div>
				</div>
			</div>
			<div class="deshboard-todo-box-area">
				<div class="deshboard-todo-box-2">
					<div class="deshboard-todo-title-2">예약현황</div>
					<div class="deshboard-todo-list-2 reservationList">
						<!-- 안에 넣을 예시 -->
						<div class="deshboard-todo reservation" id="0">
							<div class="deshboard-todo-cell service">Texi</div>
							<div class="deshboard-todo-cell name">민기시치</div>
							<div class="deshboard-todo-cell phonNum">01052525252</div>
							<div class="deshboard-todo-cell time">종일</div>
						</div>
					</div>
				</div>
				<div class="deshboard-todo-box-2">
					<div class="deshboard-todo-title-2 qa">최신문의사항</div>
					<div class="deshboard-todo-list-2 qalist">
						<!-- 안에 넣을 예시 -->
						<div class="deshboard-todo-qa"> ● 이것 저것
						</div>
					</div>
				</div>
			</div>
			<div class="deshboard-todo-box-area">
				<div class="deshboard-todo-box-2">
					<div class="deshboard-todo-title-2">오늘의 회사일정</div>
					<div class="deshboard-todo-list-2 eventlist">
						<!-- 안에 넣을 예시 -->
						<div class="deshboard-todo event"> ● 이것 저것
						</div>
					</div>
				</div>
				<div class="deshboard-todo-box-2">
					<div class="deshboard-todo-title-2">오늘의 출근직원</div>
					<div class="deshboard-todo-list-2 staffList">
						<!-- 안에 넣을 예시 -->
						<div class="deshboard-todo staff"> ● 이것 저것
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
</body>
</html>