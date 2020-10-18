//
//  Favorites.swift
//  NBSMovie
//
//  Created by Ismail . on 19/10/20.
//

import SwiftUI

class Favorites: ObservableObject {
    private var movie: Set<Int>
    
    private let saveKey = "Favorites"
    
    init() {
        self.movie = []
    }
    
    func contains(_ movies: Movie) -> Bool {
        movie.contains(movies.id)
    }
    
    func add (_ movies: Movie) {
        objectWillChange.send()
        movie.insert(movies.id)
        save()
    }
    
    func remove(_ movies: Movie) {
        objectWillChange.send()
        movie.remove(movies.id)
        save()
    }
    
    func save() {
        //tes
    }
}
