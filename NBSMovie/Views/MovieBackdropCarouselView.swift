//
//  MovieBackdropCarouselView.swift
//  NBSMovie
//
//  Created by Ismail . on 16/10/20.
//

import SwiftUI

struct MovieBackdropCarouselView: View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10){
                    ForEach(self.movies) { movie in
                        MovieBackdropCard(movie: movie)
                            .frame(width: 100, height: 200)
                            .padding(.leading, movie.id == self.movies.first!.id ? 14 : 0)
                            .padding(.trailing, movie.id == self.movies.last!.id ? 14 : 0)
                    }
                }
            }
        }
    }
}

struct MovieBackdropCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCarouselView(title: "Latest", movies: Movie.stubbedMovies)
    }
}
