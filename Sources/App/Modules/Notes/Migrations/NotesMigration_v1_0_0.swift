//
//  NotesMigration_v1_0_0.swift
//
//  Created by Herb Bowie on 7/24/20.

//  Copyright © 2020 Herb Bowie (https://powersurgepub.com)
//
//  This programming code is published as open source software under the
//  terms of the MIT License (https://opensource.org/licenses/MIT).
//
import Foundation
import Fluent

struct NotesMigration_v1_0_0: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.eventLoop.flatten([
            database.schema(TagModel.schema)
                .id()
                .field(TagModel.FieldKeys.tag, .string, .required)
                .create(),
            database.schema(NoteModel.schema)
                .id()
                .field(NoteModel.FieldKeys.title, .string, .required)
                .field(NoteModel.FieldKeys.slug, .string, .required)
                .field(NoteModel.FieldKeys.tags, .string)
                .field(NoteModel.FieldKeys.link, .string)
                .field(NoteModel.FieldKeys.image, .string)
                .field(NoteModel.FieldKeys.teaser, .string)
                .field(NoteModel.FieldKeys.date, .string)
                .field(NoteModel.FieldKeys.code, .string)
                .field(NoteModel.FieldKeys.body, .string, .required)
                .field(NoteModel.FieldKeys.tagID, .uuid)
                .foreignKey(NoteModel.FieldKeys.tagID,
                    references: TagModel.schema, .id,
                    onDelete: DatabaseSchema.ForeignKeyAction.setNull,
                    onUpdate: .cascade)
                .unique(on: NoteModel.FieldKeys.slug)
                .create(),
        ])
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.eventLoop.flatten([
            database.schema(TagModel.schema).delete(),
            database.schema(NoteModel.schema).delete(),
        ])
    }
}
