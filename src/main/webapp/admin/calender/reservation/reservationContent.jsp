<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
	
</script>
<script
	src="${pageContext.request.contextPath}/admin/calender/reservation/0.js/reservation.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/calender/reservation/0.css/reservation.css" />
</head>

<head>
<meta charset="UTF-8">
<title>Document</title>
</head>

<body>
	<div class="company-padding">
		<div class="company-con">
			<div class="sec_cal">
				<div class="cal_nav">
					<a href="javascript:;" class="nav-btn go-year-prev"></a> <a
						href="javascript:;" class="nav-btn go-prev"></a>
					<div class="year-month"></div>
					<a href="javascript:;" class="nav-btn go-next"></a> <a
						href="javascript:;" class="nav-btn go-year-next"></a>
				</div>
				<div class="days">
					<div class="day">MON</div>
					<div class="day">TUE</div>
					<div class="day">WED</div>
					<div class="day">THU</div>
					<div class="day">FRI</div>
					<div class="day">SAT</div>
					<div class="day">SUN</div>
				</div>
				<div class="dates"></div>

				<div class="reservation-modal">
					<div class="reservation-modal-header">
						<div class="reservation-modal-title">서비스유형</div>
						<div class="reservation-modal-close"></div>
					</div>
					<div class="reservation-modal-content">
						<div class="reservation-modal-content-name">이름</div>
						<div class="reservation-modal-content-addr">주소</div>
						<div class="reservation-modal-content-book">날짜</div>
						<div class="reservation-modal-content-start">출발지</div>
						<div class="reservation-modal-content-startpoint">출발주소</div>
						<div class="reservation-modal-content-end">목적지</div>
						<div class="reservation-modal-content-endpoint">목적주소</div>
						<div class="reservation-modal-content-notice">예약내용</div>
						<div class="reservation-modal-content-manager">
							<div class="reservation-modal-content-manager-select">
								<div class="default-manager">직원 선택</div>
								<div class="manager-select-arrow"></div>
							</div>
							<div class="manager-select-option"></div>
						</div>
					</div>

					<div class="reservation-modal-agree-btn">
						<div class="reservation-modal-agree"
							onclick="reservationAccept(this)">승인</div>
						<div class="reservation-modal-disagree"
							onclick="reservationAccept(this)">거절</div>
					</div>

					<div class="reservation-modal-update-btn">
						<div class="reservation-modal-update">수정</div>
						<div class="reservation-modal-delete"
							onclick="reservationDelete(this)">삭제</div>
					</div>

					<div class="reservation-modal-detail-btn">
						<div class="reservation-modal-update"
							onclick="reservationConfirm(this)">확인</div>
						<div class="reservation-modal-delete"
							onclick="reservationCancel(this)">취소</div>
					</div>
				</div>

				<div class="date-modal">
					<div class="date-modal-header">
						<div class="date-modal-title"></div>
						<div class="modal-close"></div>
					</div>
					<div class="date-modal-content"></div>
				</div>
				<div class="backrop"></div>

				<div class="detail-schedule">
					<div class="detail-schedule-header">
						<div class="detail-schedule-title"></div>
						<div class="detail-schedule-close modal-close"></div>
					</div>
					<div class="detail-schedule-content"></div>
				</div>

				<div class="confirm-delete">
					<div class="confirm-delete-content">
						<div class="confirm-delete-content-announce">해당일정을 삭제하시겠습니까?</div>
						<div class="confirm-delete-content-accept">
							<div class="confirm-delete-agree"
								onclick="rowScheduleDelete('agree')">확인</div>
							<div class="confirm-delete-disagree"
								onclick="rowScheduleDelete('disagree')">취소</div>
						</div>
					</div>
				</div>

			</div>
			<form class="company-form" action="InsertCompanyC" method="post">
				<div class="sec-ins">
					<div class="ins-tr-1">
						<div class="ins-tr-td">
							<div class="ins-tr-td-btn">
								회사 <input type="checkbox" class="toggle" hidden> <label
									for="toggle" class="toggleSwitch"> <span
									class="toggleButton"></span>
								</label>
							</div>
						</div>
						<div class="ins-tr-td">
							<div class="ins-tr-td-btn">
								예약 <input type="checkbox" class="toggle" hidden> <label
									for="toggle" class="toggleSwitch"> <span
									class="toggleButton"></span>
								</label>
							</div>
						</div>
						<div class="ins-tr-td">
							<div class="ins-tr-td-btn">
								직원 <input type="checkbox" class="toggle" hidden> <label
									for="toggle" class="toggleSwitch"> <span
									class="toggleButton"></span>
								</label>
							</div>
						</div>
					</div>

					<div class="ins-tr-2">
						<div class="reservation-title">예약리스트</div>
						<input class="reservation-insert-input reservation-insert-service"
							style="width: 50%;" value="서비스유형">
						<div class="reservation-insert-input reservation-insert-time">
							오전  <input type="checkbox" name="insert-time" value="AM">
							오후  <input type="checkbox" name="insert-time" value="PM">
						</div>

					</div>
					<div class="ins-tr-3">
						<div class="ins-tr-3-reservation-header">
							<div>이름</div>
							<div>서비스유형</div>
							<div>날짜</div>
							<div></div>
						</div>
						<div class="ins-tr-3-reservation-content"></div>

						<div class="reservation-insert">
							<div class="reservation-insert-name">
								이름 <input class="reservation-insert-input" style="width: 80%;">
							</div>
							<div class="reservation-insert-addr">
								주소 <input class="reservation-insert-input" style="width: 80%;">
							</div>
							<div class="reservation-insert-book">
								날짜 <input class="reservation-insert-input input-date"
									style="width: 80%;" readonly="readonly">
							</div>
							<div class="reservation-insert-start">출발지</div>
							<div class="reservation-insert-startpoint">
								<input class="reservation-insert-input" style="width: 100%;">
							</div>
							<div class="reservation-insert-end">목적지</div>
							<div class="reservation-insert-endpoint">
								<input class="reservation-insert-input" style="width: 100%;">
							</div>
							<div class="reservation-insert-notice">
								<textarea class="reservation-insert-input">예약내용</textarea>
							</div>
							<div class="reservation-modal-content-manager">
								<div
									class="reservation-modal-content-manager-select select-insert">
									<div class="default-manager">직원 선택</div>
									<div class="manager-select-arrow"></div>
								</div>
								<div class="insert-manager-select-option"></div>
							</div>
						</div>
						<div class="ins-tr-3-btn">
							<button type="button" class="reservation-button">신규등록</button>
						</div>

						<div class="ins-tr-3-btn-insert">
							<div class="ins-tr-3-btn-insert-accept">등록</div>
							<div class="ins-tr-3-btn-insert-cancel" >취소</div>
						</div>

					</div>
				</div>
			</form>
		</div>
	</div>
</body>

</html>