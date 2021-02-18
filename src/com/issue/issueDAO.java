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
	
	//게시글 번호 부여
	public int getNext() {
		try {
			conn();
			//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다.
			String sql = "select num from issue order by num desc";
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
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
}
