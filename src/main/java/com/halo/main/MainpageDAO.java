package com.halo.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class MainpageDAO {

	public static void getAllHompage_common(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from hompage_common";
		try {
			con = DBManagerhalo.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			HomepageDTO hdto = null;
//			ArrayList<HomepageDTO> hdtos = new ArrayList<HomepageDTO>();
			while (rs.next()) {
				hdto = new HomepageDTO();
				hdto.setH_seq(rs.getInt("h_seq"));
				hdto.setH_logo_img(rs.getString("h_logo_img"));
				hdto.setH_slogan(rs.getString("h_slogan"));
				hdto.setH_left_banner_title(rs.getString("h_left_banner_title"));
				hdto.setH_center_banner_title(rs.getString("h_center_banner_title"));
				hdto.setH_right_banner_title(rs.getString("h_right_banner_title"));
				hdto.setH_left_banner_img(rs.getString("h_left_banner_img"));
				hdto.setH_center_banner_img(rs.getString("h_center_banner_img"));
				hdto.setH_right_banner_img(rs.getString("h_right_banner_img"));
				hdto.setH_tel_no(rs.getString("h_tel_no"));
				hdto.setH_fax_no(rs.getString("h_fax_no"));
				hdto.setH_phone_no(rs.getString("h_phone_no"));
				hdto.setH_email(rs.getString("h_email"));
				hdto.setH_address(rs.getString("h_address"));
				hdto.setH_resume_file(rs.getString("h_resume_file"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManagerhalo.close(con, pstmt, rs);
		}
		
	}
	
}
