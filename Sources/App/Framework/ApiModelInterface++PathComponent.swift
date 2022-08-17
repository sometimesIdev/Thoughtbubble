//
//  ApiModelInterface+PathComponent.swift
//  
//
//  Created by Pat Butler on 2022-03-05.
//

import Vapor

extension ApiModelInterface {
	
	static var pathIdComponent: PathComponent { .init(stringLiteral: ":" + pathIdKey) }
	
}
