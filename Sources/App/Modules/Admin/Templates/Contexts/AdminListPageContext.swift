//
//  AdminListPageContext.swift
//  
//
//  Created by Pat Butler on 2022-02-27.
//

public struct AdminListPageContext {
	
	public let title: String
	public let table: TableContext
	public let navigation: [LinkContext]
	public let breadcrumbs: [LinkContext]
	
	public init(title: String,
					table: TableContext,
					navigation: [LinkContext] = [],
					breadcrumbs: [LinkContext] = []) {
		self.title = title
		self.table = table
		self.navigation = navigation
		self.breadcrumbs = breadcrumbs
	}
}
