//
//  UpdateController.swift
//  
//
//  Created by Pat Butler on 2022-03-01.
//

import Vapor

protocol UpdateController: ModelController {
	func beforeUpdate(_ req: Request, _ model: DatabaseModel) async throws
	func afterUpdate(_ req: Request, _ model: DatabaseModel) async throws
	func update(_ req: Request, _ model: DatabaseModel) async throws
}

extension UpdateController {
	
	func beforeUpdate(_ req: Request, _ model: DatabaseModel) async throws {}
	
	func afterUpdate(_ req: Request, _ model: DatabaseModel) async throws {}
	
	func update(_ req: Request, _ model: DatabaseModel) async throws {
		 try await beforeUpdate(req, model)
		 try await model.update(on: req.db)
		 try await afterUpdate(req, model)
	}
}
