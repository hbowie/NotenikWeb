import Fluent
import FluentSQLiteDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.views.use(.leaf)
    app.leaf.cache.isEnabled = app.environment.isRelease
    
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    app.migrations.add(CreateTodo())

    let routers: [RouteCollection] = [
    	FrontendRouter(),
    	NoteListRouter(),
    ]
    for router in routers {
    	try router.boot(routes: app.routes)
    }
}
