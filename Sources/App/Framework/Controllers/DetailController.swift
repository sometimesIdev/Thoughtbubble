//
//  DetailController.swift
//  
//
//  Created by Pat Butler on 2022-03-01.
//

import Vapor
import Fluent

protocol DetailController: ModelController {
	
	func beforeDetail(_ req: Request, _ queryBuilder: QueryBuilder<DatabaseModel>) async throws -> QueryBuilder<DatabaseModel>
	func afterDetail(_ req: Request, _ model: DatabaseModel) async throws -> DatabaseModel
	func detail(_ req: Request) async throws -> DatabaseModel
}

extension DetailController {
	
	func beforeDetail(_ req: Request, _ queryBuilder: QueryBuilder<DatabaseModel>) async throws -> QueryBuilder<DatabaseModel> {
		 queryBuilder
	}
	
	func afterDetail(_ req: Request, _ model: DatabaseModel) async throws -> DatabaseModel {
		 model
	}
	
	func detail(_ req: Request) async throws -> DatabaseModel {
		 let queryBuilder = DatabaseModel.query(on: req.db)
		 let model = try await beforeDetail(req, queryBuilder).filter(\._$id == identifier(req)).first()
		 guard let model = model else {
			  throw Abort(.notFound)
		 }
		 return try await afterDetail(req, model)
	}
}
