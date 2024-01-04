function loadFAQDetailContent(qa_seq, qa_title, qa_content, qa_reg_date){
	$.ajax({
		url: "LoadFAQDetailContentC",
		dataType: "json",
		type: "post",
		data:{
			qa_seq: qa_seq,
			qa_title: qa_title,
			qa_content: qa_content,
			qa_reg_date: qa_reg_date
		},
		success: function(data1){
			console.log("data1: ",data1);
			$.ajax({
				url: "user/qa/faq/faqDetail.jsp",
				type: "POST",
				dataType: "html",
				success: function(data2){
					console.log("data2: ", data2);
					$('.faqDetailContainer').html(data1 + data2);
				},
				error: function(xhr, status, error){
					console.error("faqDetail.jsp 로드오류: ", status, error);
				}
			});
			
		},
		error: function(xhr, status, error){
			console.error("LoadFAQDetailC 로드 오류: ", status, error)
		}
		
	});
	
}