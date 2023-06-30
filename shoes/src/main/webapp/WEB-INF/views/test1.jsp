<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    table {
      border-collapse: collapse;
      width: 100%;
    }
    
    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    
    th {
      background-color: #f2f2f2;
    }
  </style>
</head>
<body>
  <h2>주문 내역</h2>
  <table>
    <thead>
      <tr> <!-- 행 -->
        <th>상품명</th> <!-- 헤더 셀  -->
        <th>가격</th>
        <th>수량</th>
        <th>총 가격</th>
      </tr>
    </thead>
    <tbody>
      <!-- 주문 내역의 각 항목에 대한 반복문을 사용하여 아래의 행을 추가하세요 -->
      <tr>  <!-- 행 -->
        <td>상품 1</td> <!-- 데이터 셀  -->
        <td>10000원</td>
        <td>2개</td>
        <td>20000원</td>
      </tr>
      <tr>
        <td>상품 2</td>
        <td>15000원</td>
        <td>1개</td>
        <td>15000원</td>
      </tr>
      <!-- 주문 내역 항목 반복문 종료 -->
    </tbody>
    <tfoot>
      <tr>
        <th colspan="3">총 결제 금액</th>
        <td>35000원</td>
      </tr>
    </tfoot>
  </table>
</html>