//
//  DetailTemplate.swift
//  
//
//  Created by Pat Butler on 2022-02-27.
//

import Vapor
import SwiftHtml
import SwiftSgml

public struct DetailTemplate: TemplateRepresentable {
	
	var context: DetailContext
	
	public init(_ context: DetailContext) {
		self.context = context
	}
	
	@TagBuilder
	public func render(_ req: Request) -> Tag {
		Dt(context.label)
		switch context.type {
		case.text:
			context.value.isEmpty ? Dd("&nbsp;") : Dd(context.value.replacingOccurrences(of: "\n", with: "<br>"))
		case.image:
			Dd {
				Img(src: context.value, alt: context.label)
			}
		}
	}
}
