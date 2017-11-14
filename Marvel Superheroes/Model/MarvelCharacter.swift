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
    let thumbnail: String
    // let comicList: [String, String] ???
    
    init(name: String, description: String, thumbnail: String) {
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
    }
    
    static func loadCharacters() -> [MarvelCharacter] {
        // Array für die Charaktere
        var characters = [MarvelCharacter]()
        // Marvel API Adresse + Key
        let marvelApiURL = "https://gateway.marvel.com:443/v1/public/characters?apikey=53d0e42246c3a2e647c81c018f307e2d"
        // JSON Decoder
        let jsonDecoder = JSONDecoder()
        
        if let url = URL(string: marvelApiURL), let jsonData = try? Data(contentsOf: url) {
            do {
                let marvel = try jsonDecoder.decode(Marvel.self, from: jsonData)
                // Schleife über Ergebnisse
                for result in marvel.results {
                    // Wenn diese 3 Daten vorhanden sind werden die in das Array gespeichert
                    if let name = result.name, let description = result.description, let thumbnail = result.thumbnail {
                        characters.append(MarvelCharacter(name: name, description: description, thumbnail: thumbnail))
                    }
                }
            } catch {
                print("Fehler: \(error)")
            }
        }
        return characters
    }
}
