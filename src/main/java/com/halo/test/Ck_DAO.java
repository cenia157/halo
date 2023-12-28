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
			String saveFName = request.getParameter("saveFname");

			System.out.println(title);
			System.out.println(select);
			System.out.println(saveFName);
			txt = txt.replace("img", "img src=\'" + saveFName + "\'");
			System.out.println(txt);

			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = "INSERT INTO announced_tbl " + "(an_seq, an_title, an_content, an_writer, an_category) "
					+ "VALUES (announced_tbl_seq.nextval, ?, ?, ?, ?)";

			con = DBManagerhalo_JW.connect();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, txt);
			pstmt.setString(3, "더미작성자2");
			pstmt.setString(4, select);

			if (pstmt.executeUpdate() == 1) {
				System.out.println("등록성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
