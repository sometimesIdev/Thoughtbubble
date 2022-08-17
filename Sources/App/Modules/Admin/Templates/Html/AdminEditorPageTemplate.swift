//
//  AdminEditorPageTemplate.swift
//  
//
//  Created by Pat Butler on 2022-02-28.
//

import Vapor
import SwiftHtml
import SwiftSgml

struct AdminEditorPageTemplate: TemplateRepresentable {
	
	var context: AdminEditorPageContext
	
	init(_ context: AdminEditorPageContext) {
		self.context = context
	}
	
	@TagBuilder
	func render(_ req: Request) -> Tag {
		AdminIndexTemplate(.init(title: context.title, breadcrumbs: context.breadcrumbs)) {
			Div {
				Div {
					H1(context.title)
					context.navigation.map { LinkTemplete($0).render(req) }
				}
				.class("lead")
				
				FormTemplate(context.form).render(req)
				
				Section {
					context.actions.map { LinkTemplete($0).render(req) }
				}
			}
			.class("container")
		}
		.render(req)
	}
}
