// 댓글 등록시 bno, writer, content
document.getElementById("cmtAddBtn").addEventListener('click', () => {
     const cmtText = document.getElementById('cmtText').value;
     console.log(cmtText);
     if (cmtText == null || cmtText == "") {
          alert('댓글을 입력해주세요.');
          return false;
     } else {
          let cmtData = {
               bno: bnoVal,
               writer: document.getElementById('cmtWriter').value,
               content: cmtText
          };
          // 전송 function 호출
          postCommentToServer(cmtData).then(result => {
               if (result > 0) {
                    alert("댓글 등록 성공~!!");
               } else {
                    alert("댓글 등록 실패~!!");
               }
               printCommentList(cmtData.bno);
          });
     }
})

async function postCommentToServer(cmtData) {
     try {
          const url = "/cmt/post";
          const config = {
               method: 'post',
               headers: {
                    'Content-Type': 'application/json; charset=utf-8'
               },
               body: JSON.stringify(cmtData)
          };
          const resp = await fetch(url, config);
          const result = await resp.text(); // 0 또는 1 (isOk)
          return result;
     } catch (error) {
          console.log(error);
     }
}

function spreadCommentList(result) { // result 댓글 list
     console.log(result);
     let div = document.getElementById('accordionExample');
     div.innerHTML = "";
     for (let i = 0; i < result.length; i++) {
          let str = `<div class="accordion-item">`;
          str += `<h2 class="accordion-header" id="heading${i}">`;
          str += `<button class="accordion-button" type="button"`;
          str += `data-bs-toggle="collapse" data-bs-target="#collapse${i}"`;
          str += `aria-expanded="true" aria-controls="collapse${i}">`;
          str += `${result[i].cno}, ${result[i].writer}, ${result[i].regdate}`;
          str += `</button> </h2>`;
          str += `<div id="collapse${i}" class="accordion-collapse collapse show"`;
          str += `data-bs-parent="#accordionExample">`;
          str += `<div class="accordion-body">`;
          str += `<input type="text" class="form-control" id="cmtText" value="${result[i].content}">`;
          str += `<button type="button" data-cno="${result[i].cno}" data-writer="${result[i].writer}" class="btn btn-outline-warning cmtModBtn">%</button>`;
          str += `<button type="button" data-cno="${result[i].cno}" class="btn btn-outline-danger cmtDelBtn">X</button>`;
          str += `</div> </div> </div>`;
          div.innerHTML += str; // 누적해서 담기
     }

}

// 수정, 삭제 버튼 확인
document.addEventListener('click',(e) =>{
	console.log(e.target);
	if(e.target.classList.contains('cmtModBtn')){
		let cno = e.target.dataset.cno;
		console.log(cno);
		
		// 수정 구현 (수정할 데이터를 객체로 생성 -> 컨트롤러에서 수정 요청)
		let div = e.target.closest('div'); // 타겟을 기준으로 가장 가까운 div 찾기
		let cmtText = div.querySelector('#cmtText').value;
		let writer = e.target.dataset.writer;
		
		// 비동기통신 함수 호출 -> 처리
		updateCommentFromServer(cno, writer, cmtText).then(result=>{
			if(result > 0){
				alert('댓글 수정 성공~!!');
				printCommentList(bnoVal);
			}else{
				alert('댓글 수정 실패~!!');
			}
		})
	}
	if(e.target.classList.contains('cmtDelBtn')){
		let cno = e.target.dataset.cno;
		console.log(cno);
		
		// 삭제 구현
		removeCommentFromServer(cno).then(result=>{
			if(result > 0){
				alert('댓글 삭제 성공!!');
				printCommentList(bnoVal);
			}else{
				alert('댓글 삭제 실패!!');
			}
		})
	}
})

async function updateCommentFromServer(cnoVal, cmtWriter, cmtText){
	try{
		const url = '/cmt/modify';
		const config = {
			method: 'post',
			headers: {
				'Content-Type':'application.json; charset=utf-8'
			},
			body:JSON.stringify({cno:cnoVal, writer:cmtWriter, content:cmtText})
		}
		
		const resp = await fetch(url, config);
		const result = await resp.text();
		return result;
	}catch(error){
		console.log(error);
	}
}

async function removeCommentFromServer(cno){
	try{
		const resp = await fetch('/cmt/remove/'+cno);
		const result = await resp.text();
		return result;
		
	}catch(error){
		console.log(error);
	}
}




// 서버에 댓글 리스트를 달라고 요청
async function getCommentListFromServer(bno) {
     try {
          const resp = await fetch('/cmt/list/' + bno); // cmt/list/151
          const result = await resp.json();
          return result;
     } catch (error) {
          console.log(error);
     }
}

function printCommentList(bno) {
     getCommentListFromServer(bno).then(result => {
          console.log(result);
          if (result.length > 0) {
               spreadCommentList(result);
          } else {
               let div = document.getElementById('accordionExample');
               div.innerHTML = `comment가 없습니다.`;
          }
     });
}