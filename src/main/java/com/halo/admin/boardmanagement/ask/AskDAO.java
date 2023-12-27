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
	        ArrayList<Comment> commentList = new ArrayList<>();
	        String jsonResult = null;

	        // TODO: 데이터베이스 연결 및 예외 처리 등 필요한 부분은 여기에 추가

	        try {
	            con = DBManagerhalo_YJ.connect();

	            // 댓글 조회 SQL
	            String sql = "SELECT * FROM comment_tbl WHERE q_seq = ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, request.getParameter("q_seq"));
	            System.out.println(request.getParameter("q_seq"));
	            System.out.println("c_seq: "+ request.getParameter("c_seq"));
	            System.out.println("c_commenter_name: "+ request.getParameter("c_commenter_name"));
	            System.out.println("c_comment_content: "+ request.getParameter("c_comment_content"));
	            System.out.println("c_reg_date: " + request.getParameter("c_reg_date"));
	            System.out.println("c_answer: " + request.getParameter("c_answer"));
	            System.out.println("q_seq: "+ request.getParameter("q_seq"));

	            rs = pstmt.executeQuery();

	            while (rs.next()) {
	                int cSeq = rs.getInt("c_seq");
	                String cCommenterName = rs.getString("c_commenter_name");
	                String cCommentContent = rs.getString("c_comment_content");
	                Date cRegDate = rs.getDate("c_reg_date");
	                String cAnswer = rs.getString("c_answer");
	                int qSeq = rs.getInt("q_seq");
	                
		            System.out.println("c_seq: "+ request.getParameter("c_seq"));
		            System.out.println("c_commenter_name: "+ request.getParameter("c_commenter_name"));
		            System.out.println("c_comment_content: "+ request.getParameter("c_comment_content"));
		            System.out.println("c_reg_date: " + request.getParameter("c_reg_date"));
		            System.out.println("c_answer: " + request.getParameter("c_answer"));
		            System.out.println("q_seq: "+ request.getParameter("q_seq"));

	                Comment comment = new Comment(cSeq, cCommenterName, cCommentContent, cRegDate, cAnswer, qSeq);
	                commentList.add(comment);
	            }

	            // 댓글 리스트를 JSON 형태로 변환
	            ObjectMapper objectMapper = new ObjectMapper();
	            jsonResult = objectMapper.writeValueAsString(commentList);

	        } catch (ClassNotFoundException | SQLException | JsonProcessingException e) {
	            e.printStackTrace();
	        } finally {
	            DBManagerhalo_YJ.close(con, pstmt, rs);
	        }

	        return jsonResult;
	    }
		

	
}

