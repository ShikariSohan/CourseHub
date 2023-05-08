package sohan.mongodbtutorial.converter;

import org.bson.Document;
import org.bson.types.ObjectId;
import sohan.mongodbtutorial.model.Enroll;


/**
 * A utility class that converts Enroll objects to and from BSON documents.
 */
public class EnrollConverter {

    /**
     * Converts an Enroll object to a BSON document.
     *
     * @param enroll the Enroll object to convert
     * @return the BSON document representing the Enroll object
     */
    public static Document toDocument(Enroll enroll) {
        Document doc = new Document("courseId", new ObjectId(enroll.getCourseId()));
        doc.append("studentId", new ObjectId(enroll.getStudentId()));
        if (enroll.getId() != null) {
            doc.append("_id", new ObjectId(enroll.getId()));
        }
        return doc;
    }

    /**
     * Converts a BSON document to an Enroll object.
     *
     * @param doc the BSON document to convert
     * @return the Enroll object represented by the BSON document
     */
    public static Enroll toEnroll(Document doc) {
        Enroll enroll = new Enroll();
        enroll.setId(((ObjectId) doc.get("_id")).toString());
        enroll.setCourseId(((ObjectId) doc.get("courseId")).toString());
        enroll.setStudentId(((ObjectId) doc.get("studentId")).toString());
        return enroll;
    }
}