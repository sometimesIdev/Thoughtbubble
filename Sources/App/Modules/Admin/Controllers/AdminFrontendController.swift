//
//  AdminFrontendController.swift
//  
//
//  Created by Pat Butler on 2022-02-25.
//

import Vapor

struct AdminFrontendController {
	
	func dashboardView(req: Request) throws -> Response {
		let user = try req.auth.require(AuthenticatedUser.self)
		let template = AdminDashboardTemplate(.init(icon: "👋🏻", title: "Dashboard", message: "hello \(user.email), welcome to the CMS."))
		return req.templates.renderHtml(template)
	}
}
