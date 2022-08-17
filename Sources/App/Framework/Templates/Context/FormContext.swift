//
//  FormContext.swift
//  
//
//  Created by Pat Butler on 2022-02-24.
//

import Foundation

public struct FormContext {
	public var action: FormAction
	public var fields: [TemplateRepresentable]
	public var error: String?
	public var submit: String?
}
