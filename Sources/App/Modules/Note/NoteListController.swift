//  Copyright © 2020 Herb Bowie (https://powersurgepub.com)
//
//  This programming code is published as open source software under the
//  terms of the MIT License (https://opensource.org/licenses/MIT).

import Vapor

struct NoteListController {
    
    func listView(req: Request) throws -> EventLoopFuture<View> {
        struct Context: Encodable {
            let title: String
            let notes: [WebNote]
        }
        let notes = NoteRepository().list()
        let context = Context(title: "Notenik List", notes: notes)
        return req.view.render("noteList", context)
    }
    
    func noteView(req: Request) throws -> EventLoopFuture<Response> {
        let notes = NoteRepository().list()
        let slug = req.url.path.trimmingCharacters(in: .init(charactersIn: "/"))
        guard let note = notes.first(where: { $0.slug == slug }) else {
            return req.eventLoop.future(req.redirect(to: "/"))
        }
        
        struct Context: Encodable {
            let title: String
            let note:  WebNote
        }
        let context = Context(title: "Note titled \(note.title)", note: note)
        return req.view.render("note", context).encodeResponse(for: req)
    }
}
