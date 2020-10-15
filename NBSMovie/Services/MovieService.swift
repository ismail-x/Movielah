//
//  MovieService.swift
//  NBSMovie
//
//  Created by Ismail . on 15/10/20.
//

import Foundation

import Foundation

protocol MovieService {
    
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MovieResponse, MovieError>) ->())
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, MovieError>) -> ())
    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, MovieError>) -> ())
    
}

enum MovieListEndpoint: String, CaseIterable {
    case nowPlaying = "now_playing"
    case upcoming
    case popular
    
    var description: String{
        switch self {
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .popular: return "Popular"
        }
    }
}

enum MovieError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to Fetch Data"
        case .invalidEndpoint: return "Invalid Endpoint"
        case .invalidResponse: return "Invalid Response"
        case .noData: return "No Data"
        case .serializationError: return "Failed to Decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
