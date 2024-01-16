window.onload = function() {
      // 페이지가 로드되면 실행될 코드
//		let agreeForm = 
      let checkBox = document.getElementById("terms-agree");
      let myForm = document.getElementById("agreeFrom");
      function submitForm() {
		console.log(checkBox.checked)
        if (!checkBox.checked) {
          alert("동의 체크박스를 선택해주세요.");
          return false; // 폼 제출을 막습니다.
        }
        // 실제로 서버로 데이터를 전송하도록 폼 제출 로직을 추가할 수 있습니다.
        alert("신청 완료 되었습니다.");
		myForm.submit();
      }

    };