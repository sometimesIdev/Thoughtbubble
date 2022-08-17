//
//  AdminModule.swift
//  
//
//  Created by Pat Butler on 2022-02-25.
//

import Vapor

struct AdminModule: ModuleInterface {
	
	let router = AdminRouter()
	
	func boot(_ app: Application) throws {
		try router.boot(routes: app.routes)
		
		app.hooks.register("admin-routes", use: router.adminRoutesHook)
	}
	
	func setUP(_ app: Application) throws {
		try router.setUpRoutesHooks(app: app)
	}
}
