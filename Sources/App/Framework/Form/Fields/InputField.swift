//
//  InputField.swift
//  
//
//  Created by Pat Butler on 2022-02-24.
//

import Vapor

public final class InputField: AbstractFormField<String, InputFieldTemplate> {
	
	public convenience init(_ key: String) {
		self.init(key: key, input: "", output: .init(.init(key: key)))
	}
}
