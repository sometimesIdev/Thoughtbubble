//
//  TemplateRepresentable.swift
//  
//
//  Created by Pat Butler on 2022. 2. 16..
//

import Vapor
import SwiftSgml

public protocol TemplateRepresentable {
    
    @TagBuilder
    func render(_ req: Request) -> Tag
}
