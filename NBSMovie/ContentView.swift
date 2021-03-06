//
//  ContentView.swift
//  NBSMovie
//
//  Created by Ismail . on 15/10/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var popularState = MovieListState()
    
    var body: some View {
        TabView {
            MovieListView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
            }
            .tag(0)
            
            MovieGridPopular()
                .tabItem{
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .tag(1)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
