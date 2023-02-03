//
//  Spitres.swift
//  Pokedex
//
//  Created by Felipe Domingos on 17/01/23.
//

import Foundation


struct PokemonSpritesModel: Codable {
   var back_default: String?
   var back_female: String?
   var back_shiny: String?
   var back_shiny_female: String?
   var front_default: String?
   var front_female: String?
   var front_shiny: String?
   var front_shiny_female: String?
   var other: PokemonSpritesModelOther?
}

struct PokemonSpritesModelOther: Codable {
   var dreamWorld: PokemonSpritesModelOtherDreamWorld?
   var officialArtwork: PokemonSpritesModelOtherOfficialArtwork?
   
   private enum CodingKeys: String, CodingKey {
      case officialArtwork = "official-artwork", dreamWorld = "dream_world"
   }
    
   struct PokemonSpritesModelOtherDreamWorld: Codable {
      var front_default: String?
      var front_female: String?
   }
   
   struct PokemonSpritesModelOtherOfficialArtwork: Codable {
      var front_default: String?
   }
}
