
package sohan.mongodbtutorial.dao;

import java.util.ArrayList;
import java.util.List;

import com.mongodb.client.model.Sorts;
import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;

import sohan.mongodbtutorial.converter.UserConverter;
import sohan.mongodbtutorial.model.Enroll;
import sohan.mongodbtutorial.model.User;

/**
 * The UserDao class represents DAO (Data Access Object) operations for the User
 * model in MongoDB.
 */
public class UserDao {
    private MongoCollection<Document> coll;

    /**
     * Constructor to initialize a new UserDao object.
     * 
     * @param mongo MongoClient object used to connect to the MongoDB server.
     */
    public UserDao(MongoClient mongo) {
        this.coll = mongo.getDatabase("coursehub").getCollection("user");
    }

    /**
     * Creates a new User document in the MongoDB collection.
     * 
     * @param p User object to be created.
     * @return User object that was created with ID assigned.
     */
    public User create(User p) {
        Document doc = UserConverter.toDocument(p);
        this.coll.insertOne(doc);
        ObjectId id = (ObjectId) doc.get("_id");
        p.setId(id.toString());
        return p;
    }

    /**
     * Deletes a User document from the MongoDB collection by ID.
     * 
     * @param id ID of the User document to be deleted.
     */
    public void delete(String id) {
        this.coll.deleteOne(Filters.eq("_id", new ObjectId(id)));
    }

    /**
     * Checks whether a User document with a given ID exists in the MongoDB
     * collection.
     * 
     * @param id ID of the User document to check existence of.
     * @return true if document exists, false otherwise.
     */
    public boolean exists(String id) {
        FindIterable<Document> doc = this.coll.find(Filters.eq("_id", id)).limit(1);
        return doc != null;
    }

    /**
     * Checks whether a User document with a given name exists in the MongoDB
     * collection.
     * 
     * @param id Name of the User document to check existence of.
     * @return true if document exists, false otherwise.
     */
    public boolean checkUserName(String id) {
        FindIterable<Document> doc = this.coll.find(Filters.eq("name", id)).limit(1);
        return doc != null;
    }

    /**
     * Gets a List of all User documents in the MongoDB collection.
     * 
     * @return List of all User objects.
     */
    public List<User> getList() {
        List<User> list = new ArrayList<>();
        for (Document doc : coll.find()) {
            list.add(UserConverter.toUser(doc));
        }
        return list;
    }

    /**
     * Gets a User document from the MongoDB collection by ID.
     * 
     * @param id ID of the User document to get.
     * @return User object of the requested ID.
     */
    public User getUser(String id) {
        Document doc = this.coll.find(Filters.eq("_id", new ObjectId(id))).first();
        return UserConverter.toUser(doc);
    }

    /**
     * Checks the username and password credentials of a User document in the
     * MongoDB collection.
     * 
     * @param username Username credential to check.
     * @param password Password credential to check.
     * @return User object if credentials match, null otherwise.
     */
    public User checkCredentials(String username, String password) {
        Document doc = this.coll.find(
                Filters.and(
                        Filters.eq("username", username),
                        Filters.eq("password", password)))
                .first();
        if (doc == null)
            return null;
        else
            return UserConverter.toUser(doc);
    }

    /**
     * 
     * @return list of all students
     */
    public List<User> getAllStudent() {
        List<User> studentList = new ArrayList<>();
        for (Document doc : coll.find(Filters.eq("role", "student"))) {
            studentList.add(UserConverter.toUser(doc));
        }
        return studentList;
    }

    /**
     * 
     * @return list of all Teachers
     */

    public List<User> getAllTeacher() {
        List<User> studentList = new ArrayList<>();
        for (Document doc : coll.find(Filters.eq("role", "teacher"))) {
            studentList.add(UserConverter.toUser(doc));
        }
        return studentList;
    }

    /**
     * @param role role of the user
     * @return count of the user
     */

    public int getUserCount(String role) {
        return (int) coll.countDocuments(Filters.eq("role", role));
    }

    /**
     * @param role role of the user
     * @return list of recent user
     */

    public List<User> getRecentUser(String role) {
        List<User> userList = new ArrayList<>();
        FindIterable<Document> iterable = coll.find(Filters.eq("role", role)).sort(Sorts.descending("_id")).limit(2);
        for (Document doc : iterable) {
            userList.add(UserConverter.toUser(doc));
        }
        return userList;

    }

    /**
     * @param id id of the user
     * @return list of the course
     */
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

    /**
     * @param id id of the user
     */
    public void deleteUser(String id) {
        this.coll.deleteOne(Filters.eq("_id", new ObjectId(id)));
    }
}