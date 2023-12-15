






        // 모달 열기
        function openModal() {
            document.getElementById('myModal').style.display = 'flex';
            document.getElementById('myModal-tbl').style.display = 'flex';
        }










        // 모달 닫기
        function closeModal() {
            document.getElementById('myModal').style.display = 'none';
            document.getElementById('myModal-tbl').style.display = 'none';
        }





        // 모달 외부 클릭 시 모달 닫기
        window.onclick = function(event) {
            if (event.target == document.getElementById('myModal')) {
                closeModal();
            }
        }








