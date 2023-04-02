//
//  RootView.swift
//  practica_superhero
//
//  Created by IsaDevs on 1/4/23.
//
/// CAJA DE ESTADOS

import SwiftUI

struct RootView: View {
    /// declaracion de la variable de entorno
    @EnvironmentObject var rootViewModel : ViewModelHeroe
    
    var body: some View {
        switch rootViewModel.status {
        case .none:
            Text("Nothing to do")
        case .loading:
            Text("Nothing to do")
        case .loaded:
            Text("Nothing to do")
        case .error(error: let error):
            Text("Nothing to do \(error)")
        }
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(ViewModelHeroe())
    }
}

