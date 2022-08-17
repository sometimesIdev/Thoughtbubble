//
//  HookStorage.swift
//  
//
//  Created by Pat Butler on 2022-03-04.
//

final class HookStorage {
	
	var pointers: [HookFunctionPointer<HookFunction>]
	var asyncPointers: [HookFunctionPointer<AsyncHookFunction>]
	
	init() {
		self.pointers = []
		self.asyncPointers = []
	}
}
