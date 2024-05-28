//
//  ContentView.swift
//  DreamTeam
//
//  Created by Fahad Munawar on 5/3/24.
//

import Foundation
import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var userProfile: [Profile]
    
    init() {
        UITabBar.appearance().backgroundColor = CustomColor.grayUI
        UITabBar.appearance()
    }
    
    var body: some View {
        TabView{
            SuggestionView()
                .tabItem{
                    Label("Tori",systemImage:"wand.and.stars")
                }
            DiscoverView()
                .tabItem{
                    Label("Discover",systemImage:"plus.magnifyingglass")
                }
            ProfileView()
                .tabItem{
                    Label("Profile",systemImage:"person.fill")
                }
        }
        .toolbarColorScheme(.light, for: .tabBar)
    }
}

//#Preview {
//    ContentView()
//}
