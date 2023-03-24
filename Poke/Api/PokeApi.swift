//
//  PokeApi.swift
//  Poke
//
//  Created by Ailin Nakaganeku on 10/03/2023.
//

import Foundation

struct PokeApi : Codable {
    var results : [Pokemon]
}

struct Pokemon : Codable, Identifiable {
    var id = UUID()
    var name: String
    var url: String
}

class PokeRequest {
    func getData(completion: @escaping ([Pokemon]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=200")
        else { return }
        URLSession.shared.dataTask(with: url) { (data,response, error) in
            guard let data = data else { return }
            let dataList = try! JSONDecoder().decode(PokeApi.self, from: data)
            DispatchQueue.main.async {
                completion(dataList.results)
            }
        }.resume()
        
    }
}
