package com.halo.test;

import java.io.BufferedReader;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

public class Ck_DAO {

	public static void regNotice(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		// title
		// txt
		// date
		// img

		
		
//		String select = null;
//
//		if (request.getParameter("select") == "announcement") {
//			select = "announcement";
//		} else if (request.getParameter("select") == "schedule") {
//			select = "schedule";
//		} else if (request.getParameter("select") == "general") {
//			select = "general";
//		} else if (request.getParameter("select") == "service") {
//			select = "service";
//		} else if (request.getParameter("select") == "product") {
//			select = "product";
//		} else {
//			System.out.println("select�� �ƹ����� ������� �ʴ�");
//		}

		String title = request.getParameter("title");
		String select = request.getParameter("productA");
		String txt = request.getParameter("txt");
//		�̰��� �̹��� �����;��Ѵ�
		System.out.println(title);
		System.out.println(select);
		System.out.println(txt);

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO announced_tbl "
				+ "(an_seq, an_title, an_content, an_writer, an_category, an_img) "
				+ "VALUES (announced_tbl_seq.nextval, ?, ?, '�ӽõ�����', ?, ?)";

// ����� notice_seq.nextval, 'Ÿ��Ʋ', '�ؽ�Ʈ', '������', '�Ϲ�', '�̹���'

		try {
			con = DBManagerhalo_JW.connect();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, txt);
			pstmt.setString(3, select);
			pstmt.setString(4, "�ӽ��̹���������");

			if (pstmt.executeUpdate() == 1) {
				System.out.println("��ϼ���");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
