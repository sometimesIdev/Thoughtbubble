//
//  AdminIndexContext.swift
//  
//
//  Created by Pat Butler on 2022-02-25.
//

public struct AdminIndexContext {
	public let title: String
	public var breadcrumbs: [LinkContext]
	
	public init(title: String, breadcrumbs: [LinkContext] = []) {
		self.title = title
		self.breadcrumbs = breadcrumbs
	}
}
