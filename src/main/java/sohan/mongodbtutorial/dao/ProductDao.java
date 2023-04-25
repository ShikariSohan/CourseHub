package sohan.mongodbtutorial.dao;


import java.util.ArrayList;
import java.util.List;
 
import org.bson.Document;
import org.bson.types.ObjectId;
 
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;
 
import sohan.mongodbtutorial.converter.ProductConverter;
import sohan.mongodbtutorial.model.Product;
 
public class ProductDao {
    private MongoCollection<Document> coll;
 
    public ProductDao(MongoClient mongo) {
        this.coll = mongo.getDatabase("coursehub").getCollection("product");
    }
 
    public Product create(Product p) {
        Document doc = ProductConverter.toDocument(p);
        this.coll.insertOne(doc);
        ObjectId id = (ObjectId) doc.get("_id");
        p.setId(id.toString());
        return p;
    }
 
    public void update(Product p) {
        this.coll.updateOne(Filters.eq("_id", new ObjectId(p.getId())), new Document("$set", ProductConverter.toDocument(p)));
    }
 
    public void delete(String id) {
        this.coll.deleteOne(Filters.eq("_id", new ObjectId(id)));
    }
 
    public boolean exists(String id) {
        FindIterable<Document>  doc = this.coll.find(Filters.eq("_id", id)).limit(1);
        return doc != null;
    }
 
    public List<Product> getList() {
        List<Product> list = new ArrayList<>();
        for (Document doc : coll.find()) {
            list.add(ProductConverter.toProduct(doc));
        }
        return list;

    }
 
    public Product getProduct(String id) {
        Document doc = this.coll.find(Filters.eq("_id", new ObjectId(id))).first();
        return ProductConverter.toProduct(doc);
    }
}