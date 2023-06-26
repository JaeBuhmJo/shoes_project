package com.project.mapper;
/* addCart는 carts 테이블에 row 추가하는 메소드. member_id, product_id, product_amount 값이 필요한데 한번에 값들을 가져올수있도록
 * CartDTO를 파라미터 변수로 선언 . 반환타입은 int로 한 이유는 row 추가 성공시 1, 실패시 0을 반환하기 위해 int지정함
 * 
 * deleteCart 는 어떤 row를 삭제할지 정하기위해 cart_id에 대한 값이 필요해서 int타입의 cart_id 지정함. 똑같이 성공 실패 여부 알기위해
 * 
 * modifyamount는 row 수량변경하는 메소드. cart_id와 몇개의 수량으로 변경할지에 대한 product_id가 필요하므로 두개의 값을 한번에 가져오기위해
 * CartDTO 파라미터 변수로 선언
 * 
 * getCart는 지정된 회원의 모든 값들을 가져오기위한 메소드. 어떤 회원인지에 대한정보가 필요하기때문에 String 타입을 씀
 * 한개 이상의 장바구니 데이터를 반환받아야하므로 List 지정함
 * 
 * checkCart는 회원 정보와, 상품정보를 넘겨서 해당하는 row가 있는 지 확인하기 위한 메소드, member_id(회원), product_id(상품정보)
 */
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.CartDTO;

@Mapper
public interface CartMapper {
	
	// 장바구니 추가
	public int addCart(CartDTO cart) throws Exception; // add/cart 에서 발생한 예외 던져주기 위해 throws..씀
	
	// 장바구니 삭제
	public int deleteCart(int cartId);
	
	// 장바구니 수량 수정
	public int modifyamount(CartDTO cart);
	
	// 장바구니 목록
	public List<CartDTO> getCart(String memberId);
	
	// 장바구니 확인
	public CartDTO checkCart(CartDTO cart);

}
