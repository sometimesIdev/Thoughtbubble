//
//  FormComponentBuilder.swift
//  
//
//  Created by Pat Butler on 2022-02-24.
//

@resultBuilder
public enum FormComponentBuilder {
	
	public static func buildBlock(_ components: FormComponent...) -> [FormComponent] {
		components
	}
}
