<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 해당페이지 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/user/information/map/0.css/map2.css" />
<!-- Google Map API-->
    <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCoJHgg3IE796b40XaiM6M7cTjkbPWbYDo&callback=console.debug&libraries=maps,marker&v=beta">
    </script>

</head>
<body>

	<div class="map-content-sec">
		<div class="content-box-tbl">
			<div class="content-box-tr">
				<div class="content-box-td2">
					<a href="">회사소개</a>
				</div>
				<div class="content-box-td1">
					<a href="">오시는길</a>
				</div>
			</div>

			<div class="introduce-tbl">
				<div class="introduce-tr">
					<div class="introduce-tr-box">
						<!-- 페이지로드, 컨텐트 타이틀 -->
						<div class="introduce-td2">
							<img
								src="${pageContext.request.contextPath}/user/0.img//home.png"
								width="1.7%" alt="" /> > 소개 > 오시는길
						</div>
						<div class="introduce-td1">오시는길</div>
					</div>
					<!-- 구글맵 박스 -->
					<div class="map-tbl">
						<!-- (지도API) 들어올 자리  -->
						<div id="map" class="map-tr">    <gmp-map center="34.725521087646484,135.56072998046875" zoom="14" map-id="DEMO_MAP_ID">
      <gmp-advanced-marker position="34.725521087646484,135.56072998046875" title="My location">
      </gmp-advanced-marker>
    </gmp-map></div>
						<div class="map-tr1">
							<div class="map-tr2">
								<div class="map-td">우편번호 : 570-0062</div>
								<div class="map-td">주소 : 大阪府守口市馬場町3-14-6メゾンエミール701号</div>
								<div class="map-td">다른 문의사항은 문의 게시판을 이용해주시기 바랍니다.</div>
							</div>
						</div>
					</div>
					<!-- 구글맵 박스 끝 -->

				</div>
			</div>
		</div>
	</div>
</body>
</html>