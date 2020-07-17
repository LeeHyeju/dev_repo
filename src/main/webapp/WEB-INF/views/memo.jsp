<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <style>
	.schedule-table {border-spacing: 0; border-collapse: collapse; box-sizing: content-box; border: 1px solid #000; }
	.schedule-table tr th {border: 1px solid #000; background: #D1ABAB; width: 80px; height: 34px; }
	.schedule-table tr th#head {background: #ffffff; }
	.schedule-table tr .sunday {color: red;}
	 .schedule-table tr .saturday {color: blue;} 
	.schedule-table td {border: 1px solid #000; width: 80px; height: 80px; vertical-align: top;}
	.schedule-table td .schedule-day {position: relative;}
	.schedule-table td .schedule-day span .day {position: absolute; top: 5px; left: 5px}
	.schedule-table td .schedule-day div.schedule {position: absolute; top: 20px; left: 5px; word-break: break-all;}
	.schedule-navi {cursor: pointer;}
	#div2 {background: #fff; display: none; width: 400px; height: 220px; position: absolute; top: 100px; left: 50px} 
  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script> 
  <script>
  	(function(window) {
  		var Schedule = function (id) {
  			var $container = undefined;
  			if (typeof id === 'object') {
				$container = $(id);
			} else {
				$container = ( id.search('#') == 0 ? $(id) : $('#' + id) );
			}
  			var currDate = null; //화면에 그릴 날짜
  			var dateArr = []; //1~31일까지의 날짜 배열
  			var that = this;
  		
  		    //시작
  		    this.init = function() {
  			    currDate = new Date();
  				that.make();
  			};

  		    //달력 생성
            this.make = function() {
                var firstDay = that.utils.firstDate(currDate).getDay(); //해당 월 1일의 요일값
                var monthOfLastDate = that.utils.lastDate(currDate).getDate(); //달의 마지막 일자
                
                dateArr = that.utils.dateArr(monthOfLastDate); //1~31일의 날짜 배열
                var blockArr = that.utils.blockArr(dateArr, firstDay); //화면에 그릴 배열
                
                var year = currDate.getFullYear(); //현재 년
                var month = currDate.getMonth() +1; //현재 월
                
                var $html = $('<div></div>'); 
                
                var $prev = $('<a class="schedule-navi"><span>◁</span></a>');
                var $next = $('<a class="schedule-navi"><span>▷</span></a>');
                
                $prev.on('click', function() {
                    that.moveTo(-1);
                });
                $next.on('click', function() {
                    that.moveTo(1);
                });
                
                var $head = $('<div><span>' + year + '년' + month + '월' + '</span></div>');
                $head.prepend($prev);
                $head.append($next);
                
                var table = '<table class="schedule-table">';
                table += '<tr>';
                
                for (var i = 0; i < that.utils.weeks.length; i++) {
                    table += ('<th class="' + that.utils.weeksCss[i] + '">' + that.utils.weeks[i] + '</th>');
                }
                table +='</tr>';
                
                for (var i = 0; i < blockArr.length; i++) {
                    if (i ==0)  table += '<tr>';
                    table += ('<td class="' + that.utils.weeksCss[(i % 7)] + '" data-date="' + blockArr[i] + '" data-day="' + ( i % 7) + '">');
                    table += ('<span class="day">' +  blockArr[i] + '</span>');
                    
                    var s = storage.get(year, month,  blockArr[i]);
                    
                    if (s) {
                        table += ('<div class="schedule">' + s.title + '</span>');
                    }
                    table += '</td>';
                    
                    if (i != 0 && (i+1)%7 == 0) {
                        table += '</tr>';
                        if (i < blockArr.length) {
                            table += '<tr>';
                        }
                    }
                }
                table += '<table>';
                
                $html.append($head);
                $html.append(table);
                $container.html($html);
                
                $container.find('[data-date]').on('click', function(e) {
                    if ($(this).data('date')) {
                        open(year,month,$(this).data('date'));
                    }
                });
            }
  		
            //이동 
            this.moveTo = function() {
                currDate.setMonth(currDate.getMonth()+ add);
                that.make();
            }
            
            //함수
            this.utils = {
                weeks: ['일','월','화','수','목','금','토'],
                weeksCss: ['sunday','','','','','','saturday'],
                //시작일자 return Date
                firstDate: function(date) {
                    var d = new Date(date.getFullYear(), date.getMonth(), 1);
                    return d;
                },
                //마지막일자 return Date
                lastDate: function(date) {
                    var d = new Date(date.getFullYear(), date.getMonth()+1,0);
                    return d;
                },
                //달력 1~31일의 날짜 배열 생성
                dateArr: function(last) {
                    var b = [];
                    for (var i = 0; i < last; i++) {
                        b[i] = i + 1;
                    }
                    return b;
                },
                //달력 앞뒤 공백 배열을 삽입
                blockArr: function(arr, first) {
                    var b =[];
                    if (first > 0) {
                        for (var i = 0; i < first; i++) {
                            b.push('');
                        }
                    }
                    b = b.concat(arr);
                    if (b.length % 7 != 0) {
                        for (var i = 0; i < b.length % 7; i++) {
                            b.push('');
                        }
                    }
                    return b;
                }
            };

  		    this.init();
  	    }
  	
  	window.Schedule = Schedule;
})(window);

(function($) {
	$.fn.schedule = function() {
		var that = this; 
		return $.each(that, function(k) {
			this.schedule = new Schedule(this);
			return this;
		});
	}
})($);				

	//스케쥴러 일정 열기
	function open(year, month, date) {
		var s = storage.get(year, month, date);
		
		$("#year").val(year);
		$("#month").val(month);
		$("#date").val(date);
		
		if (s) {
			$("#title").val(schedule.title);
			$("#time").val(schedule.time);
			$("#memo").val(schedule.meno);
		}	
		
        $('#div2').show();
	}
	
	//일정 저장하기
	function save() {
		var year = $("#year").val();
		var month = $("#month").val();
		var date = $("#date").val();
		var title = $("#title").val();
		var time = $("#time").val();
		var memo = $("#memo").val();
		
		storage.set(year,month,date,{
				title: title,
				time: time,
				memo: memo
		});
		sss.moveTo(0);
		cancel();
	}
	
	//일정 취소하기 
	function cancel() {
		$("#title").val('');
		$("#time").val('');
		$("#memo").val('');
		$('#div2').hide();
	}
	
	//저장소 설정
	var storage = {
		set: function (year, month, date, val) {
			var key = "s" + year + "_" + month + "_" + date;
			window.localStorage.setItem(key, JSON.stringify(val));
		},
		get: function(year, month, date) {
			var key = "s" + year + "_" + month + "_" + date;
			var data = window.localStorage.getItem(key);
			if (data) {
				return JSON.parse(data);
			}
			return null;
		},
		remove: function() {
			window.localStorage.removeItem(key);
		}
	}
  </script>

  <title>스케쥴러 만들기 22</title>
 </head>
 <body>
	<div id="div"></div>
	<div id="div2">
		<fieldset>
			<legend>[일정 관리]</legend>
				<form>
					<input type="hidden" id="year" maxlength="4">년<br>
					<input type="hidden" id="month" maxlength="2">월<br>
					<input type="hidden" id="date" maxlength="2">일<br>	
					<ul>
						<li>제목:<input type="text" id="title"></li>
						<li>시간:<input type="time" id="time"></li>
						<li>메모:<input type="text" id="memo"></li>
					</ul>		
					<button type="button" onclick="save();">저장</button>
					<button type="button" onclick="cancel();">취소</button>		
				</form>
		</fieldset>
	</div>
	<script>
		var sss = new Schedule('div');
	</script>
 </body>
</html>