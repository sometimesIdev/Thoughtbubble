//
//  UserFrontendController.swift
//  
//
//  Created by Pat Butler on 2022-02-23.
//

import Vapor

struct UserFrontendController {
	
	private func renderSignInView(_ req: Request,
											_ form: UserLoginForm) -> Response {
		let template = UserLoginTemplate(.init(icon: "⬇️",
															title: "Sign in",
															message: "Please log in with your existing account",
															form: form.render(req: req)))
		return req.templates.renderHtml(template)
	}
	
	/// Each function describes response from an endpoint that is registered in the UserRouter
	
	func signInView(_ req: Request) async throws -> Response {
		renderSignInView(req, .init())
	}
	
	func signInAction(_ req: Request) async throws -> Response {
		/// the user is authenticated, we can store the user data in the session too
		if let user = req.auth.get(AuthenticatedUser.self) {
			req.session.authenticate(user)
			return req.redirect(to: "/")
		}
		/// if the user credentials were wrong, we render the from again with an error message
		let form = UserLoginForm()
		try await form.process(req: req)
		if try await form.validate(req: req) {
			form.error = "Invalid email or password."
		}
		return renderSignInView(req, form)
	}
	
	func signOut(req: Request) throws -> Response {
		req.auth.logout(AuthenticatedUser.self)
		req.session.unauthenticate(AuthenticatedUser.self)
		return req.redirect(to: "/")
	}
}
