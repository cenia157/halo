package com.halo.main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
		

	public void getAllHompage_common(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from homepage_common";
		try {
			con = DBManagerhalo.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			HomepageDTO hdto = null;
			
			if (rs.next()) {
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
				
				//뷰에 뿌릴 어트리뷰트
				request.setAttribute("hdto", hdto);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManagerhalo.close(con, pstmt, rs);
			//하단베너 출력
			getAllBanner(request);
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

	
	//로고 수정 메소드
	public void updateLogo(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String newFileName = request.getParameter("newFileName");
		String sql = "update homepage_common set h_logo_img = ? where h_seq=1";
		String paramName = "error";
		String param = "등록 실패";
		try {
			con = DBManagerhalo.connect();
//			System.out.println(newFileName);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, newFileName);
			if (pstmt.executeUpdate() == 1) {
				System.out.println("등록 성공!");
				
				param = "등록 성공!";
				paramName ="success";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("db server error...");
		}finally {
			request.setAttribute("paramName", paramName);
			request.setAttribute("param", param);
			DBManagerhalo.close(con, pstmt, null);
		}
	}
	
	

	public void updateFooter(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update homepage_common set h_tel_no=?, h_fax_no=?, h_phone_no=?, h_email=?, h_address=? where h_seq=1";
		String paramName = "error";
		String param = "등록 실패";
		try {
			request.setCharacterEncoding("utf-8");
			con = DBManagerhalo.connect();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, request.getParameter("h_tel_no"));
			pstmt.setString(2, request.getParameter("h_fax_no"));
			pstmt.setString(3, request.getParameter("h_phone_no"));
			pstmt.setString(4, request.getParameter("h_email"));
			pstmt.setString(5, request.getParameter("h_address"));
			if (pstmt.executeUpdate() == 1) {
				System.out.println("등록 성공!");
				
				param = "등록 성공!";
				paramName ="success";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("db server error...");
		}finally {
			request.setAttribute("paramName", paramName);
			request.setAttribute("param", param);
			DBManagerhalo.close(con, pstmt, null);
		}
		
	}
	
	
	//하단베너 DTO
	public void getAllBanner(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select b_index, b_type, b_m_name, b_url, nvl(b_m_text, 'empty') as b_m_text, nvl(b_img_url, 'empty') as b_img_url from banner_test order by b_index";
		String paramName = "error";
		String param = "조회 실패";
		
		try {
			con = DBManagerhalo.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<BannerInformDTO> bannersInform = new ArrayList<BannerInformDTO>();
			
			while (rs.next()) {
				BannerInformDTO tempBannerInform = new BannerInformDTO();
				tempBannerInform.setB_index(rs.getInt(1));
				tempBannerInform.setB_type(rs.getInt(2));
				tempBannerInform.setB_m_name(rs.getString(3));
				tempBannerInform.setB_url(rs.getString(4));
				tempBannerInform.setB_m_text(rs.getString(5));
				tempBannerInform.setB_img_url(rs.getString(6));
				
				System.out.println(tempBannerInform);
				
				bannersInform.add(tempBannerInform);
			}
			
			request.setAttribute("bannersInform", bannersInform);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			request.setAttribute("paramName", paramName);
			request.setAttribute("param", param);
			DBManagerhalo.close(con, pstmt, null);
		}
		
	}
	
	
	
	//하단베너 업로드 ajax 미리보기 (멀티파트로 까서 어트리뷰트 넘겨주기만 하는 용도 DB는 변경버튼 누를때 업뎃메서드 사용예정)
	public void uploadBanner(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String savepath = request.getServletContext().getRealPath("user/upload_imgs/banner");
		MultipartRequest mr = new MultipartRequest(request, savepath, 1024*1024*20, "utf-8", new DefaultFileRenamePolicy());
		
		 String fileName = mr.getFilesystemName("banner_thumbnail1");
		 System.out.println("업로드할 파일 :"+fileName);
		 response.getWriter().write(fileName);

		
	}
	
	
	//하단베너 업데이트
	public void updateBanner(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		String paramName = "error";
		String param = "등록 실패";
		String savepath = request.getServletContext().getRealPath("user/upload_imgs/banner");
		
		try {
			
			con = DBManagerhalo.connect();
			MultipartRequest mr = new MultipartRequest(request, savepath, 1024*1024*20, "utf-8", new DefaultFileRenamePolicy());
			String[] banner_menus = {mr.getParameter("banner_menu1"),mr.getParameter("banner_menu2"),mr.getParameter("banner_menu3")};
			//하단베너3개 => for문 i = name뒤에 붙을 인덱스번호, 
			 Enumeration<String> fileNames = mr.getFileNames();
			for(int i = 0; i < 3; i++) {
				if(banner_menus[i].equals("sales")) {
					sql = "update banner_test \r\n"
							+ "set b_type = 2, b_m_name = 'sales', b_url = ?, b_m_text = ?, b_img_url = ? \r\n"
							+ "where b_index = " + (i+1);
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, mr.getParameter("banner_url" + (i+1)));
					pstmt.setString(2, mr.getParameter("banner_text" + (i+1)));
					fileNames.hasMoreElements();
					String fieldName = fileNames.nextElement();
					pstmt.setString(3, mr.getFilesystemName(fieldName));
//					System.out.println("업뎃 파일 :" + mr.getFilesystemName(mr.getFilesystemName(fieldName)));
										
				} else {
					sql = "update banner_test \r\n"
							+ "set b_type = 1, b_m_name = ?, b_url = (select m_servlet from menu_test where m_name = ?), b_m_text = (select m_text from menu_test where m_name = ?) \r\n"
							+ "where b_index = " + (i+1);
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, banner_menus[i]);
					pstmt.setString(2, banner_menus[i]);
					pstmt.setString(3, banner_menus[i]);
				}
				if(pstmt.executeUpdate() > 0) {
					System.out.println("bannerNo: " + i + "update Success");
				} else {
					System.out.println("bannerNo: " + i + "update Fail");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("db server error...");
		}finally {
			request.setAttribute("paramName", paramName);
			request.setAttribute("param", param);
			DBManagerhalo.close(con, pstmt, null);
		}
	}
	
	
	
	
	
}
