//
//  UserCredentialsAuthenticator.swift
//  
//
//  Created by Pat Butler on 2022-02-23.
//

import Vapor
import Fluent

struct UserCredentialsAuthenticator: AsyncCredentialsAuthenticator {
	struct Credentials: Content {
		let email: String
		let password: String
	}
	
	func authenticate(credentials: Credentials, for req: Request) async throws {
		guard
			let user = try await UserAccountModel
				.query(on: req.db)
				.filter(\.$email == credentials.email)
				.first()
		else {
			return
		}
		do {
			guard try Bcrypt.verify(credentials.password, created: user.password)
			else {
				return
			}
			req.auth.login(AuthenticatedUser(id: user.id!, email: user.email))
		}
		catch {
			//do nothing
		}
	}
}
