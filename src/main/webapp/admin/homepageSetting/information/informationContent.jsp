<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Information</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/homepageSetting/information/0.css/informationContent.css" />
<body>
	<!-- 여기에 회사정보변경 내용을 채워야한다  index.jsp의 인클루드 됭 부분이다 -->
	<div class="content-m-td-2-wrap">
		<div class="content-m-td-2-wrap-contain">
	<!-- 폼태그 => 회사정보변경C -->
		<form action="InformUpdateC" method="get">
			<div class="CompanyInformation">
				<div class="CompanyInformation-large">
					<div class="CompanyInformation-info">회사의주소</div>
					<div class="CompanyInformation-txt">
						<!-- 회사 주소 인풋 -->
						<textarea name="h_address" class="CompanyInformation-textarea-big" rows="" cols=""
							placeholder="이곳에 이전에 입력했던 회사의 정보를 표시해야한다"></textarea>
					</div>
				</div>
				<div class="CompanyInformation-small">
					<div class="CompanyInformation-small-tr">
						<div class="CompanyInformation-small-td">
							<div class="CompanyInformation-info">회사의 전화번호</div>
							<div class="CompanyInformation-txt">
							<!-- 회사 전화번호 인풋 -->
								<textarea name="h_tel_no" class="CompanyInformation-textarea-mini" rows=""
									cols="" placeholder="06-6997-6531"></textarea>
							</div>
						</div>
						<div class="CompanyInformation-small-td">
							<div class="CompanyInformation-info">회사의 휴대전화</div>
							<div class="CompanyInformation-txt">
							<!-- 회사 휴대전화 인풋 -->
								<textarea name="h_phone_no" class="CompanyInformation-textarea-mini" rows=""
									cols="" placeholder="090-8799-3855"></textarea>
							</div>
						</div>
					</div>
					<div class="CompanyInformation-small-tr">
						<div class="CompanyInformation-small-td">
							<div class="CompanyInformation-info">회사의 이메일</div>
							<div class="CompanyInformation-txt">
							<!-- 회사 이메일 인풋 -->
								<textarea name="h_email" class="CompanyInformation-textarea-mini" rows=""
									cols="" placeholder="hello20201110@gmail.com"></textarea>
							</div>
						</div>
						<div class="CompanyInformation-small-td">
							<div class="CompanyInformation-info">회사의 FAX</div>
							<div class="CompanyInformation-txt">
							<!-- 회사 FAX 인풋 -->
								<textarea name="h_fax" class="CompanyInformation-textarea-mini" rows=""
									cols="" placeholder="06-6997-6520"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 하단 div박스 등록결과, 버튼 -->
			<div class="content-m-td-2-down">
				<div class="content-m-td-2-side-down-button">
				<div class="information-result">등록 결과 어트리뷰트자리</div>
					<button class="content-button">변경</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>

</html>