//
//  project_superheroesMarvelApp.swift
//  project_superheroesMarvel
//
//  Created by IsaDevs on 2/4/23.
//

import SwiftUI

@main
struct project_superheroesMarvelApp: App {
    /// definición de la enviroment object a inyectar
    @StateObject var rootView = ViewModelHeroe()
    var body: some Scene {
        WindowGroup{
            
           // HeroeListView(viewModel: ViewModelHeroe()).environmentObject(listViewHeroe)
            RootView().environmentObject(rootView)
        }
    }
}
