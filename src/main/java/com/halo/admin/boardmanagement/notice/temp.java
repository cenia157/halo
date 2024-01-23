package com.halo.admin.boardmanagement.notice;

import java.util.Scanner;

public class temp {

	public static void main(String[] args) {

		// 自分の得意な言語で
		// Let's チャレンジ！！
		Scanner sc = new Scanner(System.in);
		String line = sc.nextLine();
		System.out.println(line);
		
		String arr[] = line.split(" ");
		
		String answer[] = new String[Integer.parseInt(arr[0])];
		
		for (int i = 0; i < answer.length; i++) {
			answer[i] = "N";
		}
		
		for (int i = 0; i < answer.length; i++) {
			for (int j = 0; j < answer.length; j=j+Integer.parseInt(arr[1])) {
				if(answer[j].equals("N")) {
					answer[j] = "A";
				}
			}
		}
		
		for (int i = 0; i < answer.length; i++) {
			for (int j = 0; j < answer.length; j=j+Integer.parseInt(arr[2])) {
				if(answer[j].equals("N")) {
					answer[j] = "B";
				}else{
					answer[j] += "B";
				}
			}
		}
	}
}
