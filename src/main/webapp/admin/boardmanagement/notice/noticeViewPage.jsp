<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>noticeEditPage</title>

<style type="text/css">
.modal-title-td-1 {
/* 	outline: 1px solid red; */
}

.real-title-V, #Display-Category {
/* 	outline: 1px solid brown; */
}

#Display-Category {
	margin-right: 90.55%;
	border: 1px solid #d1d1d1;
}

.viewModalHeader {
	width: 90%;
    display: flex;
    justify-content: end;
    align-items: end;
    flex-direction: column;
}

.Display-Category-wrap {
	width: 94.5%;
	margin-bottom: 0.2%;
}

.real-title-V {
 	border-top: 1px solid #D1D1D1;
}

.viewModal-content-txt {
/* 	outline: 1px solid red; */
	overflow-y: auto;
	border: 1px solid black;
	border-color: var(--ck-color-base-border);
	border-bottom: 1px solid #616161;
}

.viewModal-content-txt figure {
	margin: 0.3em auto;
    text-align: center;
}

.viewModal-content-txt img {
    display: block;
    height: auto;
    margin: 0 auto;
    max-width: 100%;
}

.viewModal-content-txt-in {
	padding-top: 1%;
}

</style>


</head>
<body>
	<div onclick="closeModalV()" id="myModalV" class="modal-background"></div>
	<div id="myModal-tblV" class="modal-tbl">
		<div class="modal-title-set">
			<div class="modal-title-tr">
				<div class="modal-title-td-1 viewModalHeader">
					<div class="real-title-V" id="real-title-V"></div>
					<div class="Display-Category-wrap"><div id="Display-Category"></div></div>
				</div>
				<div class="modal-title-td-2">
					<span class="close" id="closeModalBtn" onclick="closeModalV()">&times;</span>
				</div>
			</div>
			<div class="modal-content">
				<div class="modal-content-txt viewModal-content-txt">
					<div class="modal-content-txt-in viewModal-content-txt-in ck ck-content" id="modal-content-txt-in"></div>
				</div>
				<div class="modal-content-button">
					<button class="SubmitButton" id="aaaaaaaaaaaaaaaaaaaaaaaaaa">수정</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>