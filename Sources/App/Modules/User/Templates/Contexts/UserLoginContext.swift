//
//  UserLoginContext.swift
//  
//
//  Created by Pat Butler on 2022-02-23.
//

import Vapor
import CoreText

struct UserLoginContext {
	
	let icon: String
	let title: String
	let message: String
	let form: TemplateRepresentable
	
	init(icon: String,
		  title: String,
		  message: String,
		  form: TemplateRepresentable) {
		self.icon = icon
		self.title = title
		self.message = message
		self.form = form
	}
}
