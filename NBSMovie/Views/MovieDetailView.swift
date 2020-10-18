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
    @ObservedObject var favorites = Favorites()
    
    var body: some View {
        ZStack{
            LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error) {
                self.movieDetailState.loadMovie(id: self.movieId)
            }
            
            if movieDetailState.movie != nil {
                MovieDetailListView(movie: self.movieDetailState.movie!)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .navigationBarTitle(movieDetailState.movie?.title ?? "")
        .onAppear{
            self.movieDetailState.loadMovie(id: self.movieId)
        }
        .environmentObject(favorites)
    }
    
}

struct MovieDetailListView: View {
    
    let movie: Movie
    private let imageLoader = ImageLoader()
    @State private var selectedTrailer: MovieVideo?
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        List{
            MovieDetailImage(imageLoader: imageLoader, imageURL: self.movie.backdropURL)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            HStack {
                Text(movie.genreText)
                Image(systemName: "dot.square.fill")
                Text(movie.yearText)
                Text(movie.durationText)
            }
            HStack {
                Button(favorites.contains(movie) ? "Remove From Favorite 💔" : "Add To Favorite ❣️") {
                    if self.favorites.contains(self.movie) {
                        self.favorites.remove(self.movie)
                    } else {
                        self.favorites.add(self.movie)
                    }
                }
            }
            Text(movie.overview)
            HStack {
                if !movie.ratingText.isEmpty {
                    Text(movie.ratingText).foregroundColor(.yellow)
                }
                Text(movie.scoreText)
            }
            
            HStack(alignment: .top, spacing: 4){
                if movie.cast != nil && movie.cast!.count > 0 {
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("Cast").font(.headline)
                        ForEach(self.movie.cast!.prefix(7)) { cast in
                            Text(cast.name)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                
                if movie.crew != nil && movie.crew!.count > 0 {
                    VStack(alignment: .leading, spacing: 4) {
                        if movie.directors != nil && movie.directors!.count > 0 {
                            Text("Director(s)")
                            ForEach(self.movie.directors!.prefix(2)) {
                                crew in
                                Text(crew.name)
                            }
                        }
                    }
                }
                
            }
            if movie.youtubeTrailers != nil && movie.youtubeTrailers!.count > 0 {
                Text("Trailers").font(.headline)
                
                ForEach(movie.youtubeTrailers!) { trailer in
                    Button(action: {
                        self.selectedTrailer = trailer
                    }){
                        HStack{
                            Text(trailer.name)
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(Color(UIColor.systemBlue))
                        }
                    }
                }
            }
        }
        .sheet(item: self.$selectedTrailer) { trailer in
            SafariView(url: trailer.youtubeURL!)
        }
    }
}

struct MovieDetailImage: View {
    
    @ObservedObject var imageLoader: ImageLoader
    let imageURL: URL
    
    var body: some View {
        ZStack{
            Rectangle().fill(Color.gray.opacity(0.3))
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear{
            self.imageLoader.loadImage(with: self.imageURL)
        }
    }
    
}
