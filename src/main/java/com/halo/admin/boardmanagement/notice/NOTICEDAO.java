package com.halo.admin.boardmanagement.notice;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.halo.test.DBManagerhalo_JW;

public class NOTICEDAO {

	private static ArrayList<Notice> NOTICEs;

	public static void getAllNOTICE(HttpServletRequest request, HttpServletResponse response) {
		// 체크박스 벨류
		String checkBoxVal[] = {"announcement","schedule","general","service","product"};
		String checkVal = request.getParameter("checkVal");
		System.out.println(checkVal +"체크벨이요");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from ANNOUNCED_TBL where ";
		for (int i = 0; i < checkVal.length(); i++) {
			int checkValIndex = Integer.parseInt(Character.toString(checkVal.charAt(i)));
			sql += "an_category = '" + checkBoxVal[checkValIndex]+"' ";
			if(i != checkVal.length()-1) {
				sql += " or ";
			}
		}
		sql += " order by an_seq ASC";
		System.out.println(sql);
		try {
			con = DBManagerhalo_JW.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			NOTICEs = new ArrayList<Notice>();
			Notice notice = null;

			while (rs.next()) {
				int an_seq = rs.getInt("an_seq");
				String an_title = rs.getString("an_title");
				String an_content = rs.getString("an_content");
				String an_writer = rs.getString("an_writer");
				Date an_reg_date = rs.getDate("an_reg_date");
				String an_category = rs.getString("an_category");
				
				notice = new Notice(an_seq, an_title, an_content, an_writer, an_reg_date, an_category);
				NOTICEs.add(notice);
			}

			request.setAttribute("NOTICEs", NOTICEs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManagerhalo_JW.close(con, pstmt, rs);
		}

	}

	public static String NOTICEList(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Notice> NOTICEList = new ArrayList<Notice>();
		String jsonresult = null;

		int an_seq = 0;
		String an_title = null;
		String an_content = null;
		String an_writer = null;
		Date an_reg_date = null;
		String an_category = null;

		String sql = "SELECT * FROM ANNOUNCED_TBL WHERE an_seq = ?";
		response.setContentType("application/json");

		try {
			con = DBManagerhalo_JW.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("an_seq"));
			rs = pstmt.executeQuery();

			if (rs.next()) {
				an_seq = rs.getInt(1);
				an_title = rs.getString(2);
				an_content = rs.getString(3);
				an_writer = rs.getString(4);
				an_reg_date = rs.getDate(5);
				an_category = rs.getString(6);

				Notice notice = new Notice(an_seq, an_title, an_content, an_writer, an_reg_date, an_category);

				NOTICEList.add(notice);
			}
			ObjectMapper objectMapper = new ObjectMapper();
			jsonresult = objectMapper.writeValueAsString(NOTICEList);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManagerhalo_JW.close(con, pstmt, rs);
		}
		return jsonresult;

	}

	public static void NOTICEpagingAdmin(int page, HttpServletRequest request) {


		int cnt = 8;
		int total = NOTICEs.size();
		int pageCount = (int) Math.ceil((double) total / cnt);
		if(pageCount < page ) {
			page = pageCount;
		}
			
			request.setAttribute("pageCount", pageCount);
		
		
		int start = total - (cnt * (page - 1));

		int end = (page == pageCount) ? -1 : start - (cnt + 1);

		ArrayList<Notice> items = new ArrayList<Notice>();
		if(NOTICEs.size() != 0) {
			for (int i = start - 1; i > end; i--) {
				items.add(NOTICEs.get(i));
			}
		}
		request.setAttribute("curPageNo", page);
		request.setAttribute("NOTICEs", items);

	}

	public static void realDeleteNotice(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete announced_tbl where an_seq = ?"; 
		
		try {
			con = DBManagerhalo_JW.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("an_seq"));
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("realDeleteNotice() 삭제 성공!!!");
			}

		} catch (Exception e) {
			System.out.println("realDeleteNotice() 삭제 실패");
			e.printStackTrace();
		} finally {
			DBManagerhalo_JW.close(con, pstmt, null);
	    } // finally
		
		
	}
}
