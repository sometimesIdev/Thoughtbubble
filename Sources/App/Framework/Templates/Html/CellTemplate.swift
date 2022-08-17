//
//  CellTemplate.swift
//  
//
//  Created by Pat Butler on 2022-02-26.
//

import Vapor
import SwiftHtml
import SwiftSgml

public struct CellTemplate: TemplateRepresentable {
	
	var context: CellContext
	var rowId: String
	
	public init(_ context: CellContext, rowId: String) {
		self.context = context
		self.rowId = rowId
	}
	
	@TagBuilder
	public func render(_ req: Request) -> Tag {
		Td {
			switch context.type {
			case .text:
				if let link = context.link {
					LinkTemplete(link, pathInfix: rowId).render(req)
				}
				else {
					Text(context.value)
				}
			case .image:
				if let link = context.link {
					LinkTemplete(link, pathInfix: rowId) { label in
						Img(src: context.value, alt: label)
					}
					.render(req)
				}
				else {
					Img(src: context.value, alt: context.value)
				}
			}
		}
		.class("field")
	}
}
