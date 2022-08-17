//
//  ApiModuleInterface.swift
//  
//
//  Created by Pat Butler on 2022-03-01.
//

import Foundation

public protocol ApiModuleInterface {
	static var pathKey: String { get }
}

public extension ApiModuleInterface {
	
	static var pathKey: String { String(describing: self).lowercased() }
}
