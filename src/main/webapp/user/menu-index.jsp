<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Document</title>
</head>

<body>
	<div class="content-tbl">
		<div class="content-space"></div>
		<div class="content-sec">
			<jsp:include page="${subMenu  }"></jsp:include>
		</div>
		<!-- 테두리,컨셉컬러로 두껍게, 오버로드 히든으로 흰 배경부분 보이지 않게(이미지 꽉차게) -->
		<div class="bottom-venner-tr">
			<c:forEach var="bannerInform" items="${bannersInform}">
				<c:if test="${bannerInform.b_type == 1 }">
					<div class="bottom-venner-td menu-box"
						onclick="location.href='${bannerInform.b_url}'">${bannerInform.b_m_text }</div>
				</c:if>
				<c:if test="${bannerInform.b_type == 2 }">
					<div class="bottom-venner-td sales-box" style="background-image: url('${pageContext.request.contextPath}/user/upload_imgs/banner/${bannerInform.b_img_url}');" 
						onclick="openNewWindow('${bannerInform.b_url}');">
						상품명: ${bannerInform.b_m_text}
				</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</body>
<script type="text/javascript">
function openNewWindow(url) {
    window.open(url, '_blank');
}

</script>
</html>