
//  ApiResquest.swift
//  practica_superhero
//
//  Created by IsaDevs on 1/4/23.
//

import Foundation

let BASE_URL = "http://gateway.marvel.com/v1/"
let HASH = "ts=1&apikey=22fea0a00d89423ab2f66df4f293b25b&hash=02139404482f8bd177772210f47b4b74&limit=1"
var id : Int?

struct Request {
    static let get = "GET"
    static let content = "application/json"
}

enum endpoints : String {
    case allHeroes = "public/characters?"
    case series = "/public/characters/"// {characterId}/series?
    //case series = "/public/characters/{characterId}/series?"
}


enum values : String {
    case apikey = "22fea0a00d89423ab2f66df4f293b25b"
    case ts = "1"
    case md5Hash = "02139404482f8bd177772210f47b4b74"
    case limit = "25"
}

/// Conformará las llamadas para obtener los resultados
struct Network {
    
    func getHeroes() -> URLRequest {
        //let urlHeroes : String = "\(BASE_URL)\(endpoints.allHeroes.rawValue)"
        
        var urlComponents = URLComponents(string: "\(BASE_URL)\(endpoints.allHeroes.rawValue)")
        /// inserción de los params para la consulta
        urlComponents?.queryItems = [
            URLQueryItem(name: "apikey", value: "\(values.apikey.rawValue)"),
            URLQueryItem(name: "ts", value: "\(values.ts.rawValue)"),
            URLQueryItem(name: "hash", value: "\(values.md5Hash.rawValue)"),
            URLQueryItem(name: "limit", value: "\(values.limit.rawValue)")
           ]

        var request = URLRequest(url: (urlComponents?.url!)!)
        request.httpMethod = Request.get
        request.addValue(Request.content, forHTTPHeaderField: "Content-type")
        
        
        return request
    }

}
