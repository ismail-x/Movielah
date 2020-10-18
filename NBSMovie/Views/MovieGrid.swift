//
//  MovieGrid.swift
//  NBSMovie
//
//  Created by Ismail . on 18/10/20.
//

import SwiftUI

struct MovieGrid: View {
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        ZStack {
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .shadow(radius: 4)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                    .shadow(radius: 4)
                Text(movie.title)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(width: 180, height: 306)
        .onAppear{
            self.imageLoader.loadImage(with: self.movie.posterURL)
            
        }
    }
}
