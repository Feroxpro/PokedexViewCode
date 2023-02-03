//
//  RestManager.swift
//  Pokedex
//
//  Created by Felipe Domingos on 17/01/23.
//

import Foundation
import Alamofire

let baseUrl: String = "https://pokeapi.co/api/v2"

class RestManager {
    
    func validatepokemon(completion: @escaping (_ result: PokeList) -> Void) {
        AF.request("\(baseUrl)/pokemon?limit=1000&offset=0", method: .get).response { response in
            DispatchQueue.main.async {
            if let data = response.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                guard let pokeData = try? decoder.decode(PokeList.self, from: data) else { return }
                completion(pokeData)
            } else {
                print(response.error as Any, "DEU ERRO")
                }
            }
        }
    }
    
    func validatepokemonDetails(name: String, completion: @escaping (_ details: Register) -> Void) {
        AF.request("\(baseUrl)/pokemon/\(name)", method: .get).response { response in
            DispatchQueue.main.async {
                if let data = response.data {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .useDefaultKeys
                    guard let pokeDataDetails = try? decoder.decode(Register.self, from: data) else { return }
                    completion(pokeDataDetails)
                } else {
                    print(response.error as Any, "DEU ERRO")
                }
            }
        }
    }
}
