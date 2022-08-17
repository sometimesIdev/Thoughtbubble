//
//  Linktemplate.swift
//  
//
//  Created by Pat Butler on 2022-02-26.
//

import Vapor
import SwiftHtml
import SwiftSgml

public struct LinkTemplete: TemplateRepresentable {
	
	var context: LinkContext
	var body: Tag
	var pathInfix: String?
	
	public init(_ context: LinkContext, pathInfix: String? = nil, _ builder: ((String) -> Tag)? = nil) {
		self.context = context
		self.pathInfix = pathInfix
		self.body = builder?(context.label) ?? Text(context.label)
	}
	
	@TagBuilder
	public func render(_ req: Request) -> Tag {
		A { body }
		.href(context.url(req, pathInfix?.pathComponents ?? []))
		.target(.blank, context.isBlank)
	}
}
