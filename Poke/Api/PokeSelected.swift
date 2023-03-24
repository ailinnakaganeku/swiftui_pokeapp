//
//  PokeSelected.swift
//  Poke
//
//  Created by Ailin Nakaganeku on 10/03/2023.
//


import Foundation

struct PokemonSelected : Codable {
    var detail: PokemonDetail
    var weight: Int
}

struct PokemonDetail : Codable {
    var front_default: String?
}

class PokemonSelectedRequest  {
    func getData(url: String, completion:@escaping (PokemonDetail) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonDetail = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonDetail.detail)
            }
        }.resume()
    }
}
