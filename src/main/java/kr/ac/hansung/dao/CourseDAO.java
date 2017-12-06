package kr.ac.hansung.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.model.Course;
import kr.ac.hansung.model.CourseByDivision;
import kr.ac.hansung.model.CourseBySemester;

@Repository
public class CourseDAO {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public int getCount() {
		String sqlStatement = "select count(*) from course";
		int m = jdbcTemplate.queryForObject(sqlStatement, Integer.class);
		return m;
	}

	public List<CourseBySemester> getCourseBySemester() {
		String sqlStatement = "select year, semester, sum(grade) AS 'gradeCount' from course WHERE year<2018 GROUP BY year, semester ORDER BY year ASC, semester ASC";

		return jdbcTemplate.query(sqlStatement, new RowMapper<CourseBySemester>() {

			@Override
			public CourseBySemester mapRow(ResultSet rs, int rowNum) throws SQLException {
				CourseBySemester courseBySemester = new CourseBySemester();
				courseBySemester.setYear(rs.getInt("year"));
				courseBySemester.setSemester(rs.getInt("semester"));
				courseBySemester.setGradeCount(rs.getInt("gradeCount"));

				return courseBySemester;
			}

		});
	}
	public List<Course> getCourseBySemesterDetail(int year, int semester) {
		String sqlStatement = "select * from course WHERE year=? AND semester=?";

		return jdbcTemplate.query(sqlStatement,new Object[] {year, semester}, new RowMapper<Course>() {

			@Override
			public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
				Course course = new Course();
				course.setCourseName(rs.getString("courseName"));
				course.setCourseCode(rs.getString("courseCode"));
				course.setDivision(rs.getString("division"));
				course.setGrade(rs.getInt("grade"));
				course.setId(rs.getInt("id"));
				course.setHansungID(rs.getString("hansungID"));
				course.setHansungName(rs.getString("hansungName"));
				course.setSemester(rs.getInt("semester"));
				course.setYear(rs.getInt("year"));				
				return course;
			}

		});
	}

	public List<CourseByDivision> getCourseByDivision() {
		String sqlStatement = "select division, sum(grade) AS 'score' from course WHERE year<2018  GROUP BY division";
		List<CourseByDivision> courseByDivisions = jdbcTemplate.query(sqlStatement, new RowMapper<CourseByDivision>() {
			@Override
			public CourseByDivision mapRow(ResultSet rs, int rowNum) throws SQLException {
				CourseByDivision courseByDivision = new CourseByDivision();
				courseByDivision.setDivision(rs.getString("division"));
				courseByDivision.setDivisionSum(rs.getInt("score"));
				return courseByDivision;
			}
		});
		CourseByDivision courseByDivision = new CourseByDivision();
		int sum = 0;
		for (int i = 0; i < courseByDivisions.size(); i++) {
			sum += courseByDivisions.get(i).getDivisionSum();
		}
		courseByDivision.setDivision("합계");
		courseByDivision.setDivisionSum(sum);
		courseByDivisions.add(courseByDivision);
		return courseByDivisions;

	}

	public boolean insert(Course course) {
		String courseCode = course.getCourseCode();
		String courseName = course.getCourseName();
		String division = course.getDivision();
		String hansungID = course.getHansungID();
		String hansungName = course.getHansungName();
		int grade = course.getGrade();
		int year = course.getYear();
		int semester = course.getSemester();

		String sqlStatement = "insert into course (hansungID, hansungName, courseCode, courseName, division, grade, year, semester) values (?, ?, ?, ?, ?, ?, ?, ?)";
		return ((jdbcTemplate.update(sqlStatement, new Object[] { hansungID, hansungName, courseCode, courseName,
				division, grade, year, semester })) == 1);
	}

	public List<Course> getCourseByNextSemester() {
		String sqlStatement = "select * from course WHERE year=2018";

		return jdbcTemplate.query(sqlStatement, new RowMapper<Course>() {

			@Override
			public Course mapRow(ResultSet rs, int rowNum) throws SQLException {

				Course course = new Course();
				course.setCourseName(rs.getString("courseName"));
				course.setCourseCode(rs.getString("courseCode"));
				course.setDivision(rs.getString("division"));
				course.setGrade(rs.getInt("grade"));
				course.setId(rs.getInt("id"));
				course.setHansungID(rs.getString("hansungID"));
				course.setHansungName(rs.getString("hansungName"));
				course.setSemester(rs.getInt("semester"));
				course.setYear(rs.getInt("year"));				
				return course;
			}

		});
	}
}
