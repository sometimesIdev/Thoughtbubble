//
//  HookFunction.swift
//  
//
//  Created by Pat Butler on 2022-03-04.
//

protocol HookFunction {
	func invoke(_: HookArguments) -> Any
}

typealias HookFunctionSignature<T> = (HookArguments) -> T
