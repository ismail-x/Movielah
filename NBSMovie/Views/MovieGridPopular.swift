//
//  MovieGridPopular.swift
//  NBSMovie
//
//  Created by Ismail . on 18/10/20.
//

import SwiftUI

struct MovieGridPopular: View {
    
    @ObservedObject var movieSearchState = MovieSearchState()
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                SearchBarView(placeholder: "Search", text: self.$movieSearchState.query)
                    .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                
                LoadingView(isLoading: self.movieSearchState.isLoading, error: self.movieSearchState.error) {
                    self.movieSearchState.search(query: self.movieSearchState.query)
                }
                
                if self.movieSearchState.movies != nil {
                    LazyVGrid(columns: [
                        GridItem(spacing: 22),
                        GridItem(spacing: 16),
                    ], alignment: .leading, spacing: 5, content: {
                        ForEach(self.movieSearchState.movies!) { movie in
                            NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                                MovieGrid(movie: movie)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }).padding(.init(top: 0, leading: 22, bottom: 0, trailing: 40))
                    
                }
            }
            .navigationTitle("Search Movie")
            .onAppear {
                movieSearchState.startObserve()
            }
        }
    }
}

struct MovieGridPopular_Previews: PreviewProvider {
    static var previews: some View {
        MovieGridPopular()
    }
}
