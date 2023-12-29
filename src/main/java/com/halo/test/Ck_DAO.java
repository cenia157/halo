package com.halo.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;

public class Ck_DAO {

	public static void regNotice(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		try {
			String title = request.getParameter("title");
			String select = request.getParameter("select");
			String txt = request.getParameter("txt");

			String saveFnameValues = request.getParameter("saveFname");

			
			
			
			
			if (saveFnameValues != null) {
			    String[] saveArray = saveFnameValues.split("&");

			    int saveIndex = 0; // saveArray의 인덱스를 나타내는 변수

			    // txt 문자열 내에서 각 img 태그를 찾아 대체
			    while (txt.contains("<img")) {
			        // <img 태그의 시작 위치
			        int startIndex = txt.indexOf("<img");

			        // <img 태그의 끝 위치
			        int endIndex = txt.indexOf(">", startIndex) + 1;

			        // <img 태그 추출
			        String imgTag = txt.substring(startIndex, endIndex);

			        // 이미 src 속성이 있는 경우에만 대체
			        if (!imgTag.contains("src")) {
			            // <img 태그에 src 속성이 없으면 대체
			            txt = txt.replaceFirst("<img", "<img src='" + saveArray[saveIndex++] + "'");
			            System.out.println("Replaced: " + imgTag);
			        } else {
			            // 이미 src 속성이 있으면 endIndex까지를 그대로 사용
			            System.out.println("Skipped: " + imgTag);
			            saveIndex++;
			        }
			    }
			}

			
			
			
			
			
			
			
			
			
			
			
			
			
			System.out.println("33333333333333333");
			System.out.println(title);
			System.out.println(select);
//			System.out.println(saveFName);
			System.out.println(txt);

			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = "INSERT INTO announced_tbl " + "(an_seq, an_title, an_content, an_writer, an_category) "
					+ "VALUES (announced_tbl_seq.nextval, ?, ?, ?, ?)";

			con = DBManagerhalo_JW.connect();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, txt);
			pstmt.setString(3, "산타");
			pstmt.setString(4, select);

			if (pstmt.executeUpdate() == 1) {
				System.out.println("등록성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
