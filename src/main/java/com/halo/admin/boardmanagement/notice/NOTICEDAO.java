package com.halo.admin.boardmanagement.notice;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.halo.admin.boardmanagement.ask.QuestionNComment;
import com.halo.admin.boardmanagement.frequenthyask.FAQ;
import com.halo.main.DBManagerhalo;
import com.halo.test.DBManagerhalo_JW;
import com.halo.test.DBManagerhalo_YJ;

public class NOTICEDAO {

	private static ArrayList<Notice> NOTICEs;

	public static void getAllNOTICE(HttpServletRequest request, HttpServletResponse response) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from ANNOUNCED_TBL order by an_seq ASC";

		try {
			con = DBManagerhalo_JW.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			NOTICEs = new ArrayList<Notice>();
			Notice notice;

			while (rs.next()) {
				int an_seq = rs.getInt("an_seq");
				String an_title = rs.getString("an_title");
				String an_content = rs.getString("an_content");
				String an_writer = rs.getString("an_writer");
				Date an_reg_date = rs.getDate("an_reg_date");
				String an_category = rs.getString("an_category");

				/*
				 * System.out.println(
				 * "////////////////////////////////////////////////////////////////");
				 * System.out.println(an_seq); System.out.println(an_title);
				 * System.out.println(an_content); System.out.println(an_writer);
				 * System.out.println(an_reg_date); System.out.println(an_category);
				 * System.out.println(
				 * "////////////////////////////////////////////////////////////////");
				 */
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

		request.setAttribute("curPageNo", page);
		System.out.println("page: " + page);

		int cnt = 8;
		int total = NOTICEs.size();
		System.out.println("total ::: " + total);
		int pageCount = (int) Math.ceil((double) total / cnt);
		request.setAttribute("pageCount", pageCount);
		System.out.println("pageCount: " + pageCount);

		int start = total - (cnt * (page - 1));
		System.out.println("start ::: " + start);

		int end = (page == pageCount) ? -1 : start - (cnt + 1);

		ArrayList<Notice> items = new ArrayList<Notice>();

		for (int i = start - 1; i > end; i--) {
			items.add(NOTICEs.get(i));
		}
		request.setAttribute("NOTICEs", items);

	}

	
	
	
	
	
	
}
