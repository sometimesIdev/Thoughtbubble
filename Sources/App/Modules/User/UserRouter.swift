//
//  UserRouter.swift
//  
//
//  Created by Pat Butler on 2022-02-23.
//

import Vapor

struct UserRouter: RouteCollection {
	
	let frontendController = UserFrontendController()
	let apiController = UserApiController()
	
	func boot(routes: RoutesBuilder) throws {
		routes.get("sign-in", use: frontendController.signInView)
		routes
			.grouped(UserCredentialsAuthenticator())
			.post("sign-in", use: frontendController.signInAction)
		
		routes.get("sign-out", use: frontendController.signOut)
		
		routes.grouped("api")
			.grouped(UserCredentialsAuthenticator())
			.post("sign-in", use: apiController.signInApi)
	}
}
