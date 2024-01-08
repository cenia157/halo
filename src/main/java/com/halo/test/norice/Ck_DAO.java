package com.halo.test.norice;

import java.io.IOException;


import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;

import com.halo.test.DBManagerhalo_JW;

public class Ck_DAO {

	public static void regNotice(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		try {

			String title = request.getParameter("title");
			String select = request.getParameter("select");
			String txt = request.getParameter("txt");
			if (title != "" && txt != "" && select != null) {

				System.out.println("txt 구간(1) :::" + txt);
//			String saveFnameValues[] = request.getParameterValues("saveFname");
//			System.out.println("saveFnameValues :::" + saveFnameValues[0]);
//			System.out.println("saveFnameValues :::" + saveFnameValues[1]);
				String[] saveFnameValues = request.getParameterValues("saveFname");

				if (saveFnameValues != null) {
					// 이미지 중앙정렬 이건 취소함 왜냐면 이미지 하나를 추가할 때마다 45자씩 추가되기 때문에 차라리 css 파일에 추가하면 상대적으로 더 많은
					// 이미지를 넣을 수 있기 때문이다
//				txt = txt.replace("<figure", "<figure style=\'display:flex; justify-content:center;\'");
					int startPos = 0; // 현재 위치를 추적하기 위한 변수
					for (int i = 0; i < saveFnameValues.length; i++) {
						// 다음 <img 태그의 시작 위치를 찾습니다.
						int imgPos = txt.indexOf("<img", startPos);
						if (imgPos == -1)
							break; // 더 이상 <img 태그가 없으면 반복을 중단합니다.

						// <img 태그를 대체할 새로운 문자열을 생성합니다.
						String toReplace = "<img src=\'" + saveFnameValues[i] + "'>";

						// 기존의 <img 태그를 새로운 문자열로 대체합니다.
						txt = txt.substring(0, imgPos) + toReplace + txt.substring(txt.indexOf(">", imgPos) + 1);

						// 현재 위치를 업데이트합니다.
						startPos = imgPos + toReplace.length();
						System.out.println();
						System.out.println("txt 구간(2) :::" + txt);
						System.out.println("saveFName: " + saveFnameValues[i]);
					}
				}

				System.out.println(title);
				System.out.println(select);
//			System.out.println(saveFName);
//			txt = txt.replace("img", "img src=\'" + saveFName + "\'");

				System.out.println("//////////////////////");
				int titleLength = title.length();
//			int selectLength = select.length();
				int txtLength = txt.length();
				System.out.println("제목 글자 수 : " + titleLength);
//			System.out.println("카테고리 글자 수 : "+ selectLength);
				System.out.println("내용 글자 수 : " + txtLength);

				Connection con = null;
				PreparedStatement pstmt = null;
				String sql = "INSERT INTO announced_tbl (an_seq, an_title, an_content, an_writer, an_category) "
						+ "VALUES (announced_tbl_seq.nextval, ?, ?, ?, ?)";

				con = DBManagerhalo_JW.connect();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, title);
				pstmt.setString(2, txt);
				pstmt.setString(3, "산타");
				pstmt.setString(4, select);

				if (pstmt.executeUpdate() == 1) {
					System.out.println("등록성공 Ck_DAO NOTICE");
					System.out.println("---------------");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}