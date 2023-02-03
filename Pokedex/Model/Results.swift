//
//  Results.swift
//  PokedexProject
//
//  Created by Felipe Domingos on 12/12/22.
//

import Foundation

struct PokeList: Codable {
    let results: [Results]
}

struct Results: Codable {
    let name: String
}
