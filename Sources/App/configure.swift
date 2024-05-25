import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
        hostname: Environment.get("localhost") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
        username: Environment.get("postgres") ?? "postgres",
        password: Environment.get("marwa") ?? "marwa",
        database: Environment.get("booksBackend") ?? "booksBackend",
        tls: .prefer(try .init(configuration: .clientDefault)))
    ), as: .psql)
    
    
    app.migrations.add(CreateNewBooks())
    app.migrations.add(CreateBestBooks())
    try await app.autoMigrate()
    
    
    // register routes
    try routes(app)
}
