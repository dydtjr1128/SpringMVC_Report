package kr.ac.hansung.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.CourseDAO;
import kr.ac.hansung.model.Course;
import kr.ac.hansung.model.CourseByDivision;
import kr.ac.hansung.model.CourseBySemester;

@Service
public class CourseService {
	@Autowired
	private CourseDAO courseDAO;
	
	public List<CourseBySemester> getCourseBySemester(){
		return courseDAO.getCourseBySemester();
	}
	public List<Course> getCourseBySemesterDetail(int year, int semester){
		return courseDAO.getCourseBySemesterDetail(year, semester);
	}
	public List<CourseByDivision> getCourseByDivision(){
		return courseDAO.getCourseByDivision();
	}
	public List<Course> getCourseByNextSemester(){
		return courseDAO.getCourseByNextSemester();
	}
	public int getCount() {
		return courseDAO.getCount();
	}
	public void insert(Course course) {
		courseDAO.insert(course);
	}
}
