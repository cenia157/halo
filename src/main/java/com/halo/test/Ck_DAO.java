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
		String title = request.getParameter("title");
		String select = request.getParameter("select");
		String txt = request.getParameter("txt");
//		�̰��� �̹��� �����;��Ѵ�
		System.out.println(title);
		System.out.println(select);
		System.out.println(txt);

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO notice (id, title, txt, writer, category, img) VALUES (notice_seq.nextval, ?, ?, '������', ?, ?)";

// ������ notice_seq.nextval, 'Ÿ��Ʋ', '�ؽ�Ʈ', '������', '�Ϲ�', '�̹���'

		try {
			con = DBManagerJW.connect();
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