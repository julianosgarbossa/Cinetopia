//
//  Movie.swift
//  Cinetopia
//
//  Created by Juliano Sgarbossa on 30/05/25.
//

import Foundation

class Movie: Codable {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
    private(set) var isSelected: Bool? = false
    
    func changeSelectionStatus() {
        isSelected = !(isSelected ?? false)
    }
}
