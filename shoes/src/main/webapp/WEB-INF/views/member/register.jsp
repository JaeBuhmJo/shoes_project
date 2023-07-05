<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

	<!-- Start Content Page -->
	<div class="container-fluid bg-light py-5">
		<div class="col-md-6 m-auto text-center">
			<h1 class="h1">회원가입</h1>
			<p>저희 쇼핑몰에 오신걸 환영합니다.</p>
		</div>
	</div>  

	<!-- Start Contact -->
	<div class="container py-5">                              
		<div class="row py-5" >                       
			<form class="col-md-9 m-auto" method="post" role="form" id="register"
				novalidate>
				<div class="form-group mb-3">                           
					<label for="memberId">아이디</label> <input type="text"
						class="form-control mt-1" id="memberId" name="memberId"
						placeholder="아이디" required pattern="^[a-zA-Z0-9]{3,16}$">
					<!-- 3~16개 영어, 숫자로 입력해주세요 --> 
					<div class="invalid-feedback">아이디를 확인해 주세요</div>
					<div class="col-2" style="text-align: right;">
						<button type="button" class="w-100 btn btn-danger" id="dupcheck">중복아이디</button>
					</div>
				</div>
				<div class="form-group mb-3">
					<label for="name">이름</label> <input type="text"
						class="form-control mt-1" id="name" name="name" placeholder="홍길동"
						required pattern="^[a-zA-Z가-힣]{3,10}$">
					<div class="invalid-feedback">이름을 확인해 주세요</div>
				</div>
				<div class="form-group mb-3">
					<label for="password">비밀번호</label> <input type="password"
						class="form-control mt-1" id="password" name="password"
						placeholder="비밀번호" required pattern="^\d+$">
					<!-- 숫자만 -->                                                                                                                           
					<div class="invalid-feedback">비밀번호를 확인해 주세요</div>
				</div>                  
				<div class="form-group mb-3">
					<label for="password">비밀번호 확인</label> <input type="password"
						class="form-control mt-1" id="confirmPassword" name="confirmPassword"
						placeholder="비밀번호 확인" required pattern="^\d+$">
					<!-- 숫자만 -->
					<div class="invalid-feedback"> 비밀번호와 같은 지 확인해 주세요</div>
				</div>
				<div class="form-group mb-3">                                   
					<label for="phone">휴대폰</label> <input type="text"
						class="form-control mt-1" id="phone" name="phone"
						placeholder="휴대폰" required>
					<div class="invalid-feedback">휴대폰 번호를 확인해 주세요</div>
				</div>          
				<!-- 카카오 도로명 주소 API  -->
				<div class="form-group mb-3">   
					<label for="phone">주소</label>
					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" class="form-control mt-1" name="address" placeholder="주소" required>
					<div class="invalid-feedback">주소를 확인해 주세요</div>
					<input type="text" id="sample6_detailAddress" class="form-control mt-1" placeholder="상세주소" > 
					<input type="text" id="sample6_extraAddress" class="form-control mt-1" placeholder="참고항목">
				</div>  
				<div class="form-group mb-3">                       
					<label for="email">이메일</label> <input type="email"
						class="form-control mt-1" id="email" name="email"
						placeholder=example@example.com required          	
						pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$">
					<button class="btn btn-info btn-lg px-3" type="button" id="emailConfirm">이메일 인증</button>	
					<div class="invalid-feedback">이메일을 확인해 주세요</div>
				</div>                                                                                                                                                                 
				<div class="form-group mb-3">                       
					<label for="checkNumber">인증번호</label> <input type="text"                      
						class="form-control mt-1" id="checkNumber" name="checkNumber"
						placeholder="숫자 6자리" required                               
						pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$">
					<button class="btn btn-success btn-lg px-3" type="button" id="emailCheckConfirm">인증번호 확인</button>	
					<div class="invalid-feedback">인증번호를 확인해 주세요</div>
				</div>                                                                                                                                     
				<div class="form-group mb-3">
					<label for="footSize">발사이즈</label> <input type="text"
						class="form-control mt-1" id="footSize" name="footSize"
						placeholder="250" required>
					<div class="invalid-feedback">발사이즈를 확인해 주세요</div>
				</div>                                                                                
				<div class="row">
					<div class="col text-end mt-2">
						<button type="submit" class="btn btn-success btn-lg px-3" id="join">회원가입</button>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
			<form class="col-md-9 m-auto" role="form">
				<div class="row">
					<div class="col text-end mt-2">
						<button type="button" class="btn btn-secondary btn-lg px-3"
							onclick="location.href='/'">취소</button>
					</div>
				</div>
			</form>
			<input type="hidden" id="hiddenNumber" value="${emailCheck}">
		</div>                   
	</div>


    <!-- End Contact -->

	<!-- Start Script -->
	<script>
                                 
    //CSRF 토큰 값 생성                           
  	const csrfToken = '${_csrf.token}';
    </script>
	<script src="/assets/js/jquery-1.11.0.min.js"></script>
	<script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/templatemo.js"></script>
	<script src="/assets/js/custom.js"></script>
	<script src="/assets/js/register.js"></script>
	<!-- 카카오 도로명 주소 API 시작 스크립트 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<!-- 카카오 도로명 주소 API 종료 스크립트 -->
	<!-- End Script -->

	
<%@ include file="../include/footer.jsp"%>
