//
//  File.swift
//  
//
//  Created by marwa awwad mohamed awwad on 23/05/2024.
//

import Vapor
import Fluent

class BestBooksController: RouteCollection {
    
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let bestBook = routes.grouped("bestBooks")
        bestBook.get(use: index)
        bestBook.post (use: create)
    }
    
    // GET REQUSE: /bestBooks
    func index(req: Request) throws -> EventLoopFuture<[BestBook]> {
        return BestBook.query(on: req.db).all()
    }
    // POST REQUESET: /newBooks
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
          let bestBook = try req.content.decode(BestBook.self)
          return bestBook.save(on: req.db).transform(to: .ok)
      }
    
}
