document.addEventListener('DOMContentLoaded', function() {
    fetch('TodayReservationInfo')
        .then(response => response.json())
        .then(data => {
            empdata = data;
            let eachDay = null;
            console.log(data);
            const today = new Date();
            const year = today.getFullYear();
            const month = String(today.getMonth() + 1);
            const day = String(today.getDate());

            const formattedToday = `${year}-${month}-${day}`;
            console.log(formattedToday);

            for (let i = 0; i < data.length; i++) {
                // 쉼표를 기준으로 데이터 분리
                const dataArray = data[i].dates.split(',');

                // 각 데이터를 개행 문자와 함께 출력
                console.log('year : ' + year);
                console.log('month : ' + month);
                console.log('day1 : ' + day);
                console.log('data[i].month : ' + data[i].month);

                dataArray.forEach(item => {
                    if (year == data[i].year && month == data[i].month && day == item) {
                        eachDay = item;
                    }
                });

                console.log(eachDay == day);
                console.log('확인1 : ' + eachDay);
                console.log('확인2 : ' + day);

                let formatteddate = data[i].year + '-' + data[i].month + '-' + eachDay;

                console.log(formatteddate == formattedToday);
                if (formatteddate == formattedToday) {
                    let time = '終日';
                    if (data[i].time == 'AM') {
                        time = '午前';
                    } else if (data[i].time == 'PM') {
                        time = '午後';
                    }
					console.log('qqqqqqqqqqqqqqqq')
                    document.querySelector(".reservationList").innerHTML += `<div class="deshboard-todo reservation" id="${i}">
                        <div class="deshboard-todo-cell service">${data[i].service}</div>
                        <div class="deshboard-todo-cell name">${data[i].userName}</div>
                        <div class="deshboard-todo-cell phonNum">${data[i].phoneNumber}</div>
                        <div class="deshboard-todo-cell time">${time}</div>
                    </div>`;
                }
            }
        });
});
