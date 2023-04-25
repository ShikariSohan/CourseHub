package sohan.mongodbtutorial.converter;

import org.bson.Document;
import org.bson.types.ObjectId;
import sohan.mongodbtutorial.model.Course;
import sohan.mongodbtutorial.model.User;

public class CourseConverter {
    public static Document toDocument(Course u) {
        Document doc = new Document("name", u.getName());
        doc.append("courseCode", u.getCourseCode());
        doc.append("isArchived", u.getIsArchived());
        doc.append("teacher", new ObjectId(u.getTeacher()));
        if (u.getId() != null) {
            doc.append("_id", new ObjectId(u.getId()));
        }
        return doc;
    }

    public static Course toCourse(Document doc, String teacherName) {
        Course u = new Course();
        u.setName((String) doc.get("name"));
        u.setCourseCode((String) doc.get("courseCode"));
        u.setIsArchived((Boolean) doc.get("isArchived"));
        u.setTeacher(teacherName);
        u.setId(((ObjectId) doc.get("_id")).toString());
        return u;
    }
}
