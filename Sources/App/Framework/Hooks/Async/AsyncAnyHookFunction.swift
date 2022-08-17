//
//  AsyncAnyHookFunction.swift
//  
//
//  Created by Pat Butler on 2022-03-04.
//

struct AsyncAnyHookFunction: AsyncHookFunction {
	
	private let functionBlock: AsyncHookFunctionSignature<Any>
	
	init(_ functionBlock: @escaping AsyncHookFunctionSignature<Any>) {
		self.functionBlock = functionBlock
	}
	
	func invokeAsync(_ args: HookArguments) async throws -> Any {
		try await functionBlock(args)
	}
}
