package com.halo.user.introduce.announcement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.halo.test.DBManager_ody;

public class AnnouncedDAO {
    
    public static void getAllAnnouncements(HttpServletRequest request) {

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM announced_tbl ORDER BY an_seq DESC";
        System.out.println("DB 연결 확인1");

        try {
            con = DBManager_ody.connect();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            System.out.println("DB 연결 확인2");

            ArrayList<Announced_tbl_DTO> announcements = new ArrayList<>();
            Announced_tbl_DTO announcement;

            while (rs.next()) {
                int an_seq = rs.getInt("an_seq");
                String an_title = rs.getString("an_title");
                String an_content = rs.getString("an_content");
                String an_writer = rs.getString("an_writer");
                Date an_reg_date = rs.getDate("an_reg_date");
                String an_category = rs.getString("an_category");
                String an_img = "default_image_path"; // 임시로 설정된 이미지 경로, 실제 이미지 경로로 변경 필요

                announcement = new Announced_tbl_DTO(an_seq, an_title, an_content, an_writer, an_reg_date, an_category, an_img);
                announcements.add(announcement);
            }

            request.setAttribute("announcements", announcements);
            System.out.println("request.setAttribute 실행");

            String result = "조회 성공(표시해야 할 경우 조회 결과 메시지)";
            request.setAttribute("result", result);

        } catch (Exception e) {
            System.out.println("에러 발생");
            e.printStackTrace();
        } finally {
            DBManager_ody.close(con, pstmt, rs);
        }
    }
}
