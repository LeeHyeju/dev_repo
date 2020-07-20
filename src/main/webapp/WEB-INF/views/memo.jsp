<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <style>

  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script> 
  <title>JQuery 연습</title>
 </head>
 <body>
		<fieldset>
			<legend>JQuery Selector Find & Parent & Closest</legend>
				<script>
					$(document).ready(function(){
						//1번 - Parent를 이용한 문구, 색상 변경
						$('#q1_1 span').eq(0).html('ju개발1').parent().css('background', 'yellow');
						$('#q1_1 span').eq(1).html('ju개발2').parent().css('background', 'green');
						
						var q1_arr = [{name:'이혜주3', color: 'yellow'},{name:'이혜주4', color: 'green'}];
						$('#q1_1_span').each(function(key,value) {
							$(this).html(q1_arr[key].name).parent().css('background', q1_arr[key].color);
                        });
						//2번 - closest를 이용한 문구, 색상 변경
						$('#q1_2 span span span').html('ju개발').closest('div').css('background', 'green');
					});				
				</script>
				<div>
					<ul>
						<li id="q1_1"><h3>(1번) Span에 이름을 ju개발 1,2로 바꾸고, 부모 div의 배경색을 노란색, 초록색으로 변경 (단, 빨간색 남아있어야 함)</h3>
							<div>
								<div style="width: 400px; background: #ff0000;">
									<div target style="background: #ccc; display: inline-block;">
										<span>개발자1</span>
									</div>
									<div target style="background: #ccc; display: inline-block;">
										<span>개발자2</span>
									</div>
								</div>
							</div>	
						</li>
						<li id="q1_2"><h3>(2번) Span에 이름을 ju개발로 바꾸고, 부모 div의 배경색을 초록색으로 변경</h3>
							<div>
								<div style="width: 400px; background: #ff0000;">
									<div target style="background: #ccc; display: inline-block;">
										<span><span><span>개발자3</span></span></span>
									</div>
								</div>
							</div>	
						</li>
					</ul>
				</div>
		</fieldset>
		<fieldset>
			<legend>Selector Find & Value 1</legend>
				<script>
					$(document).ready(function(){
						//3번 input값 변경 
						$('#q2_1_1').val('ju개발1');
						$('input[name=q2_1_2').val('ju개발2');
						$('.q2_1_3').val('ju개발3');
						//4번 셀렉트 추가
						$('#q2_2 select').append('<option value="2">ju개발2</option>');
						//5번 셀렉트 강제선택
						$('#q2_3 select').find('option[value=2]').prop('selected',true);
						//6번 셀렉트 사이에 옵션 추가
						$('#q2_4 select option').eq(0).after('<option value="2">개발자10</option>');
						
					});	
				</script>
				<div>
					<ul>
						<li id="q2_1"><h3>(3번)INPUT 값을 바꾸자 (개발자 -> ju개발)</h3>
							<div>
								<input type="text" id="q2_1_1" value="개발자4"/>
							</div>
							<div>
								<input type="text" name="q2_1_2" value="개발자5"/>
							</div>
							<div>
								<input type="text" class="q2_1_3" value="개발자6"/>
							</div>
						</li>
						<li id="q2_2"><h3>(4번)select에 ju개발2 추가</h3>
							<div>
								<select>
									<option value="1">개발자7</option>
								</select>
							</div>
						</li>
						<li id="q2_3"><h3>(5번)select에 ju개발3 강제선택</h3>
							<div>
								<select>
									<option value="1">개발자8</option>
									<option value="2">ju개발3</option>
								</select>
							</div>
						</li>
						<li id="q2_4"><h3>(6번)select에 개발자9와 개발자10 사이에 ju개발4 추가</h3>
							<div>
								<select>
									<option value="1">개발자9</option>
									<option value="3">개발자11</option>
								</select>
							</div>						
						</li>
					</ul>
				</div>
		</fieldset>
		<fieldset>
			<legend>Selector Find & Value 2</legend>
				<script>
					$(document).ready(function(){
						//7번 체크박스 선택 값을 text box에 출력
						$('#q3_1 input[type=checkbox]').on('click', function(){
							var arr = $.map($('#q3_1 input[type=checkbox]:checked'), function(obj, key){
								return obj.value;
							}).join(',');
                                $('#q3_1 input[type=text]').val(arr);
                                alert(arr);
						});
					});	
				</script>
				<div>
					<ul>
						<li id="q3_1"><h3>(7)체크박스를 5개 만든 후 선택된 값을 1,2,3과 같이 text에 출력</h3>
							<div>
								<input type="checkbox" value="1"/>
								<input type="checkbox" value="2"/>
								<input type="checkbox" value="3"/>
								<input type="checkbox" value="4"/>
								<input type="checkbox" value="5"/>
							</div>
							<div>
								<input type="text" value=""/>
							</div>
						</li>
					</ul>
				</div>	
		</fieldset>
		<fieldset>
			<legend>file add & remove</legend>
				<script>
					$(document).ready(function(){
					//7번 첨부파일
                        var files= {
                            $container: $('#q4_1_2'),
                            min: 1,
                            max: 5, 
                            add: function() {
                                var count = files.$container.find('li').length;
                                if(count >= files.max) return;
                                var $li = $('<li><input type="file" /><button data-id="add2">추가</button><button type="button" data-id="del2">삭제</button></li>');
                                files.$container.append($li);

                                $li.find('button[data-id=add2]').on('click', function(e) { //추가
                                    files.add();
                                });
                                $li.find('button[data-id=del2]').on('click', function(e) {//삭제
                                    files.del($li);
                                });

                                files.addBtnVisible();
                            },
                            del: function($li){
                                var count = files.$container.find('li').length;
                                if(count <= files.min) return;
                                $li.remove();
                                files.addBtnVisible();
                            },
                            addBtnVisible: function() {
                                var lastIndex = files.$container.find('li').find('button[data-id=add2]').length-1;
                                files.$container.find('li').find('button[data-id=add2]').hide();
                                files.$container.find('li').find('button[data-id=add2]').eq(lastIndex).show();
                            }
                        };
                        files.add();

                        $('button[data-id=add]').on('click', function() { //추가버튼 
                            var length = $('#q4_1_1 li').length;

                            if(length <5){
                                $('#q4_1_1').append('<li><input type="file" /><button type="button" data-id="del">삭제</button></li>');
                            } else if(length == 5) {
                                $(this).hide();
                            } 
                        });

                        $('#q4_1_1').on('click','button[data-id=del]', function(){ //삭제버튼
                            var length = $('#q4_1_1 li').length;
                            
                            if (length <=5 && length >1) { //2~5개 있을 때 삭제버튼 
                                $('#q4_1_1 li').remove();
                            } else if(length ==1) {
                                $(this).hide();
                            }
                        });
					});	
				</script>
				<div>
                    <ul>
                        <li id="q4_1"><h3>첨부파일 추가 삭제</h3>
                            <!-- 첨부파일 설정
                                1.max 5개까지(5개일 때, 추가버튼 비활성)
                                2.min 1개(1개일 때, 삭제버튼 비활성)
                                [              ][찾아보기][-]
                                [              ][찾아보기][-]
                                [              ][찾아보기][+][-]
                                -->
                            <div>
                                 <ul id="q4_1_1">
                                    <li><input type="file" /><button type="button" data-id="add">추가</button><button type="button" data-id="del">삭제</button></li>
                                </ul>
                                --------------------------------------------
                                <ul id="q4_1_2">
                                </ul>
                            </div>
                        </li>
                     </ul>
				</div>	
		</fieldset>
		
 </body>
</html>