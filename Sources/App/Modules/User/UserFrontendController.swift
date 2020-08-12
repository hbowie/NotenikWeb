//
//  UserFrontendController.swift
//
//  Created by Herb Bowie on 8/10/20.
//
//  Copyright © 2020 Herb Bowie (https://powersurgepub.com)
//
//  This programming code is published as open source software under the
//  terms of the MIT License (https://opensource.org/licenses/MIT).
//

import Vapor
import Fluent

struct UserFrontendController {
    
    func loginView(req: Request) throws -> EventLoopFuture<View> {
        struct Context: Encodable {
            let title: String
        }
        let context = Context(title: "Notenik - Sign in")
        return req.view.render("login", context)
    }
    
    func login(req: Request) throws -> Response {
        guard let user = req.auth.get(UserModel.self) else {
            throw Abort(.unauthorized)
        }
        req.session.authenticate(user)
        return req.redirect(to: "/")
    }
    
    func logout(req: Request) throws -> Response {
        req.auth.logout(UserModel.self)
        req.session.unauthenticate(UserModel.self)
        return req.redirect(to: "/")
    }
    
}
