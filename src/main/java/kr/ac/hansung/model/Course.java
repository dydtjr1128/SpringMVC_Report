package kr.ac.hansung.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class Course {	
	private int id;
	@Size(min=7, max=7, message="HansungId must be 7 chars")
	@NotEmpty(message="The hansungID address cannot be empty")
	private String hansungID;
	@Size(min=2, max=5, message="hansungName must be between 2 and 5 chars")
	@NotEmpty(message="The hansungName address cannot be empty")
	private String hansungName;
	private int year;
	private int semester;
	@Size(min=7, max=7, message="courseCode must be 7 chars")
	@NotEmpty(message="The courseCode address cannot be empty")
	private String courseCode;
	@Size(min=1, max=15, message="courseCode must be between 1 and 15 chars")
	@NotEmpty(message="The courseName address cannot be empty")
	private String courseName;
	private String division;
	private int grade;	
}