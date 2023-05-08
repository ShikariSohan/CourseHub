package sohan.mongodbtutorial.dao;

import com.mongodb.client.model.Sorts;
import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import sohan.mongodbtutorial.converter.CourseConverter;
import sohan.mongodbtutorial.model.Course;
import sohan.mongodbtutorial.model.Enroll;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * CourseDao class for interacting with the "course" and "user" collections in the MongoDB database.
 */
public class CourseDao {
    private MongoCollection<Document> coll, user;

    /**
     * Constructor for creating a new CourseDao object.
     *
     * @param mongo The MongoClient to use for database operations.
     */
    public CourseDao(MongoClient mongo) {
        this.coll = mongo.getDatabase("coursehub").getCollection("course");
        this.user = mongo.getDatabase("coursehub").getCollection("user");
    }

    /**
     * Create a new Course document in the "course" collection.
     *
     * @param p The Course object to create.
     * @return The Course object with an updated ID.
     */
    public Course create(Course p) {
        Document doc = CourseConverter.toDocument(p);
        this.coll.insertOne(doc);
        ObjectId id = (ObjectId) doc.get("_id");
        p.setId(id.toString());
        return p;
    }

    /**
     * Get a list of the two most recent Courses in the "course" collection.
     *
     * @return A list of Course objects.
     */
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

    /**
     * Get a list of all Courses in the "course" collection.
     *
     * @param isArchived Whether to include archived Courses in the list.
     * @return A list of Course objects.
     */
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

    /**
     * Get a HashMap of teacher IDs to teacher names for all teachers in the "user" collection with the role "teacher".
     *
     * @return A HashMap of teacher IDs to teacher names.
     */
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

    /**
     * Get the total number of Courses in the "course" collection.
     *
     * @return The number of Courses.
     */
    public int getCourseCount() {
        return (int) coll.countDocuments();
    }

    /**
     * Get the number of active Courses (not archived) in the "course" collection.
     *
     * @return The number of active Courses.
     */
    public int getRunningCourseCount() {
        return (int) coll.countDocuments(Filters.eq("isArchived", false));
    }

    /**
     * 
     * @param id The id of the course to take action
     * @param toggle Toggle between tarchiverue and false
     */
    public void archiveACourse(String id, Boolean toggle) {
        ObjectId objectId;
        try {
            objectId = new ObjectId(id);
        } catch (IllegalArgumentException e) {
            return;
        }
        Document filter = new Document("_id", objectId);
        Document update = new Document("$set", new Document("isArchived", toggle));
        this.coll.updateOne(filter, update);

    }
    /**
     * 
     * @param courseCode 
     * @return
     */
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
    /**
     * 
     * @param enrolls
     * @return
     */

    public List<Course> getStudentCourses(List<Enroll> enrolls) {
        List<Course> courses = new ArrayList<>();
        HashMap<String, String> teacherMap = getMappedTeacher();
        for (Enroll enroll : enrolls) {
            String id = enroll.getCourseId();
            Document doc = coll.find(Filters.eq("_id", new ObjectId(id))).first();
            if (doc != null) {
                String teacherId = doc.getObjectId("teacher").toString();
                String teacherName = teacherMap.getOrDefault(teacherId, "Unknown");
                courses.add(CourseConverter.toCourse(doc, teacherName));
            }
        }
        return courses;
    }
    /**
     * 
     * @param id
     * @return course
     */

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
    /**
     * 
     * @param id
     */
    public void deleteTeacherCourses(String id) {
        this.coll.deleteMany(Filters.eq("teacher", new ObjectId(id)));
    }
    /**
     * 
     * @param id
     * @param isArchived
     * @return
     */
    public List<Course> getTeacherCourse(String id, Boolean isArchived) {
        List<Course> courses = new ArrayList<>();
        HashMap<String, String> teacherMap = getMappedTeacher();
        FindIterable<Document> iterable = coll.find(Filters.and(
                Filters.eq("teacher", new ObjectId(id)),
                Filters.eq("isArchived", isArchived)
        ));
        for (Document doc : iterable) {
            String teacherId = doc.getObjectId("teacher").toString();
            String teacherName = teacherMap.getOrDefault(teacherId, "Unknown");
            courses.add(CourseConverter.toCourse(doc, teacherName));
        }
        return courses;
    }

}