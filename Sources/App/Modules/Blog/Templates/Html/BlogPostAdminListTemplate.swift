//
//  BlogPostAdminListTemplate.swift
//  
//
//  Created by Pat Butler on 2022-02-25.
//

import Vapor
import SwiftHtml
import SwiftSgml

struct BlogPostAdminListTemplate: TemplateRepresentable {
	
	var context: BlogPostAdminListContext
	
	init(_ context: BlogPostAdminListContext) {
		self.context = context
	}
	
	@TagBuilder
	func render(_ req: Request) -> Tag {
		AdminIndexTemplate(.init(title: context.title)) {
			Div {
				Section {
					H1(context.title)
				}
				.class("lead")
				
				Table {
					Thead {
						Tr {
							Th("Image")
							Th("Title")
							Th("Preview")
						}
					}
					Tbody {
						for item in context.list {
							Tr {
								Td {
									Img(src: item.image, alt: item.title)
								}
								Td {
									A(item.title)
										.href("/admin/blog/posts/" + item.id.uuidString + "/")  
								}
								Td {
									A("Preview")
										.href("/" + item.slug + "/")
								}
							}
						}
					}
				}
			}
			.id("list")
		}
		.render(req)
	}
}
