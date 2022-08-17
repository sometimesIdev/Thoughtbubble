//
//  AnyHookFunction.swift
//  
//
//  Created by Pat Butler on 2022-03-04.
//

struct AnyHookFunction: HookFunction {
	
	private let functionBlock: HookFunctionSignature<Any>
	
	init(_ functionBlock: @escaping HookFunctionSignature<Any>) {
		self.functionBlock = functionBlock
	}
	
	func invoke(_ args: HookArguments) -> Any {
		functionBlock(args)
	}
}
