//  Copyright © 2020 Herb Bowie (https://powersurgepub.com)
//
//  This programming code is published as open source software under the
//  terms of the MIT License (https://opensource.org/licenses/MIT).

import Foundation

struct WebNote: Encodable {
	let title:  String
	let slug:   String
	let tags:   String?
	let link:   String?
	let image:  String?
	let teaser: String?
	let date:   String?
	let code:   String?
	let body:   String
}
