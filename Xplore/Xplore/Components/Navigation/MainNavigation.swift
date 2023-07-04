//
//  MainNavigation.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/26.
//

import SwiftUI
import Firebase

struct MainNavigation: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)

            AddPostView(selectedTab: $selectedTab)
                .tabItem {
                    Label("New Post", systemImage: "plus.circle.fill")
                }
                .tag(1)

            FavouritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
                .tag(2)

            FeedView()
                .tabItem {
                    Label("Feed", systemImage: "note.text")
                }
                .tag(3)
        }
    }
}
