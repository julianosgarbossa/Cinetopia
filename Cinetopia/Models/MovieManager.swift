//
//  MovieManager.swift
//  Cinetopia
//
//  Created by Juliano Sgarbossa on 03/06/25.
//

import Foundation

class MovieManager {
    
    static let shared = MovieManager()
    var favoritesMovies: [Movie] = []
    
    private init() { }
    
    func add(movie: Movie) {
        if favoritesMovies.contains(where: { $0.id == movie.id }) {
            self.remove(movie: movie)
        } else {
            favoritesMovies.append(movie)
        }
    }
    
    func remove(movie: Movie) {
        if let index = favoritesMovies.firstIndex(where: { $0.id == movie.id }) {
            favoritesMovies.remove(at: index)
        }
    }
}
