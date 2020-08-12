//
//  FrontendController.swift
//
//  Created by Herb Bowie on 7/22/20.
//
//  Copyright © 2020 Herb Bowie (https://powersurgepub.com)
//
//  This programming code is published as open source software under the
//  terms of the MIT License (https://opensource.org/licenses/MIT).
//

import Vapor

struct FrontendController {
    
    func homeView(req: Request) throws -> EventLoopFuture<View> {
        var userId: String?
        if let user = req.auth.get(UserModel.self) {
            userId = user.userId
        }
        struct Context: Encodable {
            let title: String
            let header: String
            let message: String
            let userId: String?
        }
        let context = Context(title: "Notenik - Home",
                              header: "Hi there,",
                              message: "welcome to my awesome page!",
                              userId: userId)
        return req.view.render("home", context)
    }
}
