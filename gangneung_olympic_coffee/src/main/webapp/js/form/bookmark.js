/**
 * 사용자가 본 상점을 WebDB를 이용하여 저장합니다.
 * 추후 사이트가 완성되면 용도에 맞게 수정할 예정
 * @author 신승엽
 */
function toTable(bookmark) {
	return "<tr><td>" + bookmark.id + "</td><td><button onclick='deleteBookmark(" + bookmark.no + ");'>삭제</button></td></tr>";
}

// 데이터베이스 생성 및 오픈
var db = null;
function openDB() {
	//DB 연결 요청, IDBOpenDBRequest 객체 반환(실제 DB사용 할수 있음)
	var request = window.indexedDB.open("bookmarkDB", 1);

	// 지정한 버전의 DB가 없을 경우 발생하는 이벤트(DB 생성시) 
	request.onupgradeneeded = function() {
		console.log("DB 생성 성공.");
		db = request.result;
		createObjectStore();
	};

	// DB 오픈에 성공할 경우 발생하는 이벤트
	request.onsuccess = function() {
		console.log("DB 오픈 성공.");
		db = request.result;
		listBookmark();
	};

	// 작업 실패시 발생하는 이벤트
	request.onerror = function(err) {
		console.error(err);
	};
}

// Object Store 생성 : RDB의 table과 흡사
function createObjectStore() {
	//접속된 DB에 bookmark 라는 이름의 객체 생성 : db에 insert 로직으로 간주
	db.createObjectStore("bookmark", {
		keyPath : "no",
		autoIncrement : true
	});
	console.log("bookmark Store 생성 성공.");
}

// 북마크 등록
function insertBookmark() {
	var id = document.getElementById("id").value;

	// Bookmark Object
	var bobj = new Object();
	bobj.id = id;


	// 1. 트랜젝션 시작(저장을 위한 작업 시작)
	//readwrite : tx모드
	var tx = db.transaction("bookmark", "readwrite");

	// 2. 작업 실행 : 저장
	var bookmarkStore = tx.objectStore("bookmark");
	bookmarkStore.add(bobj);

	// 3. 결과 처리
	tx.oncomplete = function() {
		console.log("북마크 등록 성공.");
		listBookmark();
	};
}

// 북마크 목록 조회
function listBookmark() {
	var trList = "";

	// 1. 트랜젝션 시작
	var tx = db.transaction("bookmark", "readonly");

	// 2. 작업 실행
	var bookmarkStore = tx.objectStore("bookmark");
	var request = bookmarkStore.openCursor();

	// 3. 결과 처리
	request.onsuccess = function() {
		var cursor = request.result;
		if (cursor) {
			// 데이터가 존재할 경우
			var bookmark = cursor.value;
			trList += toTable(bookmark);
			cursor.continue(); // 커서를 다음 Object로 이동
		} else {
			// 데이터가 더이상 없을 경우
			document.querySelector("#bookmarkList > tbody").innerHTML = trList;
		}
	};
}

// 북마크 삭제
function deleteBookmark(no) {
	// 1. 트랜젝션 시작
	var tx = db.transaction("bookmark", "readwrite");

	// 2. 작업 실행
	var bookmarkStore = tx.objectStore("bookmark");
	bookmarkStore.delete(no);

	// 3. 결과 처리
	tx.oncomplete = function() {
		console.log("북마크 삭제 성공.");
		listBookmark();
	};
}


window.onload = function() {
	openDB();
	document.getElementById("addBookmark").onclick = function() {
		insertBookmark();
	}
}