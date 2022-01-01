package com.nidas.app.etc.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.nidas.app.payment.vo.CartVO;

public class CartCombiner {

	public static List<CartVO> combine(List<CartVO> originalCart, List<CartVO> inputCart) {

		// null check
		if (CollectionUtils.isEmpty(originalCart)) {
			originalCart = new ArrayList<CartVO>();
		}
		// 우선 중복 포함하여 합치기
		for(int i = 0; i < inputCart.size(); i++) {
			originalCart.add(inputCart.get(i));
		}
		
		int addStock = 0;
		// 시리얼, 사이즈를 기준으로 중복 검사한 뒤 수량을 합쳐줌
		for (int i=0; i<originalCart.size(); i++) {
			addStock = originalCart.get(i).getQuantity(); // i의 수량을 기본값으로 초기화
			for (int j=i+1; j < originalCart.size(); j++) { // i의 다음 인덱스부터 중복값 검사
				// 시리얼과 사이즈가a 같다면 같은 제품으로 봄
				if ( originalCart.get(i).getSerial().equals(originalCart.get(j).getSerial()) && originalCart.get(i).getShoeSize().equals(originalCart.get(j).getShoeSize()) ) {
					addStock += originalCart.get(j).getQuantity(); // (i)의 기본값에 수량을 더해주고 삭제함
					originalCart.get(i).setQuantity(addStock);
					originalCart.remove(j);
					j--; // 사이즈는 줄어든 데 반해, j는 다음 인덱스로 넘어감. remove 되니까 j-1 
				}
			}
		}
		return originalCart;
		
	}

}
