package com.student.dao;

import java.util.List;

import com.student.dto.student;

public interface studentDAO {
public boolean insertStudent(student s);
public boolean updateStudent(student s);
public boolean updateStudentProfile(student s);
public boolean deleteStudent(int id);
public boolean updateStudentpassword(student s);
public student getStudent(String mail,String pass);
public List<student> getStudent();
}
