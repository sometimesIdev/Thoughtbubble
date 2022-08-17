//
//  BlogAdminWidgetTemplate.swift
//  
//
//  Created by Pat Butler on 2022-03-04.
//

import Vapor
import SwiftHtml
import SwiftSgml

struct BlogAdminWidgetTemplate: TemplateRepresentable {
	
	@TagBuilder
	func render(_ req: Request) -> Tag {
		H2("Blog")
		Ul {
			Li {
				A("Posts")
					.href("/admin/blog/posts/")
			}
			Li {
				A("Categories")
					.href("/admin/blog/categories/")
			}
		}
	}
}
