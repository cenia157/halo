window.onload = function(){
	fetch('TodayReservationInfo')
	.then(response => reservation.json())
	.then(data => {
			empdata = data;
			console.log(data);
			console.log(selectDate.value);
			for (let i = 0; i < data.length; i++) {
				let formattedmonth = data[i].month < 10 ? `0${data[i].month}` : data[i].month;
				let formatteddate = data[i].year + '-' + formattedmonth + data[i].day


				document.querySelector(".reservationList").innerHTML += `<div class="deshboard-todo reservation" id="0">
							<div class="deshboard-todo-cell service">Texi</div>
							<div class="deshboard-todo-cell name">민기시치</div>
							<div class="deshboard-todo-cell phonNum">01052525252</div>
							<div class="deshboard-todo-cell time">종일</div>
						</div>`;
			}
		})
}


let reservation = document.querySelector("reservation");
