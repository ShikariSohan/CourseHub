package sohan.mongodbtutorial.converter;

import org.bson.Document;
import org.bson.types.ObjectId;
import sohan.mongodbtutorial.model.Enroll;

public class EnrollConverter {
    public static Document toDocument(Enroll u) {
        Document doc = new Document("courseId", new ObjectId(u.getCourseId()));
        doc.append("studentId", new ObjectId(u.getStudentId()));
        if (u.getId() != null) {
            doc.append("_id", new ObjectId(u.getId()));
        }
        return doc;
    }

    public static Enroll toCourse(Document doc) {
        Enroll u = new Enroll();
        u.setId(((ObjectId) doc.get("_id")).toString());
        u.setCourseId(((ObjectId) doc.get("courseId")).toString());
        u.setStudentId(((ObjectId) doc.get("studentId")).toString());
        return u;
    }
}
