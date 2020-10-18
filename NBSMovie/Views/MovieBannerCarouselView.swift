//
//  MovieBannerCarouselView.swift
//  NBSMovie
//
//  Created by Ismail . on 16/10/20.
//

import SwiftUI

import SwiftUI

struct MovieBannerCarouselView: View {
    
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies.prefix(4)) { movie in
                        NavigationLink(
                            destination: MovieDetailView(movieId: movie.id)){
                            MovieBannerCard(movie: movie)
                                .frame(width: 420, height: 405)
                        }
                        .buttonStyle(PlainButtonStyle())
                          
                    }
                }
            }
        }
    }
}

struct MovieBannerCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MovieBannerCarouselView(movies: Movie.stubbedMovies)
    }
}
