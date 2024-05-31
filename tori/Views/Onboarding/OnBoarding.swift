//
//  OnBoarding.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI

struct OnBoarding: View {
    let totalTabs = 5
    @State var selectedTab = 0
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack {
                    TabView (selection: $selectedTab) {
                        if selectedTab == 0 {
                            OnBoarding1(geometry: geometry, selectedTab: $selectedTab)
                                .tabItem {
                                    Label("One", systemImage: "1.circle")
                                }
                                .padding(.bottom)
                                .tag(0)
                        }
                        else if selectedTab == 1 {
                            OnBoarding2(geometry: geometry, selectedTab: $selectedTab)
                                .tabItem {
                                    Label("One", systemImage: "1.circle")
                                }
                                .padding(.bottom)
                                .tag(1)
                        }
                        else if selectedTab == 2 {
                            OnBoarding3(geometry: geometry, selectedTab: $selectedTab)
                                .tabItem {
                                    Label("Two", systemImage: "1.circle")
                                }
                                .padding(.bottom)
                                .tag(2)
                        }
                        else if selectedTab == 3 {
                            OnBoarding4(geometry: geometry, selectedTab: $selectedTab)
                                .tabItem {
                                    Label("One", systemImage: "1.circle")
                                }
                                .padding(.bottom)
                                .tag(3)
                        }
                        else if selectedTab == 4 {
                            OnBoarding5(geometry: geometry, selectedTab: $selectedTab)
                                .tabItem {
                                    Label("Two", systemImage: "1.circle")
                                }
                                .padding(.bottom)
                                .tag(4)
                        }
//                        else if selectedTab == 5 {
//                            OnBoarding6(/*geometry: geometry,*/ /*selectedTab: $selectedTab*/)
//                                .tabItem {
//                                    Label("One", systemImage: "1.circle")
//                                }
//                                .padding(.bottom)
//                        }
                    }
                }
                
                .tabViewStyle(.page(indexDisplayMode: .always))
            }
        }
    }
}


#Preview {
    OnBoarding()
}
