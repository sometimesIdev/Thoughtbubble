//
//  Name.swift
//  
//
//  Created by Pat Butler on 2022-03-02.
//

import Foundation

public struct Name {
	
	let singular: String
	let plural: String
	
	internal init(singular: String, plural: String? = nil) {
		self.singular = singular
		self.plural = plural ?? singular + "s"
	}
}

