# 프로젝트명
**BLACKPEARL**
 - 개인 판매자 온라인 회원제 신발 쇼핑몰


# 프로젝트 개요
 - 방문자는 다중 필터, 정렬 기능으로 편리하게 쇼핑을 하고 실시간 문의를 할 수 있습니다.
 - 관리자는 신발의 옵션을 임의 지정 가능하고 상품 관리 기능을 활용 가능합니다.
 - 상품목록, 관리자 대시보드 통계량 등을 불러올 때나 다중 재고정보 작업 시 등 DB 커넥션 소모를 최소화 하였습니다.


# 기능 일람
  - **회원 관리**
     - 스프링 시큐리티 및 이메일 인증

  - **구매 관련 기능**
     - 비동기 다중 필터와 페이징 지원 상품목록
     - 상품 옵션 선택
     - 장바구니 담기
     - 결제 및 구매


  - **고객 기능**
     - 상품 리뷰
     - 실시간 상담 채팅


  - **관리자 기능**
     - 상품 및 옵션별 재고 등록/수정
     - 판매 중지/단종 처리.
     - 쇼핑몰 정보 대시보드
     - 방문자 체커
     - 실시간 상담 응답 등


# 사용 기술 스택
- Language : Java, JavaScript
- Database : Oracle SQL
- Script : JSP
- Framework : Spring Boot
- Libraries : Spring Security, Mybatis, Spring Mail, Spring Websocket, Stomp
- Front-end Framework : Bootstrap


# 작업자 GitHub 목록
[**조재범**](https://github.com/JaeBuhmJo)


[**박경태**](https://github.com/Park-KyeongTae)


[**이광열**](https://github.com/poweenv)


[**하성훈**](https://github.com/hahasunghoon)


# 참고 자료
- Open Source Bootstrap Template - [Zay shop](https://themewagon.com/themes/free-bootstrap-5-html-5-ecommerce-website-template-zay-shop/)
- Spring WebSocket 이론 참고 - [에디의 기술블로그](https://brunch.co.kr/@springboot/695)
- Spring WebSocket + Stomp 구현 참고 - [개발하는 고라니](https://dev-gorany.tistory.com/235)
- 상품 목록 페이지 참고 : 네이버 쇼핑
