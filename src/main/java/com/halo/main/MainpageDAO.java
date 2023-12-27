package com.halo.main;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import com.oreilly.servlet.MultipartRequest;import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MainpageDAO {
	

	private HomepageDTO hdto = new HomepageDTO();	//인스턴스 생성자
	private static final MainpageDAO MDAO = new MainpageDAO(); //상수(불변)
	
	private MainpageDAO(){
		//외부에서 인스턴스 생성 막기 위해, private으로 기본생성자 잠금
	}
	
	public static MainpageDAO getMdao() {
		return MDAO;
	}
		

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
	
	//로고 미리보기 (멀티파트로 까서 어트리뷰트 넘겨주기만 하는 용도 DB는 변경버튼 누를때 업뎃메서드 사용예정)
	public void uploadLogo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		String savepath = request.getServletContext().getRealPath("user/upload_imgs");
		MultipartRequest mr = new MultipartRequest(request, savepath, 1024*1024*20, "utf-8", new DefaultFileRenamePolicy());
		String fileName = mr.getFilesystemName("logo_img");
		System.out.println(fileName);

		response.getWriter().write(fileName);
    }

    
	
	//로고 등록 메소드(처음에만 쓸거임 test용)
	public static void regLogo(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into homepage_common(homepage_common_seq, h_logo_img) values(homepage_common_seq.nextval, ?)";
		String savepath = request.getRealPath("user/upload_imgs");
		try {
			con = DBManagerhalo.connect();
			pstmt = con.prepareStatement(sql);
			MultipartRequest mr = new MultipartRequest(request, savepath, 1024*1024*20, "utf-8", new DefaultFileRenamePolicy());

			String h_logo_img = mr.getFilesystemName("logo_img");
			pstmt.setString(1, h_logo_img);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("img 등록성공!");
			}
			request.setAttribute("imgPath", "/user/upload_imgs/" + h_logo_img);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("db server error...");
		}finally {
			DBManagerhalo.close(con, pstmt, null);
		}
		
		
	}
	
	//로고 수정 메소드
	public static void updateLogo(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String newFileName = request.getParameter("newFileName");
		String savepath = request.getServletContext().getRealPath("user/upload_imgs/") + newFileName;
		String sql = "update homepage_common set h_logo_img=?";
		try {
			con = DBManagerhalo.connect();
			System.out.println(savepath);
			pstmt = con.prepareStatement(sql);
			//바꿀 이미지
			//업뎃 위치용 시퀀스 넘버 필요없음
			pstmt.setString(1, savepath);
			if (pstmt.executeUpdate() == 1) {
				System.out.println("등록 성공!");
			}else {
				System.out.println("등록 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("db server error...");
		}finally {
			DBManagerhalo.close(con, pstmt, null);
		}
	}
	
	
	
}
