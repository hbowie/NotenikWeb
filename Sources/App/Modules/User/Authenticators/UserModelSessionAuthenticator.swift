//
//  UserModelSessionAuthenticator.swift
//
//  Created by Herb Bowie on 8/11/20.
//
//  Copyright © 2020 Herb Bowie (https://powersurgepub.com)
//
//  This programming code is published as open source software under the
//  terms of the MIT License (https://opensource.org/licenses/MIT).
//

import Vapor
import Fluent

struct UserModelSessionAuthenticator: SessionAuthenticator {
    
    typealias User = UserModel
    
    func authenticate(sessionID: User.SessionID, for req: Request) -> EventLoopFuture<Void> {
        User.find(sessionID, on: req.db).map {
            user in
            if let user = user {
                req.auth.login(user)
            }
        }
    }
}
