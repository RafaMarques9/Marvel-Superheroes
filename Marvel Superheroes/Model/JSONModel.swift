//
//  JSONModel.swift
//  Marvel Superheroes
//
//  Created by Rafa Marques on 14.11.17.
//  Copyright © 2017 Rafa Marques. All rights reserved.
//

import Foundation

struct Marvel: Codable {
    let results: [MarvelCharacters]
}

struct MarvelCharacters: Codable {
    let name: String?
    let description: String?
    let thumbnail: String?
    //let comicList: [String, String] ???
}
