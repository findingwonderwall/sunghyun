<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>


function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if(data.buildingName !== '' && data.apartment === 'Y'){
        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
      }
      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if(extraRoadAddr !== ''){
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }
      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
      if(fullRoadAddr !== ''){
        fullRoadAddr += extraRoadAddr;
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
      document.getElementById('roadAddress').value = fullRoadAddr;
      document.getElementById('jibunAddress').value = data.jibunAddress;

      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      if(data.autoRoadAddress) {
        //예상되는 도로명 주소에 조합형 주소를 추가한다.
        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

      } else if(data.autoJibunAddress) {
          var expJibunAddr = data.autoJibunAddress;
          document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
      } else {
          document.getElementById('guide').innerHTML = '';
      }
      
     
    }
  }).open();
}
var Checked = 0;

function fn_overlapped(){
    var _id=$("#_member_id").val();
    if(_id==''){
       alert("ID를 입력하세요");
       return;
    }
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/member/overlapped.do",
       dataType:"text",
       data: {id:_id},
       success:function (data,textStatus){
          if(data!=_id){
              alert("사용할 수 있는 ID입니다.");
              $('#btnOverlapped').prop("disabled", true);
              $('#_member_id').prop("disabled", true);
              $('#member_id').val(_id);
             Checked=1;
          }else{
             alert("사용할 수 없는 ID입니다.");
          }
       },
       error:function(data,textStatus){
        //  alert("에러가 발생했습니다.");ㅣ
       },
       complete:function(data,textStatus){
        //  alert("작업을완료 했습니다");
       }
    });  //end ajax    
 }   
 
 function fn_check(obj) {
    if(Checked==0){
      alert('중복체크하세요!');
   } else {
      obj.submit();
   } 
}
</script>
</head>
<body>
<div class="middle">
	<img class="logo" alt="booktopia" src="${contextPath}/resources/image/loginForm.png">
	<form method="post" action="${contextPath}/member/addMember.do">
		<table class="member">
			<tr class="field">
		        <th><b>아이디</b><span class="placehold-text"></span></th>
		        <td><input type="text" name="member_id"></td>
		        <td><input type="button" value="중복확인" onClick="fn_overlapped()"></td>
		    </tr>
		        <tr class="field">
		            <th><b>비밀번호</b></th>
		            <td><input type="password" name="member_pwd"></td>
		        </tr>
		        <tr class="field">
		            <th><b>이름</b></th>
		            <td><input type="text" name="member_name"></td>
		        </tr>
		        <tr class="field">
		            <th><b>닉네임</b></th>
		            <td><input type="text" name="member_nickName"></td>
		        </tr>
		        <tr class="field">
		            <th><b>주민등록번호</b></th>
		            <td><input type="text" name="member_jumin1">&nbsp;-&nbsp;</td>
		            <td><input type="password"name="member_jumin2"></td>
		        </tr>
		        <tr class="field">
		            <th><b>이메일</b></th>
		            <td><input type="email" name="member_email"></td>
		            <td><input type="button" value="인증"></td>
		            <td><p style="text-align: left;">미인증</p></td>
		        </tr>
		        <tr class="field">
		        	<td></td>
		            <td>
		            	<input id="agree" type="checkbox">
  						<label for="agree">
		    			<span>AA에서 발송하는 email을 수신합니다.</span>
		 				</label>
 					</td>
		        </tr>
	            <tr class="field">
	            	<th><b>인증번호입력</b></th>
	            	<td><input type="text" name="member_key" placeholder="인증번호를 입력하세요"></td>
	            	<td><input type="button" value="확인"></td>
	            </tr>
		        <tr class="field">
		            <th><b>휴대전화</b></th>
		            <td><input type="tel" name="member_phone" placeholder="하이픈(-) 없이 입력하세요"></td>
		        </tr>
				<tr class="field">
		            <th><b>주소</b></th>
		            <td><input type="text"></td>
		            <td><input type="button" value="우편번호 검색"></td>
		        </tr>
		        <tr class="field">
		        <td></td>
		        <td><input type="text" name="member_address1" placeholder="주소"></td>
		        </tr>
		        <tr class="field">
		        <td></td>
		        <td><input type="text" name="member_address2" placeholder="상세 주소"></td>
		        </tr>
		        <tr class="field">
			        <td><input type="submit" value="취소하기"></td>
			        <td><input type="submit" value="회원가입"></td>
		        </tr>
	        </table>
        </form>
    </div>
</body>
</html>