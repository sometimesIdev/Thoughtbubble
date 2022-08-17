//
//  ApiModule.swift
//  
//
//  Created by Pat Butler on 2022-03-03.
//

import Vapor

struct ApiModule: ModuleInterface {
	
	let router = ApiRouter()
	
	func boot(_ app: Application) throws {
		app.middleware.use(ApiErrorMiddleware())
		
		try router.boot(routes: app.routes)
	}
	
	func setUP(_ app: Application) throws {
		try router.setUpRoutesHooks(app: app)
	}
}
