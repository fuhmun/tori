//
//  ContentView.swift
//  DreamTeam
//
//  Created by Fahad Munawar on 5/3/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            DiscoverView()
                .tabItem{
                    Label("Discover",systemImage:"magnifyingglass")
                }
            SuggestionView()
                .tabItem{
                    Label("Home",systemImage:"house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile",systemImage:"person.crop.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
