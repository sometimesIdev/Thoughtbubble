//
//  FormTemplate.swift
//  
//
//  Created by Pat Butler on 2022-02-24.
//

import Vapor
import SwiftHtml
import SwiftSgml

public struct FormTemplate: TemplateRepresentable {
	
	var context: FormContext
	
	public init(_ context: FormContext) {
		self.context = context
	}
	
	@TagBuilder
	public func render(_ req: Request) -> Tag {
		Form {
			if let error = context.error {
				Section {
					P(error)
						.class("error")
				}
			}
			context.fields.map { field in
				Section {
					field.render(req)
				}
			}
			Section {
				Input()
					.type(.submit)
					.value(context.submit ?? "Save")
			}
		}
		.method(context.action.method)
		.action(context.action.url)
		.enctype(context.action.enctype)
	}
}
