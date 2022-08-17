//
//  AdminDetailPageTemplate.swift
//  
//
//  Created by Pat Butler on 2022-02-27.
//

import Vapor
import SwiftHtml
import SwiftSgml

struct AdminDetailPageTemplate: TemplateRepresentable {
	
	var context: AdminDetailPageContext
	
	init(_ context: AdminDetailPageContext) {
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
				
				Dl {
					context.fields.map { DetailTemplate($0).render(req) }
				}
				
				Section {
					context.actions.map { LinkTemplete($0).render(req) }
				}
			}
			.class("container")
		}
		.render(req)
	}
}
