//
//  MovieService.swift
//  Cinetopia
//
//  Created by Juliano Sgarbossa on 02/06/25.
//

import Foundation

enum MovieServiceError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

struct MovieService {
    func getMovies() async throws -> [Movie] {
        
        let urlString = "https://my-json-server.typicode.com/alura-cursos/movie-api/movies"
        
        guard let url = URL(string: urlString) else {
            throw MovieServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResonse = response as? HTTPURLResponse, httpResonse.statusCode == 200 else {
            throw MovieServiceError.invalidResponse
        }
        
        do {
            let movies = try JSONDecoder().decode([Movie].self, from: data)
            return movies
        } catch {
            throw MovieServiceError.decodingError
        }
    }
}
