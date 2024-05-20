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
            Image("Splash")
                .ignoresSafeArea(.all)
                .background()
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
