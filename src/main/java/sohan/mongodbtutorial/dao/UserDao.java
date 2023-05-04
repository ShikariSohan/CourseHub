
package sohan.mongodbtutorial.dao;


import java.util.ArrayList;
import java.util.List;

import com.mongodb.client.model.Sorts;
import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;

import sohan.mongodbtutorial.converter.CourseConverter;
import sohan.mongodbtutorial.converter.UserConverter;
import sohan.mongodbtutorial.model.Enroll;
import sohan.mongodbtutorial.model.User;

public class UserDao {
    private MongoCollection<Document> coll;

    public UserDao(MongoClient mongo) {
        this.coll = mongo.getDatabase("coursehub").getCollection("user");
    }

    public User create(User p) {
        Document doc = UserConverter.toDocument(p);
        this.coll.insertOne(doc);
        ObjectId id = (ObjectId) doc.get("_id");
        p.setId(id.toString());
        return p;
    }

//    public void update( p) {
//        this.coll.updateOne(Filters.eq("_id", new ObjectId(p.getId())), new Document("$set", ProductConverter.toDocument(p)));
//    }

    public void delete(String id) {
        this.coll.deleteOne(Filters.eq("_id", new ObjectId(id)));
    }

    public boolean exists(String id) {
        FindIterable<Document> doc = this.coll.find(Filters.eq("_id", id)).limit(1);
        return doc != null;
    }

    public boolean checkUserName(String id) {
        FindIterable<Document> doc = this.coll.find(Filters.eq("name", id)).limit(1);
        return doc != null;
    }

    public List<User> getList() {
        List<User> list = new ArrayList<>();
        for (Document doc : coll.find()) {
            list.add(UserConverter.toUser(doc));
        }
        return list;
    }

    public User getUser(String id) {
        Document doc = this.coll.find(Filters.eq("_id", new ObjectId(id))).first();
        return UserConverter.toUser(doc);
    }

    public User checkCredentials(String username, String password) {
        Document doc = this.coll.find(
                Filters.and(
                        Filters.eq("username", username),
                        Filters.eq("password", password)
                )).first();
        if (doc == null)
            return null;
        else return UserConverter.toUser(doc);
    }

    public List<User> getAllStudent() {
        List<User> studentList = new ArrayList<>();
        for (Document doc : coll.find(Filters.eq("role", "student"))) {
            studentList.add(UserConverter.toUser(doc));
        }
        return studentList;
    }

    public List<User> getAllTeacher() {
        List<User> studentList = new ArrayList<>();
        for (Document doc : coll.find(Filters.eq("role", "teacher"))) {
            studentList.add(UserConverter.toUser(doc));
        }
        return studentList;
    }

    public int getUserCount(String role) {
        return (int) coll.countDocuments(Filters.eq("role", role));
    }

    public List<User> getRecentUser(String role) {
        List<User> userList = new ArrayList<>();
        FindIterable<Document> iterable = coll.find(Filters.eq("role", role)).sort(Sorts.descending("_id")).limit(2);
        for (Document doc : iterable) {
            userList.add(UserConverter.toUser(doc));
        }
        return userList;

    }

    public List<User> getStudentList(List<Enroll> enrolls) {
        List<User> userList = new ArrayList<>();
        for (Enroll enroll : enrolls) {
            String id = enroll.getStudentId();
            Document doc = coll.find(Filters.eq("_id", new ObjectId(id))).first();
            if (doc != null) {
                userList.add(UserConverter.toUser(doc));
            }
        }
        return userList;
    }

    public void deleteUser(String id) {
        this.coll.deleteOne(Filters.eq("_id", new ObjectId(id)));
    }
}