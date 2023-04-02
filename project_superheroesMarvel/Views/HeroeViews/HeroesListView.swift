//
//  HeroesListView.swift
//  project_superheroesMarvel
//
//  Created by IsaDevs on 2/4/23.
//

import SwiftUI

struct HeroesListView: View {
    
    /// variables de estado
    //@EnvironmentObject var viewModelRoot : ViewModelHeroe
    @StateObject var viewModel : ViewModelHeroe
    @State private var filter = ""
    
    var body: some View {
        
        NavigationStack {
            List {
                if let hero = viewModel.heroes?.data.results {
                    ForEach(hero){ h in
                        Text("HOLA")
                        
                    }
                }
            }
        }
    }
}

struct HeroesListView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesListView(viewModel: ViewModelHeroe())
    }
}
