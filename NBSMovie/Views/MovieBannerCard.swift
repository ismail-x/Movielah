//
//  MovieBanner.swift
//  NBSMovie
//
//  Created by Ismail . on 16/10/20.
//

import SwiftUI

struct MovieBannerCard: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        ZStack {
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                Rectangle()
                    .frame(height: 80)
                    .opacity(0.35)
                    .blur(radius: 10)
                
            } else {
                Rectangle()
                    .fill(Color.gray)
                    .cornerRadius(0)
                    .shadow(radius: 4)
                Text(movie.title)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(height: 350)
        .onAppear{
            self.imageLoader.loadImage(with: self.movie.posterURL)
        }
    }
}
