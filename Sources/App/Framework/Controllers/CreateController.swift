//
//  CreateController.swift
//  
//
//  Created by Pat Butler on 2022-03-01.
//

import Vapor

protocol CreateController: ModelController {
	
	func beforeCreate(_ req: Request, _ model: DatabaseModel) async throws
	func afterCreate(_ req: Request, _ model: DatabaseModel) async throws
	
	func create(_ req: Request, _ model: DatabaseModel) async throws
}

extension CreateController {
	
	func beforeCreate(_ req: Request, _ model: DatabaseModel) async throws {}
	
	func afterCreate(_ req: Request, _ model: DatabaseModel) async throws {}

	func create(_ req: Request, _ model: DatabaseModel) async throws {
		 try await beforeCreate(req, model)
		 try await model.create(on: req.db)
		 try await afterCreate(req, model)
	}
}
