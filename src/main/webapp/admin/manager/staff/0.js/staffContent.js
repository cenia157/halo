window.onload = function() {

//	function getAllStaffList() {
		fetch('StaffList') // API 엔드포인트 경로를 여기에 입력해주세요
			.then(response => response.json())
			
			.then(data => {
				console.log(data);
				// 서버로부터 받은 데이터(data)를 처리
//				const staffList = document.querySelectorAll('#staffList .table-row');

				// 받은 데이터를 각 div에 추가
//				data.forEach((employee, index) => {
//					staffList[index].querySelector('.steff-num').textContent = employee.employeeNumber;
//					staffList[index].querySelector('.steff-pos').textContent = employee.position;
//					staffList[index].querySelector('.steff-name').textContent = employee.name;
//					staffList[index].querySelector('.steff-callnum').textContent = employee.phoneNumber;
//					staffList[index].querySelector('.steff-addr').textContent = employee.address;
//					staffList[index].querySelector('.steff-entryDate').textContent = employee.hireDate;
//					staffList[index].querySelector('.steff-color').value = employee.color;
//				});
			})
			.catch(error => {
				// 오류 처리
				console.error('There was a problem with the fetch operation:', error);
			});
//	}


}
function StaffRegC() {
	document.querySelector('.staff-form').submit();
}