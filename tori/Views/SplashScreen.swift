//
//  SplashScreen.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var onScreen: Bool = false
    @State private var toriBlink: Bool = false
    @State private var imageOpacity: Double = 0.0
    
    var body: some View {
        ZStack {
            if self.onScreen {
                OnBoarding()
            } else {
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
//                    .opacity(backgroundBlink ? 1.0 : 0.5)
                    
                
                GeometryReader { geometry in
                    VStack {
                        Image("Tori")
                            .resizable()
                            .scaledToFit()
                        
                            .frame(width: geometry.size.width / 2.5)
//                       DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
//                            Text("Let us take the guesswork out of your day")
//                                .foregroundStyle(Color.white)
//                                 .font(.headline)
//                        }
                    }
//                    .scaleEffect(CGSize(width:toriBlink ? 1.0 : 2.0, height:toriBlink ? 1.0 : 2.0))
                            .opacity(imageOpacity)
                            .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true), value: toriBlink)
                            .position(x: geometry.frame(in: .local).midX, y: geometry.size.height / 3)
                            .animation(.easeInOut(duration: 4.5), value: imageOpacity)
                       
                       
//                    }
                }
            }
        }
        .onAppear() {
            toriBlink = true
            withAnimation {
                imageOpacity = 1.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
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
