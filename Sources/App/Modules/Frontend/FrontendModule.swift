//
//  FrontendModule.swift
//
//  Created by Herb Bowie on 8/10/20.

//  Copyright © 2020 Herb Bowie (https://powersurgepub.com)
//
//  This programming code is published as open source software under the
//  terms of the MIT License (https://opensource.org/licenses/MIT).
//

import Vapor
import Fluent

struct FrontendModule: Module {
    var router: RouteCollection? {
        FrontendRouter()
    }
}
