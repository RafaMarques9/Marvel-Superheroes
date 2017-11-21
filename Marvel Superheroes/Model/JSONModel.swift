//
//  JSONModel.swift
//  Marvel Superheroes
//
//  Created by Rafa Marques on 14.11.17.
//  Copyright © 2017 Rafa Marques. All rights reserved.
//

import Foundation

struct Marvel: Codable {
    let data: Results
}

struct Results: Codable {
    let results: [MarvelCharacters]
}

struct MarvelCharacters: Codable {
    let name: String?
    let description: String?
    let thumbnail: CharacterThumbnail
    let comics: Comics
}

struct CharacterThumbnail: Codable {
    let path: String?
    let `extension`: String?
}

struct Comics: Codable {
    let available: Int?
    let items: [ComicList]?
}

struct ComicList: Codable {
    let resourceURI: String?
    let name: String?
}
