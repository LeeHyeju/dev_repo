<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <style>
		* {margin: 0; padding: 0;}
		table tr td {text-align: center;}
		table.back-block {border-spacing: 0; border-collapse: collapse; box-sizing: content-box; border: 1px solid #000;}
		table.back-block tr td {width: 40px; height: 40px; background-color: gray; border: 1px solid #000;}
		table.back-block tr td.block {background-color: purple;}
		table.back-block tr td.block0 {background-color: silver;}
		table.back-block tr td.block1 {background-color: yellow;}
		table.back-block tr td.block2 {background-color: brown;}
		table.back-block tr td.block3 {background-color: blue;}
		table.back-block tr td.block4 {background-color: green;}
		table.back-block tr td.block5 {background-color: red;}
		table.back-block tr td.block6 {background-color: hotpink;}
		table.back-block tr td.shadow {opacity: 0.6}
		
		#preview table {display: none;}
  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script> 
  <title>테트리스</title>
	<script>
		var Game = function(layer, canvas) {
			this.$table = undefined;
			this.$canvas = undefined;
			this.size = {x: 10, y: 10};
			this.blocks = [];
			this.fps = 1000 / 20;
			this.interval = -1;
			this.level = 0;
			this.score = 0; 
			this.listener = undefined; 
			this.pBlock = undefined; //미리보기 블럭 
			this.cBlock = undefined; //현재 블럭
			this.gameMode = Game.Util._play['STOP'];
			
			this.init(layer, canvas, 10, 20);
		};
		
		Game.prototype = {
			init: function(layer, canvas, sizeX, sizeY){
				this.$layer = $((typeof layer === 'object') ? layer : '#' + layer);
				this.$canvas = $((typeof layer === 'object') ? canvas : '#' + canvas); 
				this.size = {x: sizeX, y: sizeY};
				
				this.blocks = new Array(this.size.y);
				for (var y = 0; y < this.size.y; y++) {
					this.blocks[y] = new Array(this.size.x);
				}
			},
			makeCanvas: function() { //테트리스 화면 그리기 
				var table = [];
				table.push('<table class="back-block">');
				for (var y = 0; y < this.size.y; y++) {
					table.push('<tr>');
					for (var x = 0; x < this.size.x; x++) {
						table.push('<td x="' + x + '" y ="' + y + '"></td>');
					}
					table.push('</tr>');
				}
				table.push('</table>');
			
			this.$layer.html(table.join(''));
			
			this.$canvas.css({background: 'gray'}); //canvas css 
			this.ctx = this.$canvas.get(0).getContext('2d'); //2d 영역을 그리는 canvas rendering contexts
			},
			clear: function() { //한 줄 삭제
				this.$layer.find('table tr td').attr('class', '');
				//사각형 영역을 지우는 canvas method
				this.ctx.clearRect(0, 0, this.size.x * 20, this.size.y *20);
			},
			draw: function() { //그리기
				this.clear();
				
				this.ctx.strokeStyle = "rgb(0,0,0)"; //도형의 윤곽선 색을 설정하는 canvas style
				this.ctx.fillStyle ="purple"; //도형을 채우는 색을 설정하는 canvas style
				
				for (var y = 0; y < this.size.y; y++) {
					for (var x = 0; x < this.size.x; x++) {
						if (this.blocks[y][x]) {
							this.$layer.find('table tr').eq(y).find('td').eq(x).attr('class', 'block');
							
							var bounds = this.blocks[y][x].getBounds();  //canvas
							this.ctx.strokeRect((x * 20), (y * 20), bounds.w, bounds.h); //사각형 영역을 그리는 canvas method 
							this.ctx.fillRect((x * 20), (y * 20), bounds.w, bounds.h); //사각형 도형의 색을 채우는 canvas method 
						}
					}
				}				
				
				if (this.cBlock) this.cBlock.draw(this.$layer, this.ctx); 
			},
			round: function() { //난이도&속도
				this.level = 1; 
				this.speed();
			},
			keyEvent: function(key) { //키보드 자판 누를 때 방향키 설정 
				if ( this.gameMode != Game.Util._play['START']) return;
				//게임 시 키 설정 
				if (key == 'RIGHT') this.cBlock.moveTo(1, 0, 0);	
				else if (key == 'LEFT') this.cBlock.moveTo(-1, 0, 0);
				else if (key == 'UP') this.cBlock.moveTo(0, 0, 1);
				else if (key == 'DOWN') this.cBlock.moveTo(0, 1, 0);
				else if (key == 'SPACE') {
					this.cBlock.moveSpace();
					this.appendBlock();
				}
 			},
 			keyEvent: function(key) { //키보드 자판 누를 때 방향키 설정 
				if ( this.gameMode != Game.Util._play['START']) return;
				//게임 시 키 설정 
				if (key == 'RIGHT') this.cBlock.moveTo(1, 0, 0);	
				else if (key == 'LEFT') this.cBlock.moveTo(-1, 0, 0);
				else if (key == 'UP') this.cBlock.moveTo(0, 0, 1);
				else if (key == 'DOWN') this.cBlock.moveTo(0, 1, 0);
				else if (key == 'SPACE') {
					this.cBlock.moveSpace();
					this.appendBlock();
				}
 			},
			clearBlock: function() { 
				var y = 0;
				do {
					var canClear = true;
					for (var x = 0; x < this.blocks[y].length; x++) {
						if (!this.blocks[y][x]) {
							canClear = false; 
						}
					}
					
					if (canClear) this.blocks.splice(y--, 1);
					y++;
				} while (y < this.blocks.length);
				
				var clearCount = this.size.y - this.blocks.length; 
				for (var y = 0; y < clearCount; y++) {
					this.blocks.splice(0, 0, new Array(this.size.x));
				}
				
				var score = Game.Util.score[clearCount];
				this.addScore(score);
			},
			appendBlock: function() {
				var currentRects = this.cBlock.getCurrentRects();
				for (var k in currentRects) {
					var x = this.cBlock.getX() + currentRects[k].x; 
					var y = this.cBlock.getY() + currentRects[k].y;
					
					this.blocks[y][x] = currentRects[k];
				}
				this.clearBlock();
				this.makeBlock();
			}, 
			addScore: function(_score) { //점수가 쌓일때마다 해당 레벨 올라감 
				this.score += _score;
				                            
				var oldLevel = this.Level;
				
				if (this.score > 12000) this.level = 9;
				else if (this.score > 9500) this.level = 8;
				else if (this.score > 7000) this.level = 7;
				else if (this.score > 5000) this.level = 6;
				else if (this.score > 3500) this.level = 5;
				else if (this.score > 2000) this.level = 4;
				else if (this.score > 1000) this.level = 3;
				else if (this.score > 500) this.level = 2;
				
				if (oldLevel < this.level && typeof this.listener === 'function') this.listener('level' + this.level);
			},
			speed: function() { //속도 
				var that = this;
				setTimeout(function() {
					if (that.gameMode == Game.Util._play['START']) {
						if (that.cBlock) {
							var moveTo = that.cBlock.moveTo(0, 1, 0);
							if (!moveTo) {
								that.appendBlock();
							}
						}
					}
					that.speed();
				}, 1000 * 3 / (that.level * (3)));
				//if(typeof this.listener === 'function') this.listener('speed=' + (1000 * 3 / (this.level * (1.3)))); 
			},
			start: function(listener) { //게임 시작 
				this.listener = listener;
				if (typeof this.listener === 'function') this.listener('start'); 
				
				this.gameMode = Game.Util._play['START'];
				this.makeCanvas();
				this.makeBlock();
				this.round();
				
				var that = this;
				this.interval = setInterval(function(){
					that.draw();
				}, this.fps);
				
				$('body').off('keydown').on('keydown', function(e){
                    
					var key = Game.Util.getKey(e);
					if (key) that.keyEvent(key);
				}).focus();				
			}, 
			stop: function() { //중지
				clearInterval(this.interval);
				this.gameMode = Game.Util._play['STOP'];
				if (typeof this.listener === 'function') this.listener('stop'); 
			},
			pause: function() { //일시정지
				this.gameMode = Game.Util._play['PAUSE'];
				if (typeof this.listener === 'function') this.listener('pause');
			},
			resume: function() { //재시작
				this.gameMode = Game.Util._play['START'];
				if (typeof this.listener === 'function') this.listener('resume');
			}
		};
		
		Game.Block = function(_game, _type, _x, _y) {
			this.game = _game;
			this.rects = [];
			this.type = 0;
			this.loc = {x: 0, y: 0};
			this.rotate = 0; 
			
			this.init(_type, _x, _y);
		};
		
		Game.Block.prototype = {
			init: function(_type, _x, _y) {
				this.type = _type; 
				this.loc.x = _x; 
				this.loc.y = _y;
				
				var blockLocations = Game.Util._blocks[this.type];
				for (var l in blockLocations) {
					this.rects.push([
						new Game.Rect(blockLocations[l][0][0], blockLocations[l][0][1], 20, 20), 
						new Game.Rect(blockLocations[l][1][0], blockLocations[l][1][1], 20, 20), 
						new Game.Rect(blockLocations[l][2][0], blockLocations[l][2][1], 20, 20), 
						new Game.Rect(blockLocations[l][3][0], blockLocations[l][3][1], 20, 20) 
					]);
				}
			},
			getRectCount: function() {
				return this.rects.length;
			},
			draw: function($layer, ctx) { 
				var $table = $layer.find('table');
				var currentRects = this.getCurrentRects();
				
				var x = this.getX() * 20; //canvas 
				var y = this.getY() * 20; //canvas 
				
				var shadowY = this.getShadowY(); //블럭 그림자
				for (var k in currentRects) {
					$table.find('tr').eq(shadowY + currentRects[k].y).find('td').eq(this.getX() + currentRects[k].x).attr('class', 'shadow block' + this.type);
					
					var bounds = currentRects[k].getBounds(); //canvas 
					ctx.strokeRect(x + bounds.x, (shadowY * 20) + bounds.y, bounds.w, bounds.h);  //canvas 
                    ctx.fillStyle = 'rgba(200, 166, 0, 0.6)'; //canvas
					ctx.fillRect(x + bounds.x, (shadowY * 20) + bounds.y, bounds.w, bounds.h); //canvas 
				}

                var colors = ['silver', 'yellow', 'brown', 'blue', 'red', 'hotpink']; //canvas

                ctx.fillStyle = colors[this.type]; //canvas
                for (var k in currentRects) {
                    $table.find('tr').eq(this.getY() + currentRects[k].y).find('td').eq(this.getX() + currentRects[k].x).attr('class', 'block' + this.type);
                    
                    var bounds = currentRects[k].getBounds(); //canvas 
					ctx.strokeRect(x + bounds.x, y + bounds.y, bounds.w, bounds.h);  //canvas 
					ctx.fillRect(x + bounds.x, (shadowY * 20) + bounds.y, bounds.w, bounds.h); //canvas 

                }
			},
			getX: function() {
				return this.loc.x; 
			},
			setX: function(_x) {
				this.loc.x = _x; 
			}, 
			getY: function() {
				return this.loc.y; 
			},
			setY: function(_y) {
				this.loc.y = _y;
			},
			getRotate: function() {
				return this.rotate; 
			}, 
			setRotate: function(r) {
				this.rotate = r;
			},
			reviseMoveTo: function(_x, _y, _r) {
				var xx = this.getX() + _x; 
				var yy = this.getY() + _y; 
				var rr = this.rotate + _r; 
			
				var currentRects = this.getCurrentRects(rr);
				if (_r > 0) {
					var minX = this.game.size.x, maxX = 0; 
                    for(var k in currentRects) {
						var rect = currentRects[k];
						minX = Math.min(minX, xx + rect.x);
						maxX = Math.max(maxX, xx+ rect.x);
					}
					
					if (minX <0)  xx = 0; 
					else if (maxX > this.game.size.x - 1) xx = this.game.size.x -1 (maxX - minX);
				}
				
				for (var k in currentRects) {
					var rect = currentRects[k];
					var use = Game.Util.isNullBlock(this.game.blocks, this.game.size.x, this.game.size.y, xx + rect.x, yy + rect.y);
					if (!use) {
						xx = this.getX();
						yy = this.getY();
						rr = this.rotate;
						break;
					}
				}
				
				return {x: xx, y: yy, r: rr};
			},
			moveTo: function(_x, _y, _r) {
				var move = this.reviseMoveTo(_x, _y, _r);
				var cacheY = this.getY();
				
				this.setX(move.x);
				this.setY(move.y);
				this.setRotate(move.r);
				
				if (_y >0 && cacheY == this.getY()) return false;
				return true;
			},
            moveSpace: function() {
                while(this.moveTo(0, 1,0)) {
                    //True / false
                }
            },
			getCurrentRects: function(rotate) {
				return this.rects[(rotate || this.getRotate()) % this.getRectCount()];
			},
			getCurrentRect: function(index, rotate) {
				return this.getCurrentRects(rotate)[index];
			},
			getShadowY: function() {
                console.log('shadow');
				var x = this.getX();
				var y = this.getY();
				var shadowY = y;
				
				var currentRects = this.getCurrentRects(0);
				var use = true;
				do {
					for (var k in currentRects) {
						var rect = currentRects[k];
						use = Game.Util.isNullBlock(this.game.blocks, this.game.size.x, this.game.size.y, x + rect.x, shadowY + rect.y);
						if (!use) {
							break;
						}
					}
					if (!use) {
						break;
					}
					shadowY ++;
				} while (true);
				
				return shadowY - 1; 
			}
		};
		
		Game.Rect = function(_x, _y, _w, _h) {
			this.x = _x; 
			this.y = _y; 
			this.w = _w; 
			this.h = _h; 
			
			this.getBounds = function() {
				return {x: (this.x * this.w), y: (this.y * this.h), w: this.w, h: this.h};
			}
		};
		
		Game.Util = {
			_blocks: [ //블럭 배열
				[
                    [[0,1],[1,1],[2,1],[3,1]],
                    [[1,0],[1,1],[1,2],[1,3]]
                ], // ---- 
				[
                    [[0,0],[0,1],[1,1],[2,1]],
                    [[1,0],[2,0],[1,1],[1,2]],
                    [[0,0],[1,0],[2,0],[2,1]],
                    [[1,0],[1,1],[0,2],[1,2]]
                ], // ㄴ 1
				[
                    [[2,0],[0,1],[1,1],[2,1]],
                    [[1,0],[1,1],[1,2],[2,2]],
                    [[0,0],[1,0],[2,0],[0,1]],
                    [[1,0],[2,0],[2,1],[2,2]]
                ], //ㄴ 2
				[
                    [[1,0],[1,1],[2,0],[2,1]]
                ], //ㅁ
				[
                    [[0,0],[1,0],[1,1],[2,1]],
                    [[2,0],[1,1],[2,1],[1,2]]
                ], //ㄹ 1 
				[
                    [[1,0],[2,0],[0,1],[1,1]],
                    [[1,0],[1,1],[2,1],[2,2]]
                ], //ㄹ 2 
				[
                    [[1,0],[1,1],[2,1],[1,2]],
                    [[0,0],[1,0],[2,0],[1,1]],
                    [[2,0],[1,1],[2,1],[2,2]],
                    [[1,0],[0,1],[1,1],[2,1]]
                ] // ㅏ 
			], 
			_play: {START: 1, STOP: 0}, 
			score: [1, 10, 10 * 2 * 2, 10 * 3 * 5, 10 * 4 * 10],
			getKey: function(e) {
				var keyCode = e.keyCode;
				var keyName = null;
				switch(keyCode) {
					case 32: keyName = 'SPACE'; break;
					case 39: keyName = 'RIGHT'; break;
					case 37: keyName = 'LEFT'; break;
					case 40: keyName = 'DOWN'; break;
					case 38: keyName = 'UP'; break;
                    default: break; 
				}
                console.log(keyName);
				return keyName;
			},
			createBlock: function(game) {
				var random = Math.floor( Math.random() * 7);
				return new Game.Block(game, random, 3, 0);
			},
			toNumber: function(val) {
				return ~~new String(val);
			}, 
			isNullBlock: function(blocks, sizeX, sizeY, x, y) {
				if (y < 0 || y > sizeY -1) return false; 
				if (x < 0 || x > sizeX -1) return false; 
				
				return !blocks[y][x];
			}, 
			existsTopBlockX: function(blocks) {
				var exist = false; 
				for (var x = 0; x < blocks[0].length; x++) {
					if (blocks[0][x]) {
						exist = true;
						break;
					}
				}
				return exist; 
			}
		};
	</script>
 </head>
 <body>
	<div id="draw" style="display: inline-block;"></div>
	<div style="display: inline-block;"><canvas id="canvas" width="200" height="400" ></canvas></div>
	<div id="score" style="display: block;"></div>
	<div>
		<input type="button" id="button"  onclick="onStop();" value="일시정지">
	</div>
	<div id="preview">
		<table id="preview0">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>X</td>
				<td>X</td>
				<td>X</td>
				<td>X</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<table id="preview1">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>X</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>X</td>
				<td>X</td>
				<td>X</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<table id="preview2">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>X</td>
				<td></td>
			</tr>
			<tr>
				<td>X</td>
				<td>X</td>
				<td>X</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<table id="preview3">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>X</td>
				<td>X</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>X</td>
				<td>X</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<table id="preview4">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>X</td>
				<td>X</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>X</td>
				<td>X</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<table id="preview5">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>X</td>
				<td>X</td>
			</tr>
			<tr>
				<td></td>
				<td>X</td>
				<td>X</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<table id="preview6">
			<tr>
				<td></td>
				<td>X</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>X</td>
				<td>X</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>X</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>													
	</div>
	<input type="time" pattern="([1]?[0-9]|2[0-3]):[0-5][0-9]"> <!-- 시간에 대한 정규 표현식 -->
	<script>
		var game1 = new Game('draw', 'canvas');
		game1.start(function(action) {
			console.log(arguments);
			if (action == "preview") { 
				var id = 'preview' + arguments[1].type;
				
				$('#preview table').hide();
				$('#preview table#' + id).show();
			}
			if (arguments[1] && arguments[1].game) {
				$('#score').html('레벨: '+arguments[1].game.level + ' | 점수: ' + arguments[1].game.score);
			}
		});
		
		function onStop() {
			var $button = $('#button');
			if (game1.gameMode == Game.Util._play['START']) {
				game1.pause();
				$button.val('재시작');
			}else {
				game1.resume();
				$button.val('일시정지');
			}
		}
	</script>
 </body>
</html>