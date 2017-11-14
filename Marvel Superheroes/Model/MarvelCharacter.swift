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
    // let comicList: [String, String] ???
    
    init(name: String, description: String, thumbnailPath: String, thumbnailExtension: String) {
        self.name = name
        self.description = description
        self.thumbnailPath = thumbnailPath
        self.thumbnailExtension = thumbnailExtension
    }
    
    static func loadCharacters() -> [MarvelCharacter] {
        print("loadCharacters")
        // Array für die Charaktere
        var characters = [MarvelCharacter]()
        // Marvel API Adresse + Key
        let marvelApiURL = "https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=53d0e42246c3a2e647c81c018f307e2d&hash=2b09166b8c427fb1a90f5cb0d1e4de43"
        // JSON Decoder
        let jsonDecoder = JSONDecoder()
        
        if let url = URL(string: marvelApiURL), let jsonData = try? Data(contentsOf: url) {
            do {
                let marvel = try jsonDecoder.decode(Marvel.self, from: jsonData)
                // Schleife über Ergebnisse
                for results in marvel.data.results {
                    // Wenn diese 3 Daten vorhanden sind werden die in das Array gespeichert
                    /*
                    if let name = data.results, let description = result.description, let thumbnail = result.thumbnail {
                        characters.append(MarvelCharacter(name: name, description: description, thumbnail: thumbnail))
                    }
                    */
                    if let name = results.name, let description = results.description, let thumbnailPath = results.thumbnail.path, let thumbnailExtension = results.thumbnail.extension {
                        characters.append(MarvelCharacter(name: name, description: description, thumbnailPath: thumbnailPath, thumbnailExtension: thumbnailExtension))
                    }
                }
            } catch {
                print("Fehler: \(error)")
            }
        }
        return characters
    }
}
