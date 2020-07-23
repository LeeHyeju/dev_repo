<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <style>
  		table {border-spacing: 0; border-collapse: collapse; box-sizing: content-box; border: solid 1px #000; }
  		table td {border: 1px solid #000; width: 80px; height: 80px; text-align: center; font-size: 24px;}
  		table td div{width: 100%; height: 100%;}
  		table td.snake div{background: #00ff00; border-radius: 30px; box-sizing: content-box; border: solid 1px #000;}
  		table td.snake-head div{background: #ff0000; border-radius: 50px; box-sizing: content-box; border: solid 1px #000;}
		table td.snake-head div::before{content: '◐_◐';}
		table td.feed div{background: orange;}
  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script> 
  <title>지렁이 게임</title>
  	<!-- 지렁이 게임 규칙
		1. 게임판을 화면에 그린다. (11×11)
		2. 먹이 
			2-1. 중복되지 않은 위치에 색칠된 네모칸 그리기
			2-2. 스테이지가 진행될 수록 먹이의 수가 증가(1단계 : 4 -> 2단계: 6)
	 	3. 뱀 
	 		3-1. 시작위치 :  정중앙, 오른쪽으로 이동함  
	 		3-2. 조작 방법 : 키보드 방향키 사용 
	 		3-3. 속도 : 스테이지가 증가할 수록 빨라짐  
	 		3-4. 이동 : 머리만 있을 때, 이동방향(오른쪽)의 반대쪽으로도 이동 가능 
	 	4. 점수 
	 		스테이지 * 먹이 수
	 	5. 게임 종료 : 벽이나 자신의 꼬리에 부딪치면 죽는다.
	 -->
 </head>
 <body>
	<div id='div'></div>
 </body>
 	<script>
 		//게임판 그리기 
 		var row = 11;
 		var col = 11;
 		var stage = 1; //최조 스테이지 
 		var feedLoc = []; //먹이 배열
 		var snakeLoc = []; //뱀 배열
 		var action = 'RIGHT'; //뱀 진행방향
 		
 		function init() {
 			feed(); //먹이
 			snake(); //뱀
 			draw(); //화면 
 			
 			//뱀 키보드 이동
 			$(document).on('keydown', function(){
 				console.log(e.keyCode);
 				//←(37)↑(38)→(39)↓(40)
 				if (e.keyCode == 37) {
 					//뱀 길이가 1개 이상일 때 반대방향으로 진행하는 것을 막는다.
					if (action == "RIGHT" && snake.size > 1) { 
						return;
					}
					action =="LEFT";
				} else if (e.keyCode == 38) {
					if (action == "DOWN" && snake.size > 1) {
						return;
					}
					action == "TOP";
				} else if (e.keyCode == 39) {
					if (action == "LEFT" && snake.size > 1) {
						return;
					}
					action == "RIGHT";
				} else if (e.keyCode == 40) {
					if (action == "TOP" && snake.size > 1) {
						return;
					}
					action == "DOWN";
				}
 			});
 		}
 		
 		//화면 그리기
 		function draw() {
 			var move = snakeMove(); 
 			console.log("action:", action, "move:" , move);
 			
 		}
 		
 		//뱀 이동시키기
 		function snakeMove() {
 			//뱀 머리
 			var snakeHead = snakeLoc[0]; 
 			//뱀 머리 좌표
 			var headX = snakeHead.x;
 			var headY = snakeHead.y;
 			//키보드 방향키 클릭 시 이동할 좌표를 구함
 			if (action == "LEFT") {
				headX -= 1; 
			} else if (action == "RIGHT") {
				headX += 1; 
			} else if (action == "TOP") {
				headY -= 1; 
			} else if (action == "DOWN") {
				headY += 1; 
			}
 			
	 		//이동할 좌표가 화면 안에 존재하는 좌표인지 확인 
	 		if ( !(0<= headX && headX < col 
	 			&& 0 <= headY && headY < row)) { //해당 rol와 col 길이를 넘지 않고 0보다는 커야 한다
				return {state: 0}; // 뱀 이동 불가 
			}
	 		
	 		//이동할 좌표가 뱀인지 확인 
	 		var isSnake = false;
	 		for (var i = 1; i < snakeLoc.length; i++) { //snakeHead가 0이므로 1부터 시작
				console.log(headX, headY, snakeLoc[i].x, snakeLoc[i].y);
				if (snakeLoc[i],x == headX && snakeLoc[i].y == headY) { //좌표가 같으면 true
					isSnake = true; 
					break;
				}
	 		}
	 		if (isSnake) return {stage:0};

	 		//이동할 좌표가 먹이인지 확인
	 		var isFeed = false;
	 		var feedIndex = -1; 
	 		for (var i = 0; i < feedLoc.length; i++) { 
	 			if (feedLoc[i].x == headX && feedLoc[i].y == headY) { //좌표가 같으면 true
					isFeed = true; 
					feedIndex = i;
					break;
				}
			}
	 		
			if (isFeed) return {state: 1, x: headX, y: headY, idx: feedIndex} ; 
			
			return {state: 2, x: headX, y: headY};			
 		}
			
		//먹이 
		function feed() {
			var feed = 1 + ( 2 * stage ); //스테이지 증가 시 먹이도 증가 
			feedLoc = [];
			//먹이는 랜덤으로 자동 생성 
			for (var i = 0; i < feed; i++) {
				var feedX = Math.floor(Math.random() * row);
				var feedY = Math.floor(Math.random() * col);
				var overlap = false; 
				
				//먹이좌표가 중복되는지 유무
				for (var j = 0; j < feedLoc.length; j++) {
					if (feedLoc[j].x == headX && feedLoc[j].y == headY) {
						overlap = true; 
						break; 
				}
			}
				//생성된 먹이와 뱀의 좌표가 중복되는지 유무
				if (!overlap) { 
					for (var s = 0; s < snakeLoc.length; s++) {
						if (snakeLoc[s].x == feedX && snakeLoc[s].y == feedY) {
							overlap = true; 
							break;
						}
					}
				}
			
				if (!overlap) {
					feedLoc[i] = {x : feedX, y : feedY}; //좌표에 먹이 그리기
				} else {
					i--;
				}
			}
		}
 		
		function snake() { //뱀 생성하기
			var snakeX = 5; 
			var snakeY = 5; 
			snakeLoc[0] = {x: snakeX, y:snakeY};
		}
		
		//게임판 그리기
 		function drawBg() {
 			//테이블 생성
 			var table = "<table>";
 			for (var r = 0; r < row; r++) {
				table += "<tr>";
				for (var c = 0; c < col; c++) {
					table += "<td id='td_"+ c +"_"+ r + "></div>"; 
					
					table += "</div></td>";
				}
				table += "</tr>";
			}
 			table += "</table>";
 			
 			$('#div'),html(table);
 			
	 			//먹이를 그린다
	 			for (var i = 0; i < feedLoc.length; i++) {
	 				var feedX = feedLoc[i].x; 
	 				var feedY = feedLoc[i].y;
	 				$('#td_'+ feedX + '_' + feedY).attr('class', 'feed');
				}
 			//뱀을 그린다
 				for (var j = 0; j < snakeLoc.length; j++) {
	 				var snakeX = snakeLoc[j].x; 
	 				var snakeY = snakeLoc[j].y;
	 				$('#td_'+ snakeX + '_' + snakeY).attr('class', i ==0? 'snake-head' : 'snake');
				}
 		}
		init();
 	</script>
</html>