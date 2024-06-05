//
//  File.swift
//  
//
//  Created by marwa awwad mohamed awwad on 23/05/2024.
//
import Foundation
import Fluent

struct CreateBestBooks: Migration {
    func prepare(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("bestBooks")
            .id()
            .field("image", .string)
            .field("title", .string, .required)
            .field("subtitle", .string, .required)
            .field("isbn", .string)
            .field("description", .string, .required)
            .field("released_on", .string)
            .field("publisher_id", .string)
            .field("author_id", .string)
            .field("created_at", .string)
            .field("updated_at", .string)
            .field("pdf_url", .string)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("bestBooks").delete()
    }
}
