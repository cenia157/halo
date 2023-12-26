function getDataA(q_seq, q_title, q_content, q_reg_date, q_contact_number, q_email, q_name, q_password, q_category) {
    console.log(q_seq);

    // Ajax 요청
    $.ajax({
        url: "GetDataC",
        dataType: "json",
        data: {
            q_seq: q_seq,
            q_title: q_title,
            q_content: q_content,
            q_reg_date: q_reg_date,
            q_contact_number: q_contact_number,
            q_email: q_email,
            q_name: q_name,
            q_password: q_password,
            q_category: q_category
        },
        success: function (data) {
            try {
                console.log("Data:", data);

					if (Array.isArray(data) && data.length > 0) {
					    let qSeq = data[0].q_seq;
					    let qTitle = data[0].q_title;
					    let qContent = data[0].q_content;
					    let qRegDate = new Date(data[0].q_reg_date);
					    let formattedDate = formatDate(qRegDate);
					    let qCN = data[0].q_contact_number;
					    let qEmail = data[0].q_q_email;
					    let qName = data[0].q_name;
					    let qPW = data[0].q_password;
					    let qCategory = data[0].q_category;
					    
					    console.log("firstTitle: ", qSeq);
					    $('#QUESTION_TITLE').html(qTitle);
					    $('#QUESTION_DATE').html(formattedDate);
					    $('#QUESTION_NAME').html(qName);
					    $('#QUESTION_CONTENT').html(qContent);
//					    확인용
					    $('#QUESTION_SEQ').html(qSeq);
					} else {
					    console.error("데이터가 비어있거나 배열이 아닙니다.");
					}
	
			if(c_comment_content != null){
                openModalA();
			} else {
				openModalN();
			}
                
            } catch (error) {
                console.error("데이터 처리 오류:", error);
            }
        },
        error: function (xhr, status, error) {
            console.log("에러:", xhr, status, error);
        }
    });
}




//날짜 바꾸기
function formatDate(date) {
    const pad = (num) => (num < 10 ? '0' + num : num);

    const year = date.getFullYear();
    const month = pad(date.getMonth() + 1);
    const day = pad(date.getDate());

    return `${year}-${month}-${day}`;
}

