//
//  PatchController.swift
//  
//
//  Created by Pat Butler on 2022-03-01.
//

import Vapor

protocol PatchController: ModelController {
	
	func beforePatch(_ req: Request, _ model: DatabaseModel) async throws
	func afterPatch(_ req: Request, _ model: DatabaseModel) async throws
	func patch(_ req: Request, _ model: DatabaseModel) async throws
}

extension PatchController {
	func beforePatch(_ req: Request, _ model: DatabaseModel) async throws {}
	func afterPatch(_ req: Request, _ model: DatabaseModel) async throws {}
	
	func patch(_ req: Request, _ model: DatabaseModel) async throws {
		 try await beforePatch(req, model)
		 try await model.update(on: req.db)
		 try await afterPatch(req, model)
	}
}
