//
//  Movie.swift
//  NBSMovie
//
//  Created by Ismail . on 15/10/20.
//

import Foundation


struct Movie: Decodable, Identifiable {
    
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(backdropPath ?? "")")!
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
}

struct MovieResponse: Decodable {
    let results: [Movie]
}

