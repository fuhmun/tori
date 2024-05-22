//
//  SplashScreen.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI

struct SplashScreenView: View {
    
    @State var onScreen: Bool = false
    
    var body: some View {
        ZStack {
            if self.onScreen {
                ContentView()
            } else {
                Image("Background")
                    .ignoresSafeArea()
                GeometryReader { geometry in
                    VStack {
                        Image("Tori")
                            .position(x: geometry.frame(in: .local).midX, y: geometry.size.height / 3)
                    }
                }
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.onScreen = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
