/*===============
  FoodDTO.java
  - 음식관리
===============*/

package com.gagym.dto;

public class FoodDTO
{
	/*
	// 음식 번호, 회원 번호, (음식 유형 번호), 음식 유형, 음식 명, (용량 기준 번호), 용량 기준
	private String food_no, mem_no, food_type_no, food_type_name, food_name, capa_no, capa_sta;

	// 기준 용량
	private int sta_amount;
	
	// 칼로리, 탄수화물, 단백질, 지방, 나트륨, 설탕당, 포화지방, 트랜스지방
	private int kcal, carbo, protein, province, salt, sugar, satur, trans;

	// 다불포화지방, 불포화지방, 콜레스테롤, 식이섬유, 칼륨
	private int polyun, unsatur, choles, die_fiber, potassium;

	// 등록일자, 승인 관리자 아이디, 승인 날짜
	private String regi_date, admin_id, ok_date;
	*/
	
	// 음식 번호, 회원 번호, 음식 유형, 음식 명, 용량 기준
	private String foodNo, memNo, foodTypeName, foodName, capaSta;

	// 기준 용량
	private int staAmount;
	
	// 칼로리, 탄수화물, 단백질, 지방, 나트륨, 설탕당, 포화지방, 트랜스지방
	private int kcal, carbo, protein, province, salt, sugar, satur, trans;

	// 다불포화지방, 불포화지방, 콜레스테롤, 식이섬유, 칼륨
	private int polyun, unsatur, choles, die_fiber, potassium;

	// 등록일자, 승인 관리자 아이디, 승인 날짜
	private String regiDate, adminId, okDate;
	
}
