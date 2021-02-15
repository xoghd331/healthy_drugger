package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	
	int cnt = 0;
	PreparedStatement psmt =null;
	Connection conn = null;
	ResultSet rs = null;
	MemberDTO info = null;
	
	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbid = "hr";
			String dbpw = "hr";
			
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
	
	public int join(MemberDTO dto) {
		try {
			conn();
			
			String sql = "insert into WEB_MEMBERS values(?,?,?,?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getTel());
			psmt.setString(4, dto.getAddr());
			
			cnt = psmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			close();
		}
		return cnt;
	}
	
	public MemberDTO login(MemberDTO dto) {
		try {
			conn();
			
			String sql = "select from web_members where email = ? and pw = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getPw());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String email = rs.getString("email");
				String pw = rs.getString("pw");
				String tel = rs.getString("tel");
				String addr = rs.getString("address");
				
				info = new MemberDTO(email, pw, tel, addr);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			close();
		}
		return info;
	}
	
	public int update(MemberDTO dto) {
		try {
			conn();
			
			String sql = "update web_members set pw=?, tel=?, address=? where email=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getPw());
			psmt.setString(2, dto.getTel());
			psmt.setString(3, dto.getAddr());
			psmt.setString(4, dto.getEmail());
			
			cnt = psmt.executeUpdate();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			close();
		}
		return cnt;
	}
	
	public ArrayList<MemberDTO> selectMember(){
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		try {
			conn();
			
			String sql = "select * from web_members";
			
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String email = rs.getString("email");
				String pw = rs.getString("pw");
				String tel = rs.getString("tel");
				String addr = rs.getString("address");
				
				info = new MemberDTO(email, pw, tel, addr);
				list.add(info);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			close();
		}
		return list;
	}
	
	public boolean idCheck(String id) {
		boolean check = false;
		
		try {
			conn();
			
			String sql = "select * from web_members where email = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				check = true;
			}
			else {
				check = false;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			close();
		}
		return check;
	}
}
