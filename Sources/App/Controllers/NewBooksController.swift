//
//  NewBooksController.swift
//
//
//  Created by marwa awwad mohamed awwad on 23/05/2024.
//

import Fluent
import Vapor

class NewBooksController: RouteCollection {
    
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let newBooks = routes.grouped("newBooks")
        newBooks.get(use: index)
        newBooks.post (use: create)
    }
    
    // GET REQUSE: /newBooks
    func index(req: Request) throws -> EventLoopFuture<[NewBook]> {
        return NewBook.query(on: req.db).all()
    }
    
    // POST REQUESET: /newBooks
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let newBook = try req.content.decode(NewBook.self)
        return newBook.save(on: req.db).transform(to: .ok )
    }
     
    
}

