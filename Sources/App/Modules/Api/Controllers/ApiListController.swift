//
//  ApiListController.swift
//  
//
//  Created by Pat Butler on 2022-03-01.
//

import Vapor

protocol ApiListController: ListController {
	associatedtype ListObject: Content
	
	func listOutput(_ req: Request, _ models: [DatabaseModel]) async throws -> [ListObject]
	func listApi(_ req: Request) async throws -> [ListObject]
	func setupDetailRoutes(_ routes: RoutesBuilder)
}

extension ApiListController {
	
	func listApi(_ req: Request) async throws -> [ListObject] {
		let models = try await list(req)
		return try await listOutput(req, models)
	}
	
	func setupListRoutes(_ routes: RoutesBuilder) {
		let baseRoutes = getBaseRoutes(routes)
		baseRoutes.get(use: listApi)
	}
}
