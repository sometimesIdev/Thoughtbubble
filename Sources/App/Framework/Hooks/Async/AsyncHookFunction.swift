//
//  AsyncHookFunction.swift
//  
//
//  Created by Pat Butler on 2022-03-04.
//

protocol AsyncHookFunction {
	func invokeAsync(_: HookArguments) async throws -> Any
}

typealias AsyncHookFunctionSignature<T> = (HookArguments) async throws -> T


