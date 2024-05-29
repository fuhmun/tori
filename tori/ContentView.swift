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
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = CustomColor.grayUI
        
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.systemGray
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.accent
                tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.accent]
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
                if #available(iOS 15.0, *) {
                    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                }
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
//        .toolbarColorScheme(.light, for: .tabBar)
    }
}

//#Preview {
//    ContentView()
//}
