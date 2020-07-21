<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <style>
  		table {border-spacing: 0; border-collapse: collapse; box-sizing: content-box; border: solid 1px #000; }
  		table td {border: 1px solid #000; width: 80px; height: 80px; text-align: center; font-size: 24px;}
  		table td .block-player1 {background: red;}
  		table td .block-player1 .highlight {background: #980000;}
  		table td .block-player2 {background: blue;}
  		table td .block-player2 .highlight {background: #050099;}
  		table td .block .highlight1 {background: #ccc;}
  		table td .block .highlight2 {background: #eee;}
  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script> 
  <title>바이러스 게임</title>
  	<!-- 바이러스 게임 규칙
		1. 게임판
			7×7 게임판을 만든다. 
			게임판은 2차원배열 사용하고, 게임은 턴제로 운영된다. 
			*이차원 배열 :  virusBlocks
			**Type : none, player1, player2
			**Tern : tern % 2 == 0? red : blue
			
		2. 	셀 채우기
			2-1. 플레이어 
			player 블럭에 클릭 이벤트 적용(해당 player 턴이 아니면 클릭 불가)
			player1(red)는 y좌표 0번째 위치의 모든 셀을 채운다. 
			player2(blue)는 y좌표 마지막 위치의 모든 셀을 채운다. 
			**virusBlocks[0][player1로 채움]
			**virusBlocks[virusBlocks.length - 1 ][player2로 채움]
			
			2-2. 블럭 선택하기
			클릭한 위치를 기준으로 상하좌우 1칸, 2칸 선택 가능
			선택 블럭 기준, 상하좌우 1칸에 해당하는 빈 배열의 색상을 진회색으로 변경 
			(현재 위치에서 x,y -> x-1, y-1 과 x+1, y-1에 해당)
		 	선택 블럭 기준, 상하좌우 2칸에 해당하는 빈 배열의 색상을 연회색으로 변경 
			(현재 위치에서  x,y -> x-2, y-2 와 x+2, y-2에 해당)
						
			2-3. 감염시키기
			상대 블럭이나 빈 블럭을 해당 player 블럭으로 채운다
			선택된 블럭의 색상을 해당 턴의 player 색상으로 변경.
			진회색 클릭 시 감염 (회색 -> 파란색)
			연회색 클릭 시 이동 (흰색 -> 파란색으로 변경. 단, 파란색 -> 흰색으로 변경된 블럭은 클릭되면 안됨)
			이동된 블럭을 기준으로 상대 블럭이 존재할 시 감염
		
		3. 게임 종료 
			모든 블럭이 채워지거나, 이동 또는 감염시킬 블럭이 존재하지 않으면 게임 종료. 
			
		4. 승부
			종료 시점에 블럭 색깔이 많은 사람이 승자.
	 -->
 </head>
 <body>
	<div id="div"></div>
 </body>
 	<script>
 		var virus = {
 			tern: 0, //턴 수
 			row: 7,  
 			col: 7,
 			virusBlocks: [],
 			init: function() {
 				this.createGame(); //게임 생성 
 				this.draw(); //화면 그리기 
 			},
 			clearBlock: function(){ //블록 지우기
 				var that = this; 
 				//this는 새 함수를 호출하거나 범위 변경 시 자주 변경되므로 이를 사용하여 원래 값에 액세스 할 수 없음
 				//이에 대한 별칭(that)을 지정하면 원래 값에 계속 액세스 할 수 있습니다
 			 	
 				for (var r = 0; r < that.virusBlocks.length; r++) { //rows
					for (var c = 0; c < that.virusBlocks[r].length; c++) { //cols
						//row * col만큼 블록 색깔 초기화 
						that.virusBlocks[r][c].setHighlight('');
					}
				}
 			},
 			confirmFinish: function() { //승부 확인
 				var that = this; 
 				var score = [0, 0, 0]; //BG, Player1, player2
 				
 				for (var r = 0; r < that.virusBlocks.length; r++) { //rows
					for (var c = 0; c < that.virusBlocks[r].length; c++) { //cols
						//row * col만큼 블록 색깔 초기화 
						score[that.virusBlocks[r][c].getType()] ++; //score에 player별 블록 담기 
					}
				}
 				return score[virus.util.type.BG] == 0; //score에 BG블록이 0개일 때 
 			}, 
 			canMove: function(type) { //이동 여부
 				var that = this; 
 				var move = false; //이동가능 
 			
 				for (var r = 0; r < that.virusBlocks.length; r++) { //rows
					for (var c = 0; c < that.virusBlocks[r].length; c++) { //cols
						if (that.virusBlocks[r][c].getType ==type) { //player type 일치 여부 
							if (can(c,r)) { //이동 가능하면 
								move = true;
								break;
							}
						}
					}
				}
 				return move;
 
 				function can(x,y) {  //감염 가능한 블럭 유무 확인
 					var move = false; 
 					for (var i = 0; i < virus.util.distance1Loc.length; i++) { //진회색블록
						var tx = x + virus.util.distance1Loc[i].x; 
 						var ty = y + virus.util.distance1Loc[i].y; 
 						if (tx > -1 && tx < that.virusBlocks[0].length 
							&& ty > -1 && ty < that.virusBlocks.length) { //좌표값이 유효한지 확인 
							var blocks = that.virusBlocks[ty][tx]; 
							if (block.getType() == virus.util.type.BG ) { //타입이 배경일때
								move = true;
							}
 						}
					}
 					if (!move) {
 	 					for (var i = 0; i < virus.util.distance1Loc.length; i++) { //진회색블록
 							var tx = x + virus.util.distance1Loc[i].x; 
 	 						var ty = y + virus.util.distance1Loc[i].y; 
 	 						if (tx > -1 && tx < that.virusBlocks[0].length 
 								&& ty > -1 && ty < that.virusBlocks.length) { //좌표값이 유효한지 확인 
 								var blocks = that.virusBlocks[ty][tx]; 
 								if (block.getType() == virus.util.type.BG ) { //타입이 배경일때
 									move = true;
 								}
 	 						}
 						}
					}
					return move; 					
 				}
 			},
 			
 		}
			
			/////바이러스 유틸 생성 
		virus.util = {
 				type: {BG: 0, PLAYER1: 1, PLAYER2: 2},
 				typeCss : ['block','block-player1','block-player2'],
 				//위치 좌표(진회색은 -1, 연회색은 -2)
 				// left&top(x-1, y-1) 	 || center&top (x, y-1)   || right&top (x+1, y-1)
 				// left&center(x-1, y) 		            	 	     || right&center (x+1, y)
 				// left&bottom(x-1, y+1)|| center&bottom(x,y+1)|| right&bottom(x+1, y+1)
 				distance1Loc: [{x: -1, y: -1}, {x: 0, y: -1}, {x: 1, y: -1}, {x: -1, y: 0}, {x: 1, y: 0}, {x: -1, y: 1}, {x: 0, y: 1}, {x: 1, y: 1}],
 				distance2Loc: [{x: -2, y: -2}, {x: 0, y: -2}, {x: 2, y: -2}, {x: -2, y: 0}, {x: 2, y: 0}, {x: -2, y: 2}, {x: 0, y: 2}, {x: 2, y: 2}]
 		};
 		
 		virus.block = function(x, y, type){
 			var _table;
 			var _x = x;
 			var _y = y;
 			var highlight = '';
 			
 			this.getBlock = function() {
 				return {x: _x, y: _y};
 			}
 			
 			this.getType = function() {
 				return _t; 
 			}
 			
 			this.setType = function() {
 				_t = type;
 				this.draw();
 			}
 			
 			this.getCss = function() {
 				return virus.util.typeCss[_t];
 			}
 			
 			this.draw = function($table) {
 				if ($table) {
					_table = $table; 
				}
 				var $target = _table.find('tr').eq(_y).find('td').eq(_x); //table에서 x, y 좌표 찾기 
 				$target.text(_x + ',' + +_y).attr('class', this.getCss());
 			
 				if (!!highlight) { //형타입 bool로 변경 (true/false 유무)
					$target.addClass(highlight);
				}
 			}
 			
 			this.setHighlight = function(_highlight) {
 				highlight = _highlight; 
 				this.draw();
 			}
 		}
 		
 		virus.init();
 	</script>
</html>