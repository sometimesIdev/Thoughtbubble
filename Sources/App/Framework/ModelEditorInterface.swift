//
//  ModelEditorInterface.swift
//  
//
//  Created by Pat Butler on 2022-02-28.
//

import Vapor


/// This protocol allows us to eliminate a series of [unowned self] references by making structs that allow us to edit a databsse model using an abstract form instance. The user should always use model editors when changing database models. Form sub-classes can still be utilized for other kind of web forms when there is no need for associated database entities. ie - the UserLoginForm is a great example for this purpose.
///

public protocol ModelEditorInterface: FormComponent {
	associatedtype Model: DatabaseModelInterface
	
	var model: Model { get }
	var form: AbstractForm { get }
	
	init(model: Model, form: AbstractForm)
	
	@FormComponentBuilder
	var formFields: [FormComponent] { get }
}

public extension ModelEditorInterface {
	
	func load(req: Request) async throws {
		try await form.load(req: req)
	}
	
	func process(req: Request) async throws {
		try await form.process(req: req)
	}
	
	func validate(req: Request) async throws -> Bool {
		try await form.validate(req: req)
	}
	
	func write(req: Request) async throws {
		try await form.write(req: req)
	}
	
	func save(req: Request) async throws {
		try await form.save(req: req)
	}
	
	func read(req: Request) async throws {
		try await form.read(req: req)
	}
	
	func render(req: Request) -> TemplateRepresentable {
		form.render(req: req)
	}
}

