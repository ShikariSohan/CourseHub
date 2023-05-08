package sohan.mongodbtutorial.converter;

import org.bson.Document;
import org.bson.types.ObjectId;

import sohan.mongodbtutorial.model.User;

/**
 * A utility class that provides methods for converting between User objects and MongoDB Documents.
 */
public class UserConverter {

    /**
     * Converts a User object to a MongoDB Document.
     *
     * @param u The User object to convert
     * @return The MongoDB Document
     */
    public static Document toDocument(User u) {
        Document doc = new Document("name", u.getName());
        doc.append("password", u.getPassword());
        doc.append("role", u.getRole());
        doc.append("email", u.getEmail());
        doc.append("username", u.getUsername());
        doc.append("dept", u.getDept());
        doc.append("isValid", u.getValid());

        if (u.getId() != null) {
            doc.append("_id", new ObjectId(u.getId()));
        }
        return doc;
    }

    /**
     * Converts a MongoDB Document to a User object.
     *
     * @param doc The MongoDB Document to convert
     * @return The User object
     */
    public static User toUser(Document doc) {
        User u = new User();
        u.setName((String) doc.get("name"));
        u.setEmail((String) doc.get("email"));
        u.setPassword((String) doc.get("password"));
        u.setRole((String) doc.get("role"));
        u.setDept((String) doc.get("dept"));
        u.setUsername((String) doc.get("username"));
        u.setValid((Boolean) doc.get("isValid"));
        u.setId(((ObjectId) doc.get("_id")).toString());
        return u;
    }
}
