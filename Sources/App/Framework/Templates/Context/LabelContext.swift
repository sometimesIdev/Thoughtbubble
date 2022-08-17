//
//  LabelContext.swift
//  
//
//  Created by Pat Butler on 2022-02-24.
//

import Foundation

public struct LabelContext {

	 public var key: String
	 public var title: String?
	 public var required: Bool
	 public var more: String?

	 public init(key: String,
					 title: String? = nil,
					 required: Bool = false,
					 more: String? = nil) {
		  self.key = key
		  self.title = title
		  self.required = required
		  self.more = more
	 }
}
