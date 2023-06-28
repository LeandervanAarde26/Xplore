//
//  MainNavigation.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/26.
//

import SwiftUI

struct MainNavigation: View {
    var body: some View {
        TabView{
            ContentView()
            .tabItem{
                Label("Home", systemImage: "house")
            }
            
//            Text("Countries")
            AddPostView()
                .tabItem{
                Label("New Post", systemImage: "plus.circle.fill")
            }
            
//            CountryDetailView()
            FavouritesView()
            .tabItem{
                Label("Favorites", systemImage: "heart")
            }
            
            FeedView()
            .tabItem{
                Label("Feed", systemImage: "note.text")
            }
        }
    }
}

struct MainNavigation_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigation()
          
    }
}
