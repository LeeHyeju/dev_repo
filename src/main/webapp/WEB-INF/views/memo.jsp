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
		table.back-block tr td.block0 {background-color: sliver;}
		table.back-block tr td.block1 {background-color: yellow;}
		table.back-block tr td.block2 {background-color: brown;}
		table.back-block tr td.block3 {background-color: blue;}
		table.back-block tr td.block4 {background-color: green;}
		table.back-block tr td.block5 {background-color: red;}
		table.back-block tr td.block6 {background-color: hotpink;}
		tatable.back-block tr td.shadow {opacity: 0.6}
		
		#preview table {display: none;}
  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script> 
  <title>테트리스</title>
	<script>
		var Gmae = function(layer, canvas) {
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
		
		Game.protoType = {
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
			draw: function() {
				this.clear();
				
				this.ctx.strokeStyle = "rgb(0,0,0)"; //도형의 윤곽선 색을 설정하는 canvas style
				this.ctx.fillStyle ="purple"; //도형을 채우는 색을 설정하는 canvas style
				
				for (var y = 0; y < this.size.y; y++) {
					for (var x = 0; x < this.size.x; x++) {
						if (this.blocks[y][x]) {
							this.$layer.find('table tr').eq(y).find('td').eq(x).attr('class', 'block');
							
							var bounds = this.blocks[y][x].getBounds(); 
							this.ctx.strokeRect((x * 20), (y * 20), bounds.w, bounds.h); //사각형 영역을 그리는 canvas method 
							this.ctx.filRect((x * 20), (y * 20), bounds.w, bounds.h); //사각형 도형의 색을 채우는 canvas method 
						}
					}
				}				
				
				if (this.cBlock) this.cBlock.draw(this.$layer, this.ctx); 
			},
			round: function() {
				this.level = 1; 
				this.speed();
			},
			keyEvent: function(key) {
				if ( this.gameMode != Game.Util._play['START']) return;
				//게임 시 키 설정 
				if (key == 'RIGHT') this.cBlock.moveTo(1, 0, 0);	
				else if (key == 'LEFT') this.cBlock.moveTo(-1, 0, 0);
				else if (key == 'UP') this.cBlock.moveTo(0, 0, 1);
				else if (key == 'DOWN') this.cBlock.moveTo(0, 1, 0);
				else if (key == 'SPACE') {
					this.cBlock.moveSpace();
					this.appendBolck();
				}
 			},
			makeBlock: function() {
				if (this.pBlock) {
					this.cBlock = this.pBlock;
				}
				this.pBlock = Game.Util.createBlock(this);
				
				if (!this.cBlock) {
					this.makeBlock();
					return;
				}
			}
		}
		
	</script>
 </head>
 <body>
	<div id="draw" style="display: inline-block;"></div>
	<div style="display: inline-block;"><canvas id="canvas" width="200" height="400" style="display: none;"></canvas></div>
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
			} else {
				game1.resume();
				$button.val('일시정지');
			}
		}
	</script>
 </body>
</html>