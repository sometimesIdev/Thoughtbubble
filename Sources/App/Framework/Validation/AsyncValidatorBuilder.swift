//
//  AsyncValidatorBuilder.swift
//  
//
//  Created by Pat Butler on 2022-02-24.
//

@resultBuilder
public enum AsyncValidatorBuilder {
	
	public static func buildBlock(_ components: AsyncValidator...) -> [AsyncValidator] {
		components
	}
}
