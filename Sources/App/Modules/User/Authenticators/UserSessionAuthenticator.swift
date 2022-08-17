//
//  UserSessionAuthenticator.swift
//  
//
//  Created by Pat Butler on 2022-02-23.
//

import Vapor
import Fluent

struct UserSessionAuthenticator: AsyncSessionAuthenticator {
	typealias User = AuthenticatedUser
	
	func authenticate(sessionID: User.SessionID, for req: Request) async throws {
		guard let user = try await UserAccountModel.find(sessionID, on: req.db) else {
			return
		}
		req.auth.login(AuthenticatedUser(id: user.id!, email: user.email))
	}
}
