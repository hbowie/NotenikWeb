//
//  UserModelCredentialsAuthenticator.swift
//
//  Created by Herb Bowie on 8/11/20.

//  Copyright © 2020 Herb Bowie (https://powersurgepub.com)
//
//  This programming code is published as open source software under the
//  terms of the MIT License (https://opensource.org/licenses/MIT).
//

import Vapor
import Fluent

struct UserModelCredentialsAuthenticator: CredentialsAuthenticator {
    
    struct Input: Content {
        let userid: String
        let password: String
    }
    
    typealias Credentials = Input
    
    func authenticate(credentials: Input, for req: Request) -> EventLoopFuture<Void> {
        UserModel.query(on: req.db)
            .filter(\.$userId == credentials.userid)
            .first()
            .map {
                do {
                    if
                        let user = $0,
                        try Bcrypt.verify(credentials.password, created: user.password)
                    {
                        req.auth.login(user)
                    }
                }
                catch {
                    // do nothing
                }
        }
    }
    
}
