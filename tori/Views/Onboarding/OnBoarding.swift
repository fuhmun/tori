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
                    TabView {
                        OnBoarding1(geometry: geometry)
                            .tabItem {
                                Label("One", systemImage: "1.circle")
                            }
                            .padding(.bottom)
                        
                        OnBoarding2(geometry: geometry)
                            .tabItem {
                                Label("One", systemImage: "1.circle")
                            }
                            .padding(.bottom)
                        
                        OnBoarding3(geometry: geometry)
                            .tabItem {
                                Label("Two", systemImage: "1.circle")
                            }
                            .padding(.bottom)
                        
                        OnBoarding4(geometry: geometry)
                            .tabItem {
                                Label("One", systemImage: "1.circle")
                            }
                            .padding(.bottom)
                        
                        OnBoarding5(geometry: geometry)
                            .tabItem {
                                Label("Two", systemImage: "1.circle")
                            }
                            .padding(.bottom)
                        
                        OnBoarding6(geometry: geometry)
                            .tabItem {
                                Label("One", systemImage: "1.circle")
                            }
                            .padding(.bottom)
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
