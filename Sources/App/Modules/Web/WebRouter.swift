//
//  WebRouter.swift
//
//
//  Created by Pat Butler on 2022. 2. 16..
//

import Vapor

struct WebRouter: RouteCollection {
    
    let controller = WebFrontendController()

    func boot(routes: RoutesBuilder) throws {
        routes.get(use: controller.homeView)
    }
	
	func setUpRoutesHooks(app: Application) throws {
		app.routes.get(.anything, use: controller.anyResponse)
	}
}
