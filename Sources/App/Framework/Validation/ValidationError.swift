//
//  ValidationError.swift
//  
//
//  Created by Pat Butler on 2022-03-03.
//

import Vapor

struct ValidationError: Codable {
	
	let message: String?
	let details: [ValidationErrorDetail]
	
	init(message: String?, details: [ValidationErrorDetail]) {
		self.message = message
		self.details = details
	}
}

extension ValidationError: Content {}

