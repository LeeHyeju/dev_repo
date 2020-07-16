<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <style>
	table {border-spacing: 0; border-collapse: collapse; box-sizing: content-box; border: 1px solid #000;}
	table td {border: 1px solid #000; width: 80px; height: 80px; text-align: center; font-size: 24px;}
  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script> 
  <script>
  if (!Array.prototype.shuffle) {
	Array.prototype.shuffle = function() {
		var j, x, i;
		for ( i = this.length; i; i-1) {
			j = Math.floor(Math.random() * i);
			x = this[i-1];
			this[i-1] = this[j];
			this[j] = x;
		}
	}
}
  
  	var row = 4;
  	var cell = 4;
  	
  	var puzzle={
  			tern: 0,
  			cell: 4,
  			row: 4,
  			init: function() {
  				this.tern = 1;
  				this.p = [];
  				this.n = [];
  				for (var i = 1; i <(this.cell * this.row); i++) {
  					n[i-1] = i;
				}
  				n.shuffle();
  				n.push(0);
  				
  				for (var r = 0, i = 0 ; r < this.row; r++) {
					this.p[r] = [];
					for (var c = 0; c < this.cell; c++, i++) {
						this.p[r][c] = n[i];
					}
				}
  				puzzle.draw();
  			},
  			getP: function() {
  				return this.p;
  			},
  			draw: function() {
  				var that = this;
  				var table = '<table>';
  				
  				for (var y = 0, i =0; y < this.row; y++) {
					table +='<tr>';
					for (var x = 0; x < this.cell; x++, i++) {
						table += '<td data-y="' + y + '" data-x="' + x + '" data-n="' + this.p[y][x] + '">';
						if (this.p[y][x] !=0) {
							table += this.p[y][x];
						}
						table +='</td>';
					}
					table +='</tr>';
				}
  				table += '</table>';
  				
  				$('#div').html(this.tern + '<button type="button"> onclick="puzzle.init();">재시작</button>' + ' '+ table);
  				$('#div table td').off('click').on('click', function(e) {
  					var y = $(this).data('y');
  					var x = $(this).data('x');
  					var n = $(this).data('n');
  				
  					this.moveBlock(y,x,n);
  				});
  			},
  			moveBlock: function(y,x,n) {
  				if(n==0) return;
  				
  				var b = this.getBlankBlock(y, x);
  				
  				if (b) {
					var bx = b.x;
					var by = b.y;
					this.getP()[by][bx] = n;
					this.getP()[y][x] = 0;
					
					this.confirm();
				}
  			},
  			getBlankBlock: function(y,x) {
  				var top = this.findBlockXY(y,x,'top');
  				var left = this.findBlockXY(y,x,'left');
  				var right = this.findBlockXY(y,x,'right');
  				var bottom = this.findBlockXY(y,x,'bottom');
  			
  				if (top && this.getP()[top.y][top.x] == 0) return top;
  				if (left && this.getP()[left.y][left.x]  == 0) return left;
  				if (right && this.getP()[right.y][right.x]  == 0) return right;
  				if (bottom && this.getP()[right.y][right.x] ==0) return bottom;
  				
  				return null;
  				},
			findBlockXY: function(y,x,m) {
				var xx= x;
				var yy= y;
			
				if (m == 'top') {
					if (y -1 < 0) return null;
				} else if (m =='left') {
					if (x - 1< 0) return null;
				} else if (m =='right') {
					if (x + 1 >= this.cell) return null;
				} else if (m == 'bottom') {
					if (y + 1  >= this.row) return null;
				} 
				return {y:yy, x:xx};
			},
			confirm: function() {
				var isFinish = true;
			
		  		for (var r = 0, i = 1; r < this.row; r++) {
					for (var c = 0; c < this.cell; c++, i++) {
						if (this.p[r][c] != i && (this.row * this.cell !=i)) {
							isFinish = false;
						} 
					}
				}
		  		this.tern ++;
		  		this.draw();
		  		
		  		if (isFinish) {
					alert("게임 종료");
				}
			}
  		}
  	puzzle.init();
  </script>
  <title>숫자퍼즐게임</title>
 </head>
 <body>
    <div id="div"></div>
 </body>
</html>