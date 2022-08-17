//
//  configure.swift
//
//
//  Created by Pat Butler on 2022. 2. 16..
//

import Vapor
import Fluent
import FluentSQLiteDriver
import Liquid
import LiquidLocalDriver
@_exported import ThoughtbubbleApi  /// this function has not yet gone throught the Swift evolution procress(consider it experimental)


public func configure(_ app: Application) throws {
	
	/// use the Public directory to serve public files
	app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
	
	/// extend paths to always contain a trailing slash
	app.middleware.use(ExtendPathMiddleware())
	
	/// Set up Fluent with a SQLite database under the Resources Directory
	let dbPath = app.directory.resourcesDirectory + "db.sqlite"
	app.databases.use(.sqlite(.file(dbPath)), as: .sqlite)
	
	/// Set up Liquid using the local file storage driver
	app.fileStorages.use(.local(publicUrl: "http://localhost:8080",
										 publicPath: app.directory.publicDirectory,
										 workDirectory: "assets"), as: .local)
	
	/// Set up the max file upload limit. This changes the global upload limit on all routes..and may need to be changed later.
	app.routes.defaultMaxBodySize = "10mb"
	
	/// set up sessions
	app.sessions.use(.fluent)
	app.migrations.add(SessionRecord.migration)
	app.middleware.use(app.sessions.middleware)
	
	/// setup modules
	let modules: [ModuleInterface] = [
		WebModule(),
		UserModule(),
		AdminModule(),
		ApiModule(),
		BlogModule(),
	]
	for module in modules {
		try module.boot(app)
	}
	for module in modules {
		try module.setUp(app)
	}
	
	/// use automatic database migration
	try app.autoMigrate().wait()
	print("waiting for database migration....")
}


