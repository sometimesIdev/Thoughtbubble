//
//  Request+AsyncHooks.swift
//  
//
//  Created by Pat Butler on 2022-03-04.
//

import Vapor

extension Request {

	 func invokeAsync<ReturnType>(_ name: String, args: HookArguments = [:]) async throws -> ReturnType? {
		  let ctxArgs = args.merging(["req": self]) { (_, new) in new }
		  return try await application.invokeAsync(name, args: ctxArgs)
	 }

	 func invokeAllAsync<ReturnType>(_ name: String, args: HookArguments = [:]) async throws -> [ReturnType] {
		  let ctxArgs = args.merging(["req": self]) { (_, new) in new }
		  return try await application.invokeAllAsync(name, args: ctxArgs)
	 }
}
