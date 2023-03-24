//
//  ContentView.swift
//  Poke
//
//  Created by Ailin Nakaganeku on 10/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon = [Pokemon]()
    @State var searchText = ""
    var body: some View {
        NavigationView {
            List {
                
            }
            .onAppear {
                PokeRequest().getData() { pokemon in
                    self.pokemon = pokemon
                    for pokemon in pokemon {
                        print(pokemon.name)
                    }
                }
            }.searchable(text: $searchText).navigationTitle("PokeApi")        }
        //            .onAppear {
        //                PokemonRequest().getData() {
        //                    pokemon in print(pokemon)
        //                    for pokemon in pokemon {
        //                        print(pokemon.name)
        //                    }
        //                }
        //            }
        
        //            .onAppear {
        //                PokemonSelectedRequest().getData(url:"https://pokeapi.co/api/v2/pokemon/1"){
        //                    url in print(url)
        //                }
        //
        //            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
