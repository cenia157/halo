package com.halo.admin.boardmanagement.ask;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import com.halo.main.DBManagerhalo;

public class AskDAO {

	public static void AskAnswerSubmit(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into comment_tbl values (comment_tbl_seq.nextval, ?, ?, sysdate, ?)";
		
		try {
			try {
				con = DBManagerhalo.connect();
				pstmt = con.prepareStatement(sql);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			pstmt.setString(1, request.getParameter("c_commenter_name"));
			pstmt.setString(2, request.getParameter("c_comment_content"));
			pstmt.setString(3, request.getParameter("c_answer"));
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public static String AnswerOrNot(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "select c_answer from comment_tbl where c_seq=?";
		String c_answer = null;
		
		try {
			try {
				con = DBManagerhalo.connect();
				pstmt = con.prepareStatement(sql);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			c_answer = request.getParameter("c_answer");
			pstmt.setString(1, request.getParameter("c_answer"));
		
			
				if (c_answer != null) {
					c_answer = "完";
				}else {
					c_answer = "未";
				}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c_answer;
	}
	
}
