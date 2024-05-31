//
//  LoadingView.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    @State var isPinAnimated: Bool = false
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                ZStack{
                    
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(Color(isPinAnimated ? .blue : .red))
                            .ignoresSafeArea()
                            .opacity(0.2)
                        //                        .frame(width:isPinAnimated ? 200: 150)
                            .animation(.easeInOut(duration: 3).repeatForever(autoreverses: true))
                    VStack{
                        Image("Pin")
                            .rotation3DEffect(
                                .degrees(isPinAnimated ? 0 : 360),
                                axis: (x:isPinAnimated ? 0 : 0, y:isPinAnimated ? 0 : 360, z: isPinAnimated ? 0 : 0)
                            )
                        //                    .opacity(isPinAnimated ? 1.0 : 0.5)
                            .animation(.easeInOut(duration: 15).repeatForever(autoreverses: false))
                            .padding()
                        Text("Loading…")
                            .font(.title)
//                            .opacity(isPinAnimated ? 1 : 0.4)
//                            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true))
                            .font(.system(.subheadline, design: .serif))
                            .foregroundStyle(Color.white)
                    }
                }
                
            }
            .onAppear(){
                isPinAnimated = true
//                withAnimation{
//                    isPinAnimated
//                }
            
                }
            }
        }
    }


#Preview {
    LoadingView()
}
