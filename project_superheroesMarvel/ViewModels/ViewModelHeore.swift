//
//  ViewModelHeroe.swift
//  practica_superhero
//
//  Created by IsaDevs on 1/4/23.
//

import Foundation
import Combine

final class ViewModelHeroe : ObservableObject {
    @Published var heroes : HeroeMarvel?
    @Published var status = Status.none //--> must be a case of results for the rootview
    
    var suscriptorHeroe = Set<AnyCancellable>()
    
    init(){
    }
    
    func gerResultsFromHeroe(filtro : String) {
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: Network().getHeroes())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return $0.data
            }
            .decode(type: HeroeMarvel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
        ///llamado al suscriptor
            .sink { value in
                switch value {
                case .failure(let error) :
                    print(error)
                case .finished:
                    print("Completada la carga ")
                }
            } receiveValue: { heroe in
                self.heroes = heroe
            }
            .store(in: &suscriptorHeroe)
    }
}

