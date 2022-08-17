//
//  AdminController.swift
//  
//
//  Created by Pat Butler on 2022-03-01.
//

import Vapor

protocol AdminController: AdminListController,
								  AdminDetailController,
								  AdminCreateController,
								  AdminUpdateController,
								  AdminDeleteController
{
	func setupRoutes(_ routes: RoutesBuilder)
}

extension AdminController {
	
	func setupRoutes(_ routes: RoutesBuilder) {
		setupListRoutes(routes)
		setupDetailRoutes(routes)
		setupCreateRoutes(routes)
		setupUpdateRoutes(routes)
		setupDeleteRoutes(routes)
	}

}
