//
//  HiddenFieldTemplate.swift
//  
//
//  Created by Pat Butler on 2022-02-25.
//

import Vapor
import SwiftHtml
import SwiftSgml

public struct HiddenFieldTemplate: TemplateRepresentable {
	
	var context: HiddenFieldContext
	
	public init(_ context: HiddenFieldContext) {
		self.context = context
	}
	
	@TagBuilder
	public func render(_ req: Request) -> Tag {
		Input()
			.type(.hidden)
			.name(context.key)
			.value(context.value)
	}
}
