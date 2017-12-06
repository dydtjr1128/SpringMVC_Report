package kr.ac.hansung.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.hansung.model.Course;
import kr.ac.hansung.model.CourseByDivision;
import kr.ac.hansung.model.CourseBySemester;
import kr.ac.hansung.service.CourseService;

@Controller
public class CourseController {
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("/viewCourse/showCourseBySemester")
	public String showCourseBySemester(Model model) {
		List<CourseBySemester> courseBySemesters = courseService.getCourseBySemester();
	/*	for(int i=0; i<courseBySemesters.size(); i++) {
			CourseBySemester courseBySemester = courseBySemesters.get(i);
			System.out.println(courseBySemester);	
		}*/
		model.addAttribute("courseBySemesters", courseBySemesters);

		return "viewCourse/createdCourseBySemester";
	}
	@RequestMapping("/viewCourse/showCourseBySemesterDetail")
	public String showCourseBySemesterDetail(@RequestParam("year") int year,@RequestParam("semester") int semester,Model model) {
		System.out.println(year + " " + semester);
		List<Course> courses = courseService.getCourseBySemesterDetail(year, semester);
		model.addAttribute("courses", courses);
		return "viewCourse/createdCourseBySemesterDetail";
	}
	@RequestMapping("/viewCourse/showCourseByDivision")
	public String showCourseByDivision(Model model) {
		List<CourseByDivision> courseByDivisions = courseService.getCourseByDivision();
	
		model.addAttribute("courseByDivisions", courseByDivisions);
		return "viewCourse/createdCourseByDivision";
	}
	@RequestMapping("/viewCourse/createCourse")
	public String createCourse(Model model) {
		Course course = new Course();
		course.setGrade(3);		
		course.setSemester(1);
		course.setYear(2018);
		model.addAttribute("course", course);
		return "viewCourse/createCourse";
	}
	@RequestMapping("/viewCourse/doCreateCourse")
	public String doCreateCourse(Model model,@Valid Course course, BindingResult result) {
		course.setGrade(3);		
		course.setSemester(1);
		course.setYear(2018);
		System.out.println(course);
		if(result.hasErrors()) {
			System.out.println("===From data does not validated");
			List<ObjectError> errors = result.getAllErrors();
			for(ObjectError error : errors)
				System.out.println(error.getDefaultMessage());
			return "viewCourse/createCourse";
		}
		
		courseService.insert(course);
		return "viewCourse/createdCourse";
	}
	@RequestMapping("/viewCourse/showCourseByNextSemester")
	public String courseByNextSemester(Model model) {
		List<Course> courses = courseService.getCourseByNextSemester();		
		model.addAttribute("courses", courses);	
	
		
		return "viewCourse/createdCourseByNextSemester";
	}
	
	
}
