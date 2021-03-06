//
//  MarvelCharacter.swift
//  Marvel Superheroes
//
//  Created by Rafa Marques on 14.11.17.
//  Copyright © 2017 Rafa Marques. All rights reserved.
//

import Foundation

struct MarvelCharacter {
    let name: String
    let description: String
    let thumbnailPath: String
    let thumbnailExtension: String
    let comicCount: Int
    
    init(name: String, description: String, thumbnailPath: String, thumbnailExtension: String, comicCount: Int) {
        self.name = name
        self.description = description
        self.thumbnailPath = thumbnailPath
        self.thumbnailExtension = thumbnailExtension
        self.comicCount = comicCount
    }
    
    static func loadCharacters() -> [MarvelCharacter] {
        print("loadCharacters")
        // Array für die Charaktere
        var characters = [MarvelCharacter]()
        // Marvel API Adresse + Key
        let marvelApiURL = "https://gateway.marvel.com:443/v1/public/characters?limit=50&ts=1&apikey=53d0e42246c3a2e647c81c018f307e2d&hash=2b09166b8c427fb1a90f5cb0d1e4de43"
        // JSON Decoder
        let jsonDecoder = JSONDecoder()
        
        if let url = URL(string: marvelApiURL), let jsonData = try? Data(contentsOf: url) {
            do {
                let marvel = try jsonDecoder.decode(Marvel.self, from: jsonData)
                
                for results in marvel.data.results {
                    if let name = results.name,
                        let description = results.description,
                        let thumbnailPath = results.thumbnail.path,
                        let thumbnailExtension = results.thumbnail.extension,
                        let comicCount = results.comics.available {
                            characters.append(MarvelCharacter(name: name, description: description, thumbnailPath: thumbnailPath, thumbnailExtension: thumbnailExtension, comicCount: comicCount))
                    }
                }
            } catch {
                print("Fehler: \(error)")
            }
        }
        return characters
    }
}
