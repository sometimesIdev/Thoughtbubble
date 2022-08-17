//
//  ListController.swift
//  
//
//  Created by Pat Butler on 2022-03-01.
//

import Vapor
import Fluent

protocol ListController: ModelController {
	
	func list(_ req: Request) async throws -> [DatabaseModel]
	func beforeList(_ req: Request, _ queryBuilder: QueryBuilder<DatabaseModel>) async throws -> QueryBuilder<DatabaseModel>
	func afterList(_ req: Request, _ models: [DatabaseModel]) async throws -> [DatabaseModel]
}

extension ListController {
	
	func beforeList(_ req: Request, _ queryBuilder: QueryBuilder<DatabaseModel>) async throws -> QueryBuilder<DatabaseModel> {
		 queryBuilder
	}

	func afterList(_ req: Request, _ models: [DatabaseModel]) async throws -> [DatabaseModel] {
		 models
	}
	
	func list(_ req: Request) async throws -> [DatabaseModel] {
		let quesryBuilder = DatabaseModel.query(on: req.db)
		let list = try await beforeList(req, quesryBuilder).all()
		return try await afterList(req, list)
	}
}
 
