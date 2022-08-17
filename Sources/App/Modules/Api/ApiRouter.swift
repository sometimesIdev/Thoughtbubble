//
//  ApiRouter.swift
//  
//
//  Created by Pat Butler on 2022-03-04.
//

import Vapor

struct ApiRouter: RouteCollection {
	
	func boot(routes: RoutesBuilder) throws {}
	
	func setUpRoutesHooks(app: Application) throws {
		let apiRoutes = app.routes
			.grouped(AuthenticatedUser.guardMiddleware())
			.grouped("api")
		
		let _: [Void] = app.invokeAll("api-routes", args: ["routes": apiRoutes])
	}
}
