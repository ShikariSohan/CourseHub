package sohan.mongodbtutorial.converter;
import org.bson.Document;
import org.bson.types.ObjectId;
 
import sohan.mongodbtutorial.model.Product;
 
public class ProductConverter {
 
    // convert Product Object to MongoDB Document
    // take special note of converting id String to ObjectId
    public static Document toDocument(Product p) {
        Document doc = new Document("name", p.getName()).append("price", p.getPrice());
        if (p.getId() != null) {
            doc.append("_id", new ObjectId(p.getId()));
        }
        return doc;
    }
 
    public static Product toProduct(Document doc) {
        Product p = new Product();
        p.setName((String) doc.get("name"));
        p.setPrice((Double) doc.get("price"));
        p.setId(((ObjectId) doc.get("_id")).toString());
        return p;
    }
}