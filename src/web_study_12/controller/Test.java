package web_study_12.controller;

import web_study_12.dto.Board;

public class Test {
	public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		Board b = new Board();
		System.out.println(b);
		
		
		
		//reflexing 기법을 이용 
		//(클래스이름을 가지고 객체 생성)
		
		Class<?> cls = Class.forName("web_study_12.dto.Board");
		Board b2 = (Board) cls.newInstance();
		System.out.println(b2);
		
	}
}
