//
//  SeriesMarvel.swift
//  project_superheroesMarvel
//
//  Created by IsaDevs on 2/4/23.
//

import Foundation

struct SeriesMarvel : Identifiable, Codable {
    let id: Int
    let name : String
    let description: String
    //let thumbnail: Thumbnail
    let resourceURI: String
}
