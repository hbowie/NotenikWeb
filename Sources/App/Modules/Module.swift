//
//  Module.swift
//
//  Created by Herb Bowie on 8/10/20.

//  Copyright © 2020 Herb Bowie (https://powersurgepub.com)
//
//  This programming code is published as open source software under the
//  terms of the MIT License (https://opensource.org/licenses/MIT).
//

import Vapor
import Fluent

protocol Module {
    var router: RouteCollection? { get }
    var migrations: [Migration] {get }
    
    func configure(_ app: Application) throws
}

extension Module {
    var router: RouteCollection? { nil }
    var migrations: [Migration] { [] }
    
    func configure(_ app: Application) throws {
        for migration in self.migrations {
            app.migrations.add(migration)
        }
        if let router = self.router {
            try router.boot(routes: app.routes)
        }
    }
}
