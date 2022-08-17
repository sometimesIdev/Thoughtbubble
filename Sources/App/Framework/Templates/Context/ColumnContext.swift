//
//  ColumnContext.swift
//  
//
//  Created by Pat Butler on 2022-02-26.
//

public struct ColumnContext {
	
	public let key: String
	public let label: String
	
	public init(_ key: String, label: String? = nil) {
		self.key = key
		self.label = label ?? key.capitalized
	}
}
