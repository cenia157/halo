package com.halo.admin.boardmanagement.ask;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import com.halo.main.DBManagerhalo;

public class AskDAO {

	public static void AskAnswerSubmit(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into comment_tbl values (comment_tbl_seq.nextval, ?, ?, sysdate, ?)";
		
		try {
			System.out.println("AskDao");
			try {
				con = DBManagerhalo.connect();
				pstmt = con.prepareStatement(sql);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			String c_commenter_name = request.getParameter("c_commenter_name");
			String c_comment_content = request.getParameter("c_comment_content");
			String c_answer = request.getParameter("c_answer");
			
//			개발자 확인용
			System.out.println(c_commenter_name);
			System.out.println(c_comment_content);
			System.out.println(c_answer);
//			개발자 확인용 끝
			
			pstmt.setString(1, c_commenter_name);
			pstmt.setString(2, c_comment_content);
			pstmt.setString(3, c_answer);

		
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
}
