package com.halo.admin.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.halo.main.DBManagerhalo;

public class LoginDAO {
	private static Connection con = null;

	public static void login(HttpServletRequest request) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			request.setCharacterEncoding("UTF-8");
			String sql = "select * from admin_acount where a_id= ? ";

			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			System.out.println("---------------------");
			System.out.println("파라미터 Id ::: " + id);
			System.out.println("파라미터 pw ::: " + pw);

			String dbPW = "";
			String result = "";

			con = DBManagerhalo.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbPW = rs.getString("a_pw");
				System.out.println("dwPW ::: + " + dbPW);

				if (pw.equals(dbPW)) {
					result = "成功";
					System.out.println("result ::: " + result);
					AdminDTO adminDTO = new AdminDTO();
					adminDTO.setA_id(id);
					adminDTO.setA_pw(dbPW);
					adminDTO.setA_name(rs.getString("a_name"));

					HttpSession hs = request.getSession();
					hs.setMaxInactiveInterval(1800);
					hs.setAttribute("login_session", adminDTO);

				} else {
					result = "パスワードエラー！";
					System.out.println("result ::: " + result);
				} // inner if-else

			} else {
				result = "存在しないアカウント(ログイン失敗)";
				System.out.println("result ::: " + result);
			} // if-else
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println("Account_DAO의 login() 오류 발생");
			e.printStackTrace();
		} finally {
			DBManagerhalo.close(con, pstmt, rs);
		}
	}

	public static void logout(HttpServletRequest request) {
		// 로그아웃 하는일
		
		// 애초에 만들어진적이 없거나, 설정 시간 만료 
		// 세션 죽으면
		HttpSession hs = request.getSession();
		hs.setAttribute("login_session", null);
		System.out.println("--------------");
		System.out.println("세션종료 실행");
//		hs.removeAttribute("account");
//		hs.invalidate(); // 비 권장 
	} // logout()

}
