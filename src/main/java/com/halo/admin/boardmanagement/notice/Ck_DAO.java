package com.halo.admin.boardmanagement.notice;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

import com.halo.main.DBManagerhalo;
import com.halo.test.DBManagerhalo_JW;

public class Ck_DAO {

	public static void regNotice(HttpServletRequest request) throws IOException {

		request.setCharacterEncoding("utf-8");
		
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		
		try {
			String writer;
			String title = CommonUtility.escapeHtml(request.getParameter("title"));
			String select = CommonUtility.escapeHtml(request.getParameter("select"));
			String txt = request.getParameter("txt");
			
			if(request.getParameter("writer").equals("")) {
				writer = "세션없음";
			} else {
				writer = request.getParameter("writer");
			}
			
			if (title != "" && txt != "" && select != null) {

				String[] saveFnameValues = request.getParameterValues("saveFname");

				if (saveFnameValues != null) {

					int startPos = 0;
					for (int i = 0; i < saveFnameValues.length; i++) {
						int imgPos = txt.indexOf("<img", startPos);
						if (imgPos == -1)
							break; 

						String toReplace = "<img src=\'" + saveFnameValues[i] + "'>";
						txt = txt.substring(0, imgPos) + toReplace + txt.substring(txt.indexOf(">", imgPos) + 1);

						startPos = imgPos + toReplace.length();
					}
				}

				String sql = "INSERT INTO announced_tbl (an_seq, an_title, an_content, an_writer, an_category) "
						+ "VALUES (announced_tbl_seq.nextval, ?, ?, ?, ?)";

				con = DBManagerhalo_JW.connect();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, title);
				pstmt.setString(2, txt);
				pstmt.setString(3, writer);
				pstmt.setString(4, select);

				if (pstmt.executeUpdate() == 1) {
					System.out.println("등록성공");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				DBManagerhalo_JW.close(con, pstmt, rs);
		        System.out.println("신규 등록 찐 닫음");
		    
		}

	}

	// 사실은 업데이트문임 ^@^
	public static void deleteNotice(HttpServletRequest request) throws UnsupportedEncodingException {

		request.setCharacterEncoding("utf-8");
		
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		
		try {
			String title = request.getParameter("title");
			String select = request.getParameter("select");
			String txt = request.getParameter("txt");
			String seq = request.getParameter("seq");
			
			if (title != "" && txt != "" && select != null ) {

				String[] saveFnameValues = request.getParameterValues("saveFname");

				if (saveFnameValues != null) {

					int startPos = 0; 
					for (int i = 0; i < saveFnameValues.length; i++) {
						int imgPos = txt.indexOf("<img", startPos);
						if (imgPos == -1)
							break; 

						String toReplace = "<img src=\'" + saveFnameValues[i] + "'>";

						txt = txt.substring(0, imgPos) + toReplace + txt.substring(txt.indexOf(">", imgPos) + 1);

						startPos = imgPos + toReplace.length();
					}
				} // if

				String sql = "UPDATE announced_tbl SET an_title = ?, an_content = ?, an_category = ? WHERE an_seq = ?";

				con = DBManagerhalo_JW.connect();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, title);
				pstmt.setString(2, txt);
				pstmt.setString(3, select);
				pstmt.setString(4, seq);

				if (pstmt.executeUpdate() == 1) {
					System.out.println("수정성공");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			DBManagerhalo_JW.close(con, pstmt, rs);
	        System.out.println("업데이트 찐닫음");
	    }
	}

} // end class
