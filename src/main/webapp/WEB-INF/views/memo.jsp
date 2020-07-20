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
						//1번
					});				
				</script>
				<div>
					<ul>
						<li id="q1_1"><h3>1번 Span에 이름을 ju개발로 바꾸고, 부모 div의 배경색을 노란색, 초록색으로 변경 (단, 빨간색 남아있어야 함)</h3>
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
						<li id="q1_2"><h3>2번 Span에 이름을 ju개발로 바꾸고, 부모 div의 배경색을 초록색으로 변경</h3>
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
						//4번
					});	
				</script>
				<div>
					<ul>
						<li id="q2_1"><h3>INPUT 값을 바꾸자</h3>
							<div>
								<input type="text" id="q2_1_1" value="개발자4"/>
							</div>
														<div>
								<input type="text" id="q2_1_2" value="개발자5"/>
							</div>
														<div>
								<input type="text" id="q2_1_3" value="개발자6"/>
							</div>
						</li>
						<li id="q2_2"><h3>select에 ju개발2 추가</h3>
							<div>
								<select>
									<option value="1">개발자7</option>
								</select>
							</div>
						</li>
						<li id="q2_3"><h3>select에 ju개발3 강제선택</h3>
							<div>
								<select>
									<option value="1">개발자8</option>
									<option value="2">ju개발3</option>
								</select>
							</div>
						</li>
						<li id="q2_4"><h3>select에 개발자9와 개발자10 사이에 ju개발4 추가</h3>
							<div>
								<select>
									<option value="1">개발자9</option>
									<option value="3">개발자10</option>
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
						//4번
					});	
				</script>
				<div>
					<ul>
						<li id="q3_1"><h3>체크박스를 5개 만든 후 선택된 값을 1,2,3과 같이 text에 출력</h3>
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
 </body>
</html>