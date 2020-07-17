<script>
<%/*
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<body>
<div ng-app="">
 
<p>Input something in the input box:</p>
<p>Name : <input type="text" ng-model="name"  placeholder="Enter name here"></p>

<h1>Hello {{name}}</h1>

<p ng-bind="name"></p>

</div>

<div ng-app="" ng-init="firstName='John'">

<p>The name is <span ng-bind="firstName"></span></p>

<p>My first expression: {{ 5 + 5 }}</p>

<p>Name: <input type="text" ng-model="name"></p>
<p>{{name}}</p>
  
</div>

<p>Try to change the names.</p>

<div ng-app="" ng-init="myCol='pink'">
<input style="background-color:{{myCol}}"  ng-model="myCol">
</div>
<div ng-app="" ng-init="person={firstName:'John',lastName:'Doe'}">

<p>The name is {{ person.lastName }}</p>

</div>

<div ng-app="" ng-init="points=[1,15,19,2,40]">

<p>The third result is {{ points[2] }}</p>

</div>

<script>
// 모듈 만들기
var app = angular.module('myApp', []);
// 컨트롤러 추가
app.controller('myCtrl', function($scope) {
    $scope.firstName= "John";
    $scope.lastName= "Doe";
});
</script>

</body>
</html>




_____________________________________________________________________________________________________
ctrl+shift+R : page찾기

C:\Program Files\Common Files\Oracle\Java\javapath;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\;%JAVA_HOME%\bin;

AngularJS
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

AngularJS 모듈은 애플리케이션을 정의합니다.
AngularJS 컨트롤러는 애플리케이션을 제어합니다.
NG-init 지시어는 AngularJS와 응용 프로그램 변수를 초기화한다.
NG-응용 프로그램 지시문은 응용 프로그램의 정의 NG 컨트롤러 지시어는 컨트롤러를 정의합니다.

모듈 정의의 [] 매개 변수를 사용하여 종속 모듈을 정의 할 수 있습니다. [] 매개 변수가 없으면 새 모듈을 작성 하지 않고 기존 모듈을 검색 합니다.

지시문의 이름을 지정 : CamelCase 사용 w3TestDirective
호출 할 때 :  -구분 된 이름 을 사용 w3-test-directive

AngularJS에서 컨트롤러를 만들 때 $scope객체를 인수로 전달합니다 .

ng-model 지시문은 HTML 컨트롤 (입력, 선택, 텍스트 영역)의 값을 응용 프로그램 데이터에 바인딩합니다
ng-model지시문을 사용하면 입력 필드의 값을 AngularJS에서 작성된 변수에 바인딩 할 수 있습니다.

  $scope.carname = "Volvo"; --> {{carname}}

"color"라는 변수는 컨트롤러의 범위와 rootScope에 있습니다.

ng-repeat지시문을 처리 할 때 각 반복은 현재 반복 객체에 액세스 할 수 있습니다.

- AngularJS 지시문 참조
https://www.w3schools.com/angular/angular_ref_directives.asp

사이트 : 코드잇

_____________________________________________________________________________________________________
<!DOCTYPE html>
<html ng-app="myApp">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<head>
<title></title>
<script src="/js/angularjs/1.5.6/angular.js"></script>
<script>
var myApp = angular.module("myApp",[]);
myApp.controller("myAppCtrl", function($scope){
$scope.data = {
  userId    : ""
}
$scope.userList = [
  {id:"",name:"ALL"},
  {id:"aaa",name:"김유신"},
  {id:"bbb",name:"신유신"},
  {id:"ccc",name:"박유신"},
  {id:"ddd",name:"최유신"},
  {id:"eee",name:"유유신"}
];
});
</script>
</head>
<body ng-controller="myAppCtrl">
<h1>
  AngularJS selectbox 사용예 1<br/>
  <font color="red">
    $scope.userList를 selectbox로 표현
  </font>
</h1>
<hr/>
<div>
  <label>사용자 목록</label>
  <select ng-model="data.userId" name="userId">
    <option ng-repeat="row in userList" value="{{row.id}}">{{row.name}}</option>
  </select>
  <label>선택된 사용자</label>
  <font color="blue">{{data.userId}}</font>                
</div>
</body>
</html>

_____________________________________________________________________________________________________
new connection --okc --- test 


https://test-m.rushncash.com:8084/#/mang_mbl_snmn01?lonNo=L01227637543




Description	Resource	Path	Location	Type
Archive for required library: 'C:/Users/아프로/.m2/repository/org/springframework/spring-core/4.0.6.RELEASE/spring-core-4.0.6.RELEASE.jar' 

in project 'lhj' cannot be read or is not a valid ZIP file	lhj		Build path	Build Path Problem

_____________________________________________________________________________________________________
http://www.joshi.co.kr/index.php?mid=board_wUIV71&page=2&document_srl=301653

_____________________________________________________________________________________________________
https://www.heidisql.com/download.php?download=installer
마리아디비

JSON은 데이터를 저장하고 교환하기위한 구문입니다.

브라우저와 서버간에 데이터를 교환 할 때 데이터는 텍스트 만 될 수 있습니다.
JSON은 텍스트이며 모든 JavaScript 객체를 JSON으로 변환하고 JSON을 서버로 보낼 수 있습니다.
서버에서받은 JSON을 JavaScript 객체로 변환 할 수도 있습니다.
이런 식으로 복잡한 구문 분석 및 변환없이 데이터를 JavaScript 객체로 작업 할 수 있습니다.

custCI: "TFOMljtcva/L3C1jjDwiiT9617HAD54pPUq7zVNch0pKdnC1Enf4shJVW5FApTKk7SwBt7Wxrnu3QFTrI4nVlQ=="
_____________________________________________________________________________________________________
<input type="date" data-date="" data-date-format="DD MMMM YYYY" value="${dtl.regDt}">

 var notiChk = $("input:checkbox[id='notiChk']").is(":checked");

DATE_FORMAT('20200609', "%Y-%m-%d")


CURRENT_TIMESTAMP and CURRENT_TIMESTAMP() are synonyms for NOW().

window.open("codePopup",null,"height=200,width=400,status=yes,toolbar=no,menubar=no,location=no");

var x = '<c:out var="cmnCd" value="${list}"/>'

/*검색*//*
function fn_srch(){
	var form = document.getElementById("viewFrm");
    form.method = "get";
//     var form1 = form.getElementById("boardTable2");
//     var form2 = form1.getElementById("groCd2");
//     form2.innerHTML = "1231";
    form.action = "<c:url value='/cmnCd/search'/>";
    form.submit();
}*//**/
/*그룹코드 행 클릭*//*
function fn_click(){
	var form = document.getElementById("viewFrm");
    form.method = "get";
    var x = document.getElementById("groCd2");
//     document.getElementById("viewFrm").elements.namedItem("groCd").innerHTML = "123";
//     var x = document.getElementById("viewFrm").elements.namedItem("groCd").innerHTML;
    alert(x.innerHTML);
    
//     document.getElementsByTagName("viewFrm").elements["groCd"].innerHTML = "2222";
//     var x = document.getElementsByTagName("viewFrm")["groCd"];
//  var x = document.getElementsByTagName("viewFrm").namedItem("groCd");
//     alert(x);
//     var form1 = form.getElementById("boardTable2");
//     var form2 = form1.getElementById("groCd2");
//     form2.innerHTML = "1231";
//     document.getElementById("viewFrm").find("#groCd");
// 	document.getElementById("groCd").innerHTML = '321';
    form.action = "<c:url value='/cmnCd/click'/>";
    form.submit();
}

var x = a.cells[0].innerText;
*/
// 	const queryString = window.location.search;
// 	const urlParams = new URLSearchParams(queryString);
// 	const param = urlParams.get('srchKey');
//     document.getElementById("srchKey").value = param;
/*

	var referrer =  document.referrer;*/
