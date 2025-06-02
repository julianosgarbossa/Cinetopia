//
//  Movie.swift
//  Cinetopia
//
//  Created by Juliano Sgarbossa on 30/05/25.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
}
