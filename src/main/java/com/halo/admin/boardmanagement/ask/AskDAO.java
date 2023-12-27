package com.halo.admin.boardmanagement.ask;

import java.io.Console;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.halo.main.DBManagerhalo;
import com.halo.test.DBManagerhalo_YJ;

public class AskDAO {

	public static void AskAnswerSubmit(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into comment_tbl values (comment_tbl_seq.nextval, ?, ?, sysdate, ?,?)";
		
		try {
			con = DBManagerhalo_YJ.connect();
			pstmt = con.prepareStatement(sql);

			
			pstmt.setString(1, "ハロー");
			pstmt.setString(2, request.getParameter("c_comment_content"));
			pstmt.setString(3, "1");
			pstmt.setString(4, request.getParameter("q_seq"));
			
			
			if (pstmt.executeUpdate()==1) {
				System.out.println("코멘트 성공");
			} else {
				System.err.println("코멘트 실패");
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public static String AnswerOrNot(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "select c_answer from comment_tbl where c_seq=?";
		String c_answer = null;
		
		try {
			con = DBManagerhalo_YJ.connect();
			pstmt = con.prepareStatement(sql);

			c_answer = request.getParameter("c_answer");
			pstmt.setString(1, request.getParameter("c_answer"));
		
			
				if (c_answer != null) {
					c_answer = "完";
				}else {
					c_answer = "未";
				}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return c_answer;
	}
	
	public static String commentList(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Comment> commentList = new ArrayList<Comment>();
		String jsonResult = null;
		
		int c_seq = 0;
		String c_commenter_name = null;
		String c_comment_content = null;
		Date c_reg_date = null;
		String c_answer = null;
		int q_seq = 0;
		
		String sql = "select * from comment_tbl where c_seq=? and q_seq=?";
		response.setContentType("application/json");
		
		try {
			con = DBManagerhalo_YJ.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("c_seq"));
			pstmt.setString(2, request.getParameter("q_seq"));
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				c_seq = rs.getInt(1);
				c_commenter_name = rs.getString(2);
				c_comment_content = rs.getString(3);
				c_reg_date = rs.getDate(4);
				c_answer = rs.getString(5);
				q_seq = rs.getInt(6);
				
				Comment comment = new Comment(c_seq, c_commenter_name, c_comment_content, c_reg_date, c_answer);
				commentList.add(comment);
				
				ObjectMapper objectmapper = new ObjectMapper();
				jsonResult = objectmapper.writeValueAsString(commentList);
				System.out.println("CommentList: "+ jsonResult);
			}

		} catch (ClassNotFoundException | SQLException | JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return jsonResult;
	}
	
}

