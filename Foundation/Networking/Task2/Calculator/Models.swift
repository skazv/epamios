//
//  Models.swift
//  Calculator
//
//  Created by Suren Kazaryan on 11.07.25.
//

struct TopRate: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let adult: Bool
    let backdrop_path: String
    let origin_country: [String]
    let original_language: String
    let original_name: String
    let overview: String
    let popularity: Float
    let poster_path: String
    let first_air_date: String
    let name: String
}
