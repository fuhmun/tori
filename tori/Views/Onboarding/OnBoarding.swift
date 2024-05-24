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
                    Text("Lets ask a few questions to personalize your experience.")
                        .font(.system(.title2, design: .serif))
                        .multilineTextAlignment(.center)
                        .padding()
                    TabView {
                        OnBoarding1(geometry: geometry)
                            .tabItem {
                                Label("One", systemImage: "1.circle")
                            }
                        
                        OnBoarding2(geometry: geometry)
                            .tabItem {
                                Label("Two", systemImage: "1.circle")
                            }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                }
            }
        }
    }
}

#Preview {
    OnBoarding()
}
