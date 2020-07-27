//
//  NoteModel.swift
//
//  Generated by Notenik on 2020-07-26
//
//  Copyright © 2020 Herb Bowie (https://powersurgepub.com)
//
//  This programming code is published as open source software under the
//  terms of the MIT License (https://opensource.org/licenses/MIT).
//

import Vapor
import Fluent

final class NoteModel: Model {
    
    static let schema: String = "notes"
    
    struct FieldKeys {
        static var title: FieldKey { "title" }
        static var titleSort: FieldKey { "title_sort" }
        static var titleCommon: FieldKey { "title_common" }
        static var slug: FieldKey { "slug" }
        static var seq: FieldKey { "seq" }
        static var seqSort: FieldKey { "seq_sort" }
        static var date: FieldKey { "date" }
        static var dateSort: FieldKey { "date_sort" }
        static var status: FieldKey { "status" }
        static var statusSort: FieldKey { "status_sort" }
        static var statusDone: FieldKey { "status_done" }
        static var tags: FieldKey { "tags" }
        static var link: FieldKey { "link" }
        static var author: FieldKey { "author" }
        static var authorSort: FieldKey { "author_sort" }
        static var teaser: FieldKey { "teaser" }
        static var teaserHtml: FieldKey { "teaser_html" }
        static var body: FieldKey { "body" }
        static var bodyHtml: FieldKey { "body_html" }
    }

    @ID() var id: UUID?
    @Field(key: FieldKeys.title) var title: String
    @Field(key: FieldKeys.titleSort) var titleSort: String
    @Field(key: FieldKeys.titleCommon) var titleCommon: String
    @Field(key: FieldKeys.slug) var slug: String
    @Field(key: FieldKeys.seq) var seq: String
    @Field(key: FieldKeys.seqSort) var seqSort: String
    @Field(key: FieldKeys.date) var date: String
    @Field(key: FieldKeys.dateSort) var dateSort: String
    @Field(key: FieldKeys.status) var status: String
    @Field(key: FieldKeys.statusSort) var statusSort: String
    @Field(key: FieldKeys.statusDone) var statusDone: String
    @Field(key: FieldKeys.tags) var tags: String
    @Field(key: FieldKeys.link) var link: String
    @Field(key: FieldKeys.author) var author: String
    @Field(key: FieldKeys.authorSort) var authorSort: String
    @Field(key: FieldKeys.teaser) var teaser: String
    @Field(key: FieldKeys.teaserHtml) var teaserHtml: String
    @Field(key: FieldKeys.body) var body: String
    @Field(key: FieldKeys.bodyHtml) var bodyHtml: String
    @Children(for: \.$note) var fields: [NoteModel]

	init() { }
    
    init(id: UUID? = nil,
    	title: String,
    	titleSort: String,
    	titleCommon: String,
    	slug: String,
    	seq: String,
    	seqSort: String,
    	date: String,
    	dateSort: String,
    	status: String,
    	statusSort: String,
    	statusDone: String,
    	tags: String,
    	link: String,
    	author: String,
    	authorSort: String,
    	teaser: String,
    	teaserHtml: String,
    	body: String,
    	bodyHtml: String,
	) 
	{
		self.id = id
    	self.title = title
    	self.titleSort = titleSort
    	self.titleCommon = titleCommon
    	self.slug = slug
    	self.seq = seq
    	self.seqSort = seqSort
    	self.date = date
    	self.dateSort = dateSort
    	self.status = status
    	self.statusSort = statusSort
    	self.statusDone = statusDone
    	self.tags = tags
    	self.link = link
    	self.author = author
    	self.authorSort = authorSort
    	self.teaser = teaser
    	self.teaserHtml = teaserHtml
    	self.body = body
    	self.bodyHtml = bodyHtml
	} 
}
