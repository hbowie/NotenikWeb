//  Copyright © 2020 Herb Bowie (https://powersurgepub.com)
//
//  This programming code is published as open source software under the
//  terms of the MIT License (https://opensource.org/licenses/MIT).

import Vapor

struct NoteRepository {

    func list() -> [WebNote] {
        [
			WebNote(title: "Indonesia",
                     slug: "indonesia",
                     tags: "Islands",
                     link: nil,
                     image: "/images/posts/05.jpg",
                     teaser: "Et excepturi id harum ipsam doloremque",
                     date: "2019",
                     code: nil,
                     body: "Accusantium amet vero numquam tenetur sit quidem ut..."),
            
            WebNote(title: "Mauritius",
                     slug: "mauritius",
                     tags: "Islands",
                     link: nil,
                     image: "/images/posts/04.jpg",
                     teaser: "Pariatur debitis quod occaecati quidem",
                     date: "2016",
                     code: nil,
                     body: "Enim et a ex quisquam qui sed fuga consectetur..."),
            
            WebNote(title: "California",
                     slug: "california",
                     tags: nil,
                     link: nil,
                     image: "/images/posts/03.jpg",
                     teaser: "Voluptates ipsa eos sit distinctio",
                     date: "2015",
                     code: nil,
                     body: "Et non reiciendis et illum corrupti..."),
            
            WebNote(title: "The Maldives",
                     slug: "the-maldives",
                     tags: "Islands",
                     link: nil,
                     image: "/images/posts/02.jpg",
                     teaser: "Possimus est labore recusandae asperiores",
                     date: "2014",
                     code: nil,
                     body: "Dignissimos mollitia doloremque omnis repellendus..."),
            
            WebNote(title: "Sri Lanka",
                     slug: "sri-lanka",
                     tags: "Islands",
                     link: nil,
                     image: "/images/posts/01.jpg",
                     teaser: "Ratione est quo nemo dolor placeat dolore",
                     date: "2014",
                     code: nil,
                     body: "Deserunt nulla culpa aspernatur ea a accusantium..."), 
        ]
    }
}
