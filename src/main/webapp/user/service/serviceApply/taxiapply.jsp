<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Taxi Apply</title>
<link
      rel="stylesheet"
      href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
    />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/service/serviceApply/0.css/taxiapply.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-menu.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-footer.css">
</head>
<body>


	<!-- 본문 -->
	<div class="ta-container">
      <div class="ta-content-tbl">
        <div class="ta-content-box-tr">
          <div class="ta-content-box-td">
            <div class="ta-content-tabbox-td">
              <div class="ta-content-tab1-td tab1-pos">서비스 안내</div>
              <div class="ta-content-tab2-td tab2-pos">서비스 신청</div>
            </div>
            <div class="ta-content-subtab-td">
              <img src="0.img/home.png" alt="" /> 서비스 > 서비스신청
            </div>
            <div class="ta-content-procedure-box-td">
              <div class="ta-content-title-box-td">서비스 신청 순서</div>
              <div class="ta-content-procedure-box-ul-pos">
                <ul class="ta-content-procedure-box-ul">
                  <li class="ta-content-box-li">
                    <div class="ta-content-service-step-box-td">Step1.</div>
                    <div class="ta-content-service-txt-box-td">
                      신청할 서비스 선택하기
                    </div>
                  </li>
                  <li class="ta-content-box-li">
                    <div class="ta-content-service-step-box-td">Step2.</div>
                    <div class="ta-content-service-txt-box-td">
                      이용할 ‘기간’ 캘린더에서 선택하기
                    </div>
                  </li>
                  <li class="ta-content-box-li">
                    <div class="ta-content-service-step-box-td">Step3.</div>
                    <div class="ta-content-service-txt-box-td">
                      이용 ‘시간’ 선택하기
                    </div>
                  </li>
                  <li class="ta-content-box-li-pagepos">
                    <div class="ta-content-service-step-box-td">Step4.</div>
                    <div class="ta-content-service-txt-box-td">정보 입력하기</div>
                  </li>
                  <li class="ta-content-box-li">
                    <div class="ta-content-service-step-box-td">Step5.</div>
                    <div class="ta-content-service-txt-box-td">이용약관 동의</div>
                  </li>
                  <li class="ta-content-box-li">
                    <div class="ta-content-service-step-box-td">Step6.</div>
                    <div class="ta-content-service-txt-box-td">신청 완료</div>
                  </li>
                </ul>
              </div>
            </div>
            
	<!-- 설명 끝 -->
	
	<!-- 신청폼 -->
		<div class="ta-content-applyform-td">
			<div class="ta-content-applyform-tr-1">
				<select class="categotyselect" name="category" id="category">
			           <option value="" selected="selected" disabled="disabled">‘개호택시’ 신청에 필요한 정보를 입력해주세요.</option>
			           <option value=""></option>
			           <option value=""></option>
			           <option value=""></option>
			    </select>
			</div>
			<div class="ta-content-applyform-td2">
				<div class="ta-content-applyform-tr-2">
					<span class="ta-content-applyform-tr-2-1">신청자 이름* :</span>
					<input class="ta-content-applyform-tr-2-2" type="text">
				</div>
				<div class="ta-content-applyform-tr-2">
					<span class="ta-content-applyform-tr-2-1">서비스 받으실 분 성함* :</span>
					<input class="ta-content-applyform-tr-2-2" type="text">
				</div>
				<div class="ta-content-applyform-tr-2">
					<span class="ta-content-applyform-tr-2-1">지역* :</span>
					<input class="ta-content-applyform-tr-2-2" type="text">
				</div>
				<div class="ta-content-applyform-tr-2">
					<span class="ta-content-applyform-tr-2-1">출발지* :</span>
					<input class="ta-content-applyform-tr-2-2" type="text">
				</div>
				<div class="ta-content-applyform-tr-2">
					<span class="ta-content-applyform-tr-2-1">목적지* :</span>
					<input class="ta-content-applyform-tr-2-2" type="text">
				</div>
				<div class="ta-content-applyform-tr-2">
					<span class="ta-content-applyform-tr-2-1">비고란(요청사항)* :</span>
					<textarea class="ta-content-applyform-tr-2-2" type="text"></textarea>
				</div>
			</div>
	            <div class="ta-content-cal-btn-box-td">
	              <button class="ta-content-cal-btn-td">다음으로</button>
	            </div>
			</div>
		</div>
	<!-- 신청폼 끝 -->
          </div>
        </div>
 </div>


</body>
</html>