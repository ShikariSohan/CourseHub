/**
 * This class provides static methods for converting objects of the Course class to and from MongoDB Documents.
 */
package sohan.mongodbtutorial.converter;

import org.bson.Document;
import org.bson.types.ObjectId;
import sohan.mongodbtutorial.model.Course;
import sohan.mongodbtutorial.model.User;

public class CourseConverter {

    /**
     * Converts the specified Course object to a Document.
     *
     * @param u the Course object to convert.
     * @return a Document representing the specified Course object.
     */
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

    /**
     * Converts the specified Document to a Course object.
     *
     * @param doc         the Document to convert.
     * @param teacherName the name of the teacher for the Course.
     * @return a Course object representing the specified Document.
     */
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
