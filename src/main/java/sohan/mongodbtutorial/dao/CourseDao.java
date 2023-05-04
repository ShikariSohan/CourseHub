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
import sohan.mongodbtutorial.converter.UserConverter;
import sohan.mongodbtutorial.model.Course;
import sohan.mongodbtutorial.model.Enroll;
import sohan.mongodbtutorial.model.User;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CourseDao {
    private MongoCollection<Document> coll, user;

    public CourseDao(MongoClient mongo) {
        this.coll = mongo.getDatabase("coursehub").getCollection("course");
        this.user = mongo.getDatabase("coursehub").getCollection("user");
    }

    public Course create(Course p) {
        Document doc = CourseConverter.toDocument(p);
        this.coll.insertOne(doc);
        ObjectId id = (ObjectId) doc.get("_id");
        p.setId(id.toString());
        return p;
    }

    public List<Course> getRecentCourses() {
        List<Course> courses = new ArrayList<>();

        HashMap<String, String> teacherMap = getMappedTeacher();
        FindIterable<Document> iterable = coll.find().sort(Sorts.descending("_id")).limit(2);
        for (Document doc : iterable) {
            String teacherId = doc.getObjectId("teacher").toString();
            String teacherName = teacherMap.getOrDefault(teacherId, "Unknown");
            courses.add(CourseConverter.toCourse(doc, teacherName));
        }
        return courses;
    }

    public List<Course> getAllCourse(boolean isArchived) {
        List<Course> courses = new ArrayList<>();
        HashMap<String, String> teacherMap = getMappedTeacher();
        FindIterable<Document> iterable = coll.find(Filters.eq("isArchived", isArchived));
        for (Document doc : iterable) {
            String teacherId = doc.getObjectId("teacher").toString();
            String teacherName = teacherMap.getOrDefault(teacherId, "Unknown");
            courses.add(CourseConverter.toCourse(doc, teacherName));
        }
        return courses;
    }


    private HashMap<String, String> getMappedTeacher() {
        FindIterable<Document> teachers = user.find(Filters.eq("role", "teacher"));
        HashMap<String, String> teacherMap = new HashMap<>();
        for (Document teacher : teachers) {
            String teacherId = teacher.getObjectId("_id").toString();
            String teacherName = teacher.getString("name");
            teacherMap.put(teacherId, teacherName);
        }
        return teacherMap;
    }

    public int getCourseCount() {
        return (int) coll.countDocuments();
    }

    public int getRunningCourseCount() {
        return (int) coll.countDocuments(Filters.eq("isArchived", false));
    }

    public void archiveACourse(String id) {
        ObjectId objectId;
        try {
            objectId = new ObjectId(id);
        } catch (IllegalArgumentException e) {
            return;
        }
        Document filter = new Document("_id", objectId);
        Document update = new Document("$set", new Document("isArchived", true));
        this.coll.updateOne(filter, update);

    }

    public String getCourseId(String courseCode) {
        Document courseDoc = coll.find(
                Filters.and(
                        Filters.eq("courseCode", courseCode),
                        Filters.eq("isArchived", false)
                )
        ).first();
        if (courseDoc == null) {
            return null;
        } else {
            return courseDoc.getObjectId("_id").toString();
        }
    }

    public List<Course> getStudentCourses(List<Enroll> enrolls) {
        List<Course> courses = new ArrayList<>();
        HashMap<String, String> teacherMap = getMappedTeacher();
        for (Enroll enroll : enrolls) {
            String id = enroll.getCourseId();
            Document doc = coll.find(Filters.eq("_id", new ObjectId(id))).first();
            if (doc != null && !doc.getBoolean("isArchived")) {
                String teacherId = doc.getObjectId("teacher").toString();
                String teacherName = teacherMap.getOrDefault(teacherId, "Unknown");
                courses.add(CourseConverter.toCourse(doc, teacherName));
            }
        }
        return courses;
    }

    public Course getCourseById(String id) {
        ObjectId objectId;
        try {
            objectId = new ObjectId(id);
        } catch (IllegalArgumentException e) {
            // invalid object id
            return null;
        }

        Document doc = coll.find(new Document("_id", objectId)).first();
        if (doc == null) {
            // course not found
            return null;
        }

        String teacherId = doc.getObjectId("teacher").toString();
        String teacherName = getTeacherNameById(teacherId);
        return CourseConverter.toCourse(doc, teacherName);
    }

    private String getTeacherNameById(String id) {
        Document doc = user.find(new Document("_id", new ObjectId(id))).first();
        if (doc == null) {
            return "Unknown";
        }
        return doc.getString("name");
    }

    public void deleteTeacherCourses(String id) {
        this.coll.deleteMany(Filters.eq("teacher", new ObjectId(id)));
    }

    public List<Course> getTeacherCourse(String id) {
        List<Course> courses = new ArrayList<>();
        HashMap<String, String> teacherMap = getMappedTeacher();
        FindIterable<Document> iterable = coll.find(Filters.eq("teacher", new ObjectId(id)));
        for (Document doc : iterable) {
            String teacherId = doc.getObjectId("teacher").toString();
            String teacherName = teacherMap.getOrDefault(teacherId, "Unknown");
            courses.add(CourseConverter.toCourse(doc, teacherName));
        }
        return courses;
    }

}
