//
//  Register.swift
//  Pokedex
//
//  Created by Felipe Domingos on 04/10/22.
//

import Foundation

struct Register: Codable {
    let name: String?
    let id: Int?
    let height: Int?
    let weight: Int?
    let sprites: PokemonSpritesModel?
    let stats: [Stats]
    let types: [Types]
}

struct Stats: Codable {
    let base_stat: Int
}

struct Types: Codable {
    var type: Type
}
struct Type: Codable {
    var name: String
}


