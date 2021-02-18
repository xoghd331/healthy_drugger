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
			// class ã�� : ��Ŭ���� - DB ���̿� ��θ� ����� �ִ� ����
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// DB�� ���� �� �� �ִ� �ּҿ� ���̵�, ��й�ȣ
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbid = "hr";
			String dbpw = "hr";
			
			// DB���� �� �� �ִ� ī��Ű
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
	// �ۼ� ����
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
		return ""; // �����ͺ��̽� ����
	}
	
	//�۾���
	public int write(issueDTO dto) {
		try {
			conn();
			
			String sql = "insert into issue(idx,title,user_id,up_date,content,available) values(issue_seq.NEXTVAL,?,?,SYSDATE,?,?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getUser_id());
			psmt.setString(3, dto.getContent());
			psmt.setInt(4, 1);	//���� ��ȿ ��ȣ
			
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	//�Խñ� ����
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
