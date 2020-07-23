//  Copyright © 2020 Herb Bowie (https://powersurgepub.com)
//
//  This programming code is published as open source software under the
//  terms of the MIT License (https://opensource.org/licenses/MIT).

import Vapor

struct NoteListRouter: RouteCollection {

	let controller = NoteListController()
	
	func boot(routes: RoutesBuilder) throws {
		routes.get("list", use: self.controller.listView)
        routes.get(.anything, use: self.controller.noteView)
	}
}
