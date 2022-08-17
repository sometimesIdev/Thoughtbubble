//
//  TebleContext.swift
//  
//
//  Created by Pat Butler on 2022-02-26.
//

public struct TableContext {
	
	public let columns: [ColumnContext]
	public let rows: [RowContext]
	public let actions: [LinkContext]
	
	public init(columns: [ColumnContext],
					rows: [RowContext],
					actions: [LinkContext] = []) {
		self.columns = columns
		self.rows = rows
		self.actions = actions
	}
}
