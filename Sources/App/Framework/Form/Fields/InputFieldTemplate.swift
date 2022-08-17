//
//  InputFieldTemplate.swift
//  
//
//  Created by Pat Butler on 2022-02-24.
//

import Vapor
import SwiftHtml
import SwiftSgml

public struct InputFieldTemplate: TemplateRepresentable {
	
	public var context: InputFieldContext
	
	public init(_ context: InputFieldContext) {
		self.context = context
	}
	
	@TagBuilder
	public func render(_ req: Request) -> Tag {
		LabelTemplate(context.label).render(req)
		
		Input()
			.type(context.type)
			.key(context.key)
			.placeholder(context.placeholder)
			.value(context.value)
			.class("field")
		if let error = context.error  {
			Span(error)
				.class("error")
		}
	}
}
