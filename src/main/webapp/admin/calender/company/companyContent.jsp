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
	src="${pageContext.request.contextPath}/admin/calender/company/0.js/calender.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/calender/company/0.css/calender.css" />
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
					<a href="javascript:;" class="nav-btn go-year-prev"></a>
					<a href="javascript:;" class="nav-btn go-prev"></a>
					<div class="year-month"></div>
					<a href="javascript:;" class="nav-btn go-next"></a>
					<a href="javascript:;" class="nav-btn go-year-next"></a>
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
			</div>
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
					<div>일정추가</div>
				</div>
				<div class="ins-tr-3">
					<div class="ins-tr-3-title">
						<div class="ins-tr-title-tr">
							<div class="ins-tr-title-title">타이틀</div>
							<input type="text" class="ins-tr-3-td-input">
						</div>
					</div>
					<div class="ins-tr-3-date">
						<div class="ins-tr-3-date-tr">
							<div class="ins-tr-title-title">날짜</div>
							<input type="text" class="ins-tr-3-td-input">
						</div>
						<div></div>
					</div>
					<div class="ins-tr-3-txt">
						<div class="ins-tr-3-txt-tr">
							<div class="ins-tr-txt-tr-title">내용</div>
							<textarea class="ins-tr-3-td-txt"></textarea>
						</div>
						<div></div>
					</div>
					<div class="ins-tr-3-btn">
					<button class="company-button">등록하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>