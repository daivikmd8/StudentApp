package com.student.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//import com.mysql.cj.protocol.Resultset;
import com.student.connectors.connectionFactory;
import com.student.dto.student;

public class StudentDAOImpl implements studentDAO{

	private Connection con;
	
	public StudentDAOImpl() {
		this.con = connectionFactory.requestConnection();
	}
    
	@Override
	public boolean insertStudent(student s) {
		// TODO Auto-generated method stub
		String query="INSERT INTO STUDENT2 VALUES(0,?,?,?,?,?,?,SYSDATE())";
		PreparedStatement ps=null;
		int res=0;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, s.getName());
			ps.setLong(2, s.getPhone());
			ps.setString(3,s.getEmail());
			ps.setString(4,s.getBranch());
			ps.setString(5,s.getLocation());
			ps.setString(6,s.getPassword());
			res=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}else {
		return false;
	  }
	} 
	@Override
	public boolean updateStudent(student s) {
		// TODO Auto-generated method stub
		PreparedStatement ps = null;
		int res= 0;
		String query;
		
		switch(s.getOption()) {
		case 1 :
			query = "update student2 set name =?  where id = ?";
			
			try {
				ps = con.prepareStatement(query);
				
				ps.setString(1, s.getName());
				ps.setInt(2, s.getId());
				res = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case 2:
			query = "update student2 set phone =?  where id = ?";
			
			try {
				ps = con.prepareStatement(query);
				
				ps.setLong(1, s.getPhone());
				ps.setInt(2, s.getId());
				res = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case 3:
			query = "update student2 set email =?  where id = ?";
			
			try {
				ps = con.prepareStatement(query);
				
				ps.setString(1, s.getEmail());
				ps.setInt(2, s.getId());
				res = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case 4:
			query = "update student2 set Branch =?  where id = ?";
			
			try {
				ps = con.prepareStatement(query);
				
				ps.setString(1, s.getBranch());
				ps.setInt(2, s.getId());
				res = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		
		case 5:
			query = "update student2 set Location =?  where id = ?";
			
			try {
				ps = con.prepareStatement(query);
				ps.setString(1, s.getLocation());
				ps.setInt(2, s.getId());
				res = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case 6:
			query = "update student2 set Password =?  where id = ?";
			
			try {
				ps = con.prepareStatement(query);
				
				ps.setString(1, s.getPassword());
				ps.setInt(2, s.getId());
				res = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		
		}	
		if(res>0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public boolean deleteStudent(int id) {
		// TODO Auto-generated method stub
		String query="delete from student2 where id=?";
		PreparedStatement ps=null;
		int res=0;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, id);
			res=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0) {
			return true;
		}else {
		return false;
	}
	} 
	@Override
	public boolean updateStudentpassword(student s) {
		// TODO Auto-generated method stub
		PreparedStatement ps = null;
		int res = 0;
		String query = "update student2 set password = ? where email = ? and phone = ?";
		
		try {
			con.setAutoCommit(false);
			ps = con.prepareStatement(query);
			ps.setString(1, s.getPassword());
			ps.setLong(3, s.getPhone());
			ps.setString(2, s.getEmail());
			
			res = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return true;
		}else {
			return false;
		}
	}
	@Override
	public student getStudent(String mail, String pass) {
		// TODO Auto-generated method stub
		PreparedStatement ps =null;
		ResultSet rs = null;
		student s = null;
		String query = "select * from student2 where Email = ?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, mail);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				String emailid = rs.getString("Email");
				String Passw = rs.getString("Password");
				
				if(mail.equals(emailid) && pass.equals(Passw)) {
					s = new student();
					s.setId(rs.getInt("id"));
					s.setName(rs.getString("name"));
					s.setPhone(rs.getLong("phone"));
					s.setEmail(rs.getString("Email"));
					s.setBranch(rs.getString("Branch"));
					s.setLocation(rs.getString("Location"));
					s.setPassword(rs.getString("Password"));
					s.setDate(rs.getString("Date"));
					
				}else {
					System.out.println("Invalid Credentials");
				}
	
			}else {
				System.out.println("fail");
			}
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}

	@Override
	public List<student> getStudent() {
		// TODO Auto-generated method stub
		ArrayList<student> stu =new ArrayList<student>();
		student s=null;
		String query="select * from student2";
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()) {
				s=new student();
				s.setName(rs.getString("Name"));
				s.setId(rs.getInt("id"));
				s.setBranch(rs.getString("Branch"));
				s.setPhone(rs.getLong("Phone"));
				s.setEmail(rs.getString("Email"));
				s.setLocation(rs.getString("Location"));
				s.setDate(rs.getString("Date"));
				s.setPassword(rs.getString("Password"));
				stu.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stu;
	}

	@Override
	public boolean updateStudentProfile(student s) {
		// TODO Auto-generated method stub
		String query="update student2 set Name=?, Phone=? ,email=? ,branch=? ,location=? where id=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		int res=0;
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setString(1, s.getName());
			ps.setLong(2, s.getPhone());
			ps.setString(3, s.getEmail());
			ps.setString(4, s.getBranch());
			ps.setString(5, s.getLocation());
			ps.setInt(6, s.getId());
			res=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}else {
		return false;
	}
}
}
