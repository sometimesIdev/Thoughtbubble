//
//  Request+Template.swift
//  
//
//  Created by Pat Butler on 2022. 2. 16..
//

import Vapor

public extension Request {
    var templates: TemplateRenderer { .init(self) }
}
