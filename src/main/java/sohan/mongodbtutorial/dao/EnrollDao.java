package sohan.mongodbtutorial.dao;

import com.mongodb.client.model.Sorts;
import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;

import sohan.mongodbtutorial.converter.CourseConverter;
import sohan.mongodbtutorial.converter.EnrollConverter;
import sohan.mongodbtutorial.converter.UserConverter;
import sohan.mongodbtutorial.model.Enroll;
import sohan.mongodbtutorial.model.User;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class EnrollDao {
    private MongoCollection<Document> coll, user;

    public EnrollDao(MongoClient mongo) {
        this.coll = mongo.getDatabase("coursehub").getCollection("enroll");
        this.user = mongo.getDatabase("coursehub").getCollection("user");
    }

    public Enroll create(Enroll p) {
        Document doc = EnrollConverter.toDocument(p);
        this.coll.insertOne(doc);
        ObjectId id = (ObjectId) doc.get("_id");
        p.setId(id.toString());
        return p;
    }

    public boolean checkDuplicate(String studentId, String courseId) {
        Document doc = this.coll.find(
                Filters.and(
                        Filters.eq("courseId", new ObjectId(courseId)),
                        Filters.eq("studentId", new ObjectId(studentId))
                )).first();
        if (doc == null)
            return false;
        else return true;
    }

    public List<Enroll> getCourseList(String studentId) {
        FindIterable<Document> iterable = coll.find(Filters.eq("studentId", new ObjectId(studentId)));
        List<Enroll> list = new ArrayList<>();
        for (Document doc : iterable) {
            list.add(EnrollConverter.toCourse(doc));
        }
        return list;
    }

    public List<Enroll> getStudentList(String courseId) {
        FindIterable<Document> iterable = coll.find(Filters.eq("courseId", new ObjectId(courseId)));
        List<Enroll> list = new ArrayList<>();
        for (Document doc : iterable) {
            list.add(EnrollConverter.toCourse(doc));
        }
        return list;
    }

}
