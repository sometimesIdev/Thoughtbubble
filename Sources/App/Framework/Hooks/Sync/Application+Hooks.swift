//
//  Application+Hooks.swift
//  
//
//  Created by Pat Butler on 2022-03-04.
//

import Vapor

extension Application {
	
	func invoke<ReturnType>(_ name: String, args: HookArguments = [:]) -> ReturnType? {
		let ctxArgs = args.merging(["app": self]) { (_, new) in new }
		return hooks.invoke(name, args: ctxArgs)
	}
	
	func invokeAll<ReturnType>(_ name: String, args: HookArguments = [:]) -> [ReturnType] {
		let ctxArgs = args.merging(["app": self]) { (_, new) in new }
		return hooks.invokeAll(name, args: ctxArgs)
	}
}
