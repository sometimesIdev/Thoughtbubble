//
//  XCTApplicationTester.swift
//  
//
//  Created by Pat Butler on 2022-03-03.
//

import XCTVapor

extension XCTApplicationTester {
	
	@discardableResult public func test<T>(
		_ method: HTTPMethod,
		_ path: String,
		headers: HTTPHeaders = [:],
		content: T,
		afterResponse: (XCTHTTPResponse) throws -> () = { _ in }) throws -> XCTApplicationTester where T: Content {
			try test(method, path, headers: headers, beforeRequest: { req in
				try req.content.encode(content)
			}, afterResponse: afterResponse)
		}
}
