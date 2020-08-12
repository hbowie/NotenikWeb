//
//  UserRouter.swift
//
//  Created by Herb Bowie on 8/10/20.

//  Copyright © 2020 Herb Bowie (https://powersurgepub.com)
//
//  This programming code is published as open source software under the
//  terms of the MIT License (https://opensource.org/licenses/MIT).
//

import Vapor

struct UserRouter: RouteCollection {
    
    let controller = UserFrontendController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.get("sign-in", use: self.controller.loginView)
        routes.grouped(UserModelCredentialsAuthenticator())
            .post("sign-in", use: self.controller.login)
        routes.grouped(UserModelSessionAuthenticator())
            .get("logout", use: self.controller.logout)
    }
}
