//
//  TagModel.swift
//
//  Created by Herb Bowie on 7/24/20.

//  Copyright © 2020 Herb Bowie (https://powersurgepub.com)
//
//  This programming code is published as open source software under the
//  terms of the MIT License (https://opensource.org/licenses/MIT).
//

import Vapor
import Fluent

final class TagModel: Model {
    
    static let schema = "tags"
    
    struct FieldKeys {
        static var tag: FieldKey { "tag" }
    }
    
    @ID() var id: UUID?
    @Field(key: FieldKeys.tag) var tag: String
    
    init() { }
    
    init(id: UUID? = nil, tag: String) {
        self.id = id
        self.tag = tag
    }
}
