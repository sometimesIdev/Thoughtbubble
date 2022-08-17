//
//  WebLinkTemplate.swift
//  
//
//  Created by Pat Butler on 2022. 2. 16..
//

import Vapor
import SwiftHtml

struct WebLinkTemplate: TemplateRepresentable {

    var context: WebLinkContext
    
    init(_ context: WebLinkContext) {
        self.context = context
    }

    @TagBuilder
    func render(_ req: Request) -> Tag {
        A(context.label)
            .href(context.url)
    }
}
