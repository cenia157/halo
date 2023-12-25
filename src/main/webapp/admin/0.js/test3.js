function getData(n) {
    let q_seq = n;
    console.log(q_seq);

    // Ajax 요청
    $.ajax({
        url: "GetDataC",
        dataType: "json",
        data: {
            q_seq: q_seq
        },
        success: function (data) {
            try {
                console.log("Data:", data);

                // q_title이 배열인 경우
                if (Array.isArray(data.q_title) && data.q_title.length > 0) {
                    // 첫 번째 요소만 가져와서 모달에 나타냄
                    let firstTitle = data.q_title[1];
                    $('#QUESTION_CONTENT').html(`<p><strong>Question Title:</strong> ${firstTitle}</p>`);
                } else {
                    // q_title이 배열이 아닌 경우
                    $('#QUESTION_CONTENT').html(`<p><strong>Question Title:</strong> ${data.q_title}</p>`);
                }

                openModalA();
                // 데이터를 받아서 화면에 출력
            } catch (error) {
                console.error("데이터 처리 오류:", error);
            }
        },
        error: function (xhr, status, error) {
            console.log("에러:", xhr, status, error);
        }
    });
}

