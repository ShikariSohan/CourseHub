package sohan.mongodbtutorial.dao;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;

import sohan.mongodbtutorial.converter.EnrollConverter;
import sohan.mongodbtutorial.model.Enroll;
import java.util.ArrayList;
import java.util.List;
/**
 * This class represents the EnrollDao for interacting with the enroll collection in MongoDB.
 */
public class EnrollDao {
    private MongoCollection<Document> coll;

    /**
     * Constructs a new EnrollDao with the given MongoClient instance.
     * @param mongo the MongoClient instance to use
     */
    public EnrollDao(MongoClient mongo) {
        this.coll = mongo.getDatabase("coursehub").getCollection("enroll");
    }

    /**
     * Creates a new enrollment record in the enroll collection.
     * @param p the Enroll object to insert into the database
     * @return the Enroll object with the generated id field
     */
    public Enroll create(Enroll p) {
        Document doc = EnrollConverter.toDocument(p);
        this.coll.insertOne(doc);
        ObjectId id = (ObjectId) doc.get("_id");
        p.setId(id.toString());
        return p;
    }

    /**
     * Checks if there is a duplicate enrollment record with the given studentId and courseId.
     * @param studentId the ObjectId of the student
     * @param courseId the ObjectId of the course
     * @return true if there is a duplicate record, false otherwise
     */
    public boolean checkDuplicate(String studentId, String courseId) {
        Document doc = this.coll.find(
                Filters.and(
                        Filters.eq("courseId", new ObjectId(courseId)),
                        Filters.eq("studentId", new ObjectId(studentId))))
                .first();
        if (doc == null)
            return false;
        else
            return true;
    }

    /**
     * Gets a list of enrollment records for a particular student.
     * @param studentId the ObjectId of the student
     * @return a List of Enroll objects for the student
     */
    public List<Enroll> getCourseList(String studentId) {
        FindIterable<Document> iterable = coll.find(Filters.eq("studentId", new ObjectId(studentId)));
        List<Enroll> list = new ArrayList<>();
        for (Document doc : iterable) {
            list.add(EnrollConverter.toEnroll(doc));
        }
        return list;
    }

    /**
     * Gets a list of enrollment records for a particular course.
     * @param courseId the ObjectId of the course
     * @return a List of Enroll objects for the course
     */
    public List<Enroll> getStudentList(String courseId) {
        FindIterable<Document> iterable = coll.find(Filters.eq("courseId", new ObjectId(courseId)));
        List<Enroll> list = new ArrayList<>();
        for (Document doc : iterable) {
            list.add(EnrollConverter.toEnroll(doc));
        }
        return list;
    }

    /**
     * Deletes all enrollment records for a particular student.
     * @param id the ObjectId of the student
     */
    public void deleteStudentEnroll(String id) {
        this.coll.deleteMany(Filters.eq("studentId", new ObjectId(id)));
    }

}
