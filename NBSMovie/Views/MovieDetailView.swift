//
//  MovieDetailView.swift
//  NBSMovie
//
//  Created by Ismail . on 16/10/20.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieId: Int
    @ObservedObject private var movieDetailState = MovieDetailState()
    
    var body: some View {
        ZStack{
            LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error) {
                self.movieDetailState.loadMovie(id: self.movieId)
            }
        }
        .navigationBarTitle(movieDetailState.movie?.title ?? "")
        .onAppear{
            self.movieDetailState.loadMovie(id: self.movieId)
        }
    }
}

struct MovieDetailListView: View {
    
    let movie: Movie
    
    var body: some View {
        List{
            
        }
    }
    
}

struct MovieDetailImage: View {
    <#fields#>
}


struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MovieDetailView(movieId: Movie.stubbedMovie.id)
        }
    }
}