// 	alert(referrer);
// 	var para = document.location.href.split("?")[1];
// 	para = para.split("&");
// 	para = para.split("=");


 
    // 현재 페이지의 url
//     var url = decodeURIComponent(document.location.href);
//     // url이 encodeURIComponent 로 인코딩 되었을때는 다시 디코딩 해준다.
//     url = decodeURIComponent(url);


//		String srchKey = cmnCd.getSrchKey();
//		logger.info("srchKey>>>>> {}", srchKey);
//		if(!srchKey.equals("")) {
//			String[] keyArray = srchKey.split(",");
//			logger.info("srchKey>>>>> {}", keyArray.length);
//			if(keyArray.length != 1 && keyArray.length != 0 && keyArray.length != 2) {
//				if(keyArray[2] != "") {
//					cmnCd.setGroCd(keyArray[0]);
//					cmnCd.setGroNm(keyArray[1]);
//					cmnCd.setCmnCd(keyArray[2]);
//					cmnCd.setCmnNm(keyArray[3]);
//					cmnCd.setUseYn(keyArray[4]);
//				}
//			}
//			model.addAttribute("list", service.cmnCdPage(cmnCd, scri));
//			model.addAttribute("count", service.listCount2(cmnCd));
//		} else {
//			cmnCd.setGroCd("");
//			cmnCd.setUseYn("");
//			model.addAttribute("list", service.cmnCdPage(cmnCd, scri));
//			model.addAttribute("count", service.listCount(cmnCd));
//		}
/*

edit.cells[1].innerHTML


_____________________________________________________________________________________________________
/// mapper.xml에 listCount를 안적음
org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.spring.dev.mapper.IntrBrdMapper.listCount


/// mapper.xml에 getFaq를 안적음
심각: 경로 []의 컨텍스트 내의 서블릿 [appServlet]을(를) 위한 Servlet.service() 호출이, 근본 원인(root cause)과 함께, 예외 [Request processing failed; nested exception is org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.spring.dev.mapper.IntrBrdMapper.getFaq]을(를) 발생시켰습니다.
org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.spring.dev.mapper.IntrBrdMapper.getFaq

// xml에 select문 잘못적음
The origin server did not find a current representation for the target resource or is not willing to disclose that one exists.

// return type 설정 안해줌  --> mybatis-config.xml에 설정
org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'sqlSessionFactory' defined in ServletContext resource [/WEB-INF/spring/root-context.xml]: Invocation of init method failed; nested exception is org.springframework.core.NestedIOException: Failed to parse mapping resource: 'file [C:\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp2\wtpwebapps\dev\WEB-INF\classes\mappers\IntrBrdMapper.xml]'; nested exception is org.apache.ibatis.builder.BuilderException: Error parsing Mapper XML. Cause: org.apache.ibatis.builder.BuilderException: Error resolving class. Cause: org.apache.ibatis.type.TypeException: Could not resolve type alias 'IntrFaq'.  Cause: java.lang.ClassNotFoundException: Cannot find class: IntrFaq


// xml에 쿼리 id 동일한거 2개 --> id 고침
org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'sqlSessionFactory' defined in ServletContext resource [/WEB-INF/spring/root-context.xml]: Invocation of init method failed; nested exception is org.springframework.core.NestedIOException: Failed to parse mapping resource: 'file [C:\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp2\wtpwebapps\dev\WEB-INF\classes\mappers\IntrBrdMapper.xml]'; nested exception is org.apache.ibatis.builder.BuilderException: Error parsing Mapper XML. Cause: java.lang.IllegalArgumentException: Mapped Statements collection already contains value for com.spring.dev.mapper.IntrBrdMapper.insert


// 쿼리 parameter 잘못적음 brd --> brdCd 고침
java.sql.SQLSyntaxErrorException: (conn=1635) Unknown column 'brd' in 'field list'



javax.el.PropertyNotFoundException: 타입 [com.spring.dev.domain.IntrFaq]에서 프로퍼티 [rNum]을(를) 찾을 수 없습니다.

// 서비스, IntrBrdMapper.java에 returnType 제대로 안씀 intrBrd --> intrFaq로 바꿈
java.lang.ClassCastException: com.spring.dev.domain.IntrFaq cannot be cast to com.spring.dev.domain.IntrBrd

// redirect 경로 잘못씀
java.lang.IllegalStateException: Optional int parameter 'brdCd' is present but cannot be translated into a null value due to being declared as a primitive type. Consider declaring it as object wrapper for the corresponding primitive type.


가로 중앙 정렬
인라인 요소는 text-align 속성을 이용해서 가운데 정렬이 가능하지만 블럭 요소들은 중앙 정렬되지 않습니다.

// controller에 return 페이지 잘못적음 insertPage로 바꿈
javax.servlet.ServletException: 파일 [&#47;WEB-INF&#47;views&#47;cmnCd&#47;insert.jsp]을(를) 찾을 수 없습니다.

// 파라미터 틀림
org.apache.ibatis.reflection.ReflectionException: There is no getter for property named 'groCd' in 'class com.spring.dev.domain.SearchKey'

// @Param("groCd")String groCd 파라미터 이름 설정해줌
org.apache.ibatis.reflection.ReflectionException: There is no getter for property named 'groCd' in 'class java.lang.String'



요소 콘텐츠는 올바른 형식의 문자 데이터 또는 마크업으로 구성되어야 합니다.   ---> <![CDATA[ < ]]>	

_____________________________________________________________________________________________________

_____________________________________________________________________________________________________
*/
%>

</script>