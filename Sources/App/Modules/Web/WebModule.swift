//
//  WebModule.swift
//  
//
//  Created by Pat Butler on 2022-02-22.
//

import Vapor

struct WebModule: ModuleInterface {

	 let router = WebRouter()

	 func boot(_ app: Application) throws {
		  try router.boot(routes: app.routes)
	 }
	
	func setUP(_ app: Application) throws {
		try router.setUpRoutesHooks(app: app)
	}
}
