<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Frequenthyask</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/0.css/test.css" />
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
</head>




<body>
	<!-- �ֻ��� �����̳� -->
	<div class="container">
		<!-- ���� ���̺� -->
		<div class="left-tbl">
			<div class="menu-tr">
				<div class="menu-td-1"></div>
				<div class="menu-td-2"></div>
				<div class="menu-td-3"></div>
				<div class="menu-td-4"></div>
			</div>
		</div>
		<div class="right-tbl">
			<!-- ������ ���̺� open -->
			<div class="header-tr"></div>
			<div class="content-tr">
				<div class="content-main-td">
					<div class="content-m-td-1">
						<!-- *************** ���� *************** -->
						<div class="content-m-td-title">��������</div>
					</div>
					<div class="content-m-td-2">



						<div class="ontent-m-td-2-chackbox">
							<input type="checkbox" name="">&nbsp;�亯&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="">&nbsp;�̴亯&nbsp;&nbsp;&nbsp;
						</div>


						<div class="ontent-m-td-2-content"></div>

						<div class="ontent-m-td-2-bottom">

							<div class="ontent-m-td-2-page-side"></div>
							<div class="ontent-m-td-2-page-center"></div>
							<div class="ontent-m-td-2-page-side">


								<button id="openModalBtn">����ϱ�</button>
								<!-- ��� ���� ��ġ�� ���� -->

							</div>



						</div>

						<!-- 
 -->
						<!-- 
								 -->
						<div id="myModal" class="modal-background"></div>
						<div class="modal-tbl">

							<div class="modal-title-tr">
								<div class="modal-title-td-1">


									<div class="modal-title-td-1-title">
										<div class="modal-title-td-1-title-detile">����</div>
									</div>


									<div class="modal-title-td-1-con">
										<div class="modal-title-td-1-detile">2023-12-25 ���� ��</div>
										<div class="modal-title-td-1-detile">�Ϲ�</div>
									</div>


								</div>


								<div class="modal-title-td-2">
									<span class="close" id="closeModalBtn">&times;</span>
								</div>

							</div>


							<div class="modal-content">
								<div class="modal-content-txt">��� ������ ���⿡ ���ϴ�.</div>
								<div class="modal-content-button">
									<button>����</button>
								</div>

							</div>


						</div>





					</div>
				</div>
				<!-- *************** ���� *************** -->
			</div>
		</div>
		<!-- ������ ���̺� close -->
	</div>
	<!-- �ֻ��� �����̳� close-->
</body>

</html>