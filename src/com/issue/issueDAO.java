package com.issue;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class issueDAO {

	int cnt = 0;
	PreparedStatement psmt =null;
	Connection conn = null;
	ResultSet rs = null;
	issueDTO info = null;
	
	public void conn() {
		try {
			// class 찾기 : 이클립스 - DB 사이에 통로를 만들어 주는 역할
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// DB의 문을 열 수 있는 주소와 아이디, 비밀번호
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbid = "hr";
			String dbpw = "hr";
			
			// DB문을 열 수 있는 카드키
			conn = DriverManager.getConnection(url, dbpw, dbid);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) {
				rs.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	// 작성 일자
	public String getDate() {
		try {
			conn();
			
			String sql = "select now()";
			
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				return rs.getNString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}
	
	//글쓰기
	public int write(issueDTO dto) {
		try {
			conn();
			
			String sql = "insert into issue(idx,title,user_id,up_date,content,available) values(issue_seq.NEXTVAL,?,?,SYSDATE,?,?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getUser_id());
			psmt.setString(3, dto.getContent());
			psmt.setInt(4, 1);	//글의 유효 번호
			
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	//게시글 보기
	public issueDTO getIssueDTO(int idx) {
		try {
			conn();
			
			String sql = "select * from issue where idx";
			
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				info.setIdx(rs.getInt(1));
				info.setTitle(rs.getString(2));
				info.setUser_id(rs.getString(3));
				info.setUp_date(rs.getString(4));
				info.setContent(rs.getString(5));
				info.setAvailable(rs.getString(6));
				
				return info;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
