package sohan.mongodbtutorial.model;

public class Course {
    private String id;
    private String name;
    private String courseCode;
    private Boolean isArchived;
    private String teacher;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public Boolean getIsArchived() {
        return isArchived;
    }

    public void setIsArchived(Boolean isArchived) {
        this.isArchived = isArchived;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public Course(String id, String name, String courseCode, Boolean isArchived, String teacher) {
        this.id = id;
        this.name = name;
        this.courseCode = courseCode;
        this.isArchived = isArchived;
        this.teacher = teacher;
    }

    public Course() {
    }
}
