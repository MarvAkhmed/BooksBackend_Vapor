import Vapor
import Fluent

final class NewBook: Model, Content {
    
    static var schema = "newBooks"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "image")
    var image: String?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "subtitle")
    var subtitle: String
    
    @Field(key: "isbn")
    var isbn: String?
    
    @Field(key: "description")
    var description: String
    
    @Field(key: "released_on")
    var releasedOn: String
    
    @Field(key: "publisher_id")
    var publisherId: String?
    
    @Field(key: "author_id")
    var authorId: String
    
    @Field(key: "created_at")
    var createdAt: String?
    
    @Field(key: "updated_at")
    var updatedAt: String?
    
    init() { }
    
    init(id: UUID? = nil,
         image: String? = nil,
         title: String,
         subtitle: String,
         isbn: String? = nil,
         description: String,
         releasedOn: String,
         publisherId: String? = nil,
         authorId: String) {
        self.id = id
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.isbn = isbn
        self.description = description
        self.releasedOn = releasedOn
        self.publisherId = publisherId
        self.authorId = authorId
    }
}
