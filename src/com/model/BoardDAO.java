package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class BoardDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt = 0;

	public void conn() {
		try {
			// Class찾기 : 이클립스와 DB 사이에서 통로를 만들어주는 역할
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// DB에 로그인 할 아이디, 패스워드, url을 지정
			String dbid = "hr";
			String dbpw = "hr";
			String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
			// Connection 객체를 사용해서 DB에 연결 : DB문을 열 수 있는 카드키
			conn = DriverManager.getConnection(dburl, dbid, dbpw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // 오류메세지 출력
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int count() {
		
		try {
			conn();
			
			String sql = "SELECT COUNT(*) FROM board";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public String pasing(String data) {
		try {
			
			data = new String(data.getBytes("8859_1"), "EUC-KR");
			
		} catch (Exception e){
			e.printStackTrace();
		}
		return data;
	}
	
	public ArrayList<BoardDTO> getMemberList() {

		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			
			conn();
			String sql = "SELECT num, username, title, b_date, b_view, indent from board ORDER BY ref DESC, step ASC";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				boolean dayNew = false;
				dto.setNum(rs.getInt(1));
				dto.setUsername(rs.getString(2));
				dto.setTitle(rs.getString(3));
				
				Date date = new Date();
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
				String year = (String)simpleDate.format(date);
				String yea = rs.getString(4);
				
				if(year.equals(yea)){
					dayNew = true;
				}
				
				dto.setB_date(yea);
				dto.setB_view(rs.getInt(5));
				dto.setIndent(rs.getInt(6));
				dto.setDayNew(dayNew);
				list.add(dto);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			conn();
		}
		return list;
	}
	
	public int getMax() {
		
		int max = 0;
		
		try {
			conn();
			
			String sql = "SELECT MAX(num) FROM board";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				max = rs.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return max;
	}
	
	public void insertWrite(BoardDTO dto, int max) {
		
		try {
			conn();
			
			String sql = "INSERT INTO board(num, username, password, title, content, b_date, b_view, ref, indent, step) VALUES(num_board.nextval, ?, ?, ?, ?, sysdate, 0, ?, 0, 0)";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, pasing(dto.getUsername()));
			psmt.setString(2, pasing(dto.getPassword()));
			psmt.setString(3, pasing(dto.getTitle()));
			psmt.setString(4, pasing(dto.getContent()));
			psmt.setInt(5, max+1);
			
			psmt.execute();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public BoardDTO getView(int idx) {

		BoardDTO dto = new BoardDTO();
		
		try {
			conn();
			
			String sql = "SELECT username, title, content, b_date, b_view, password, ref, indent, step FROM board WHERE num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setUsername(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setB_date(rs.getString(4));
				dto.setB_view(rs.getInt(5)+1);
				dto.setPassword(rs.getString(6));
				dto.setRef(rs.getInt(7));
				dto.setIndent(rs.getInt(8));
				dto.setStep(rs.getInt(9));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	
	public void UpdateHit(int idx) {
		
		try {
			conn();
			String sql = "UPDATE board SET b_view=b_view+1 where num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			psmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	
	public boolean checkPassword(BoardDTO dto, int idx) {
		boolean ch = false;
		
		try {
			conn();
			
			String sql = "SELECT num FROM board where num = ? and password = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			psmt.setString(2, dto.getPassword());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				ch = true;
			} else {
				ch = false;
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return ch;
	}
	
	public void delete(int idx) {
		
		try {
			conn();
			
			String sql = "DELETE FROM board WHERE num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			psmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public void modify(BoardDTO dto, int idx) {

		try {
			conn();
			
			String sql = "UPDATE board SET title = ?, content = ? WHERE num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pasing(dto.getTitle()));
			psmt.setString(2, pasing(dto.getContent()));
			psmt.setInt(3, idx);
			psmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public void UpdateStep(int ref, int step) {
		
		try {
			conn();
			
			String sql = "UPDATE board SET step = step + 1 WHERE ref = ? AND step > ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, ref);
			psmt.setInt(1, step);
			psmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public void insertReply(BoardDTO dto, int ref, int indent, int step) {

		try {
			conn();
			String sql = "INSERT INTO board(num, username, password, title, content, b_date, b_view, ref, indent, step) " + "VALUES (num_board.nextval, ?, ?, ?, ?, sysdate, 0, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, pasing(dto.getUsername()));
			psmt.setString(2, pasing(dto.getPassword()));
			psmt.setString(3, pasing(dto.getTitle()));
			psmt.setString(4, pasing(dto.getContent()));
			psmt.setInt(5, ref);
			psmt.setInt(6, indent+1);
			psmt.setInt(7, step+1);
			
			psmt.execute();
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}	
}
