//
//  File.swift
//  
//
//  Created by marwa awwad mohamed awwad on 23/05/2024.
//
import Vapor
import Fluent

final class BestBook: Model, Content {
    static var schema = "bestBooks"

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
    var publisherId: String

    @Field(key: "author_id")
    var authorId: String

    @Field(key: "created_at")
    var createdAt: String

    @Field(key: "updated_at")
    var updatedAt: String

    @Field(key: "pdf_url")
    var pdfURL: String?
    
    init() { }

    init(image: String? = nil,
         title: String,
         subtitle: String,
         isbn: String? = nil,
         description: String,
         releasedOn: String,
         publisherId: String,
         authorId: String,
         createdAt: String,
         updatedAt: String,
         pdfURL: String? = nil ) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.isbn = isbn
        self.description = description
        self.releasedOn = releasedOn
        self.publisherId = publisherId
        self.authorId = authorId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.pdfURL = pdfURL
    }
}
