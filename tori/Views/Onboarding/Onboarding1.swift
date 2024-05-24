//
//  OnBoarding.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI

struct OnBoarding1: View {
    @State var userName: String = ""
    var geometry: GeometryProxy
    let indexRectangle: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<6) { i in
                    if indexRectangle >= i {
                        Rectangle()
                            .fill(Color.orange)
                            .frame(width: geometry.size.width / 13, height: geometry.size.height / 90)
                    }
                    else {
                        Rectangle()
                            .fill(Color.black)
                            .opacity(0.8)
                            .frame(width: geometry.size.width / 13, height: geometry.size.height / 90)
                    }
                }
            }
            Text("What's your name?")
                .font(.system(.title, design: .serif))
                .font(.title)
                .foregroundColor(.black)
                .padding(.all)
            
            TextField (
                "",
                text: $userName
            )
            .foregroundColor(.white)
            .background(Color.white)
            .multilineTextAlignment(.center)
            .disableAutocorrection(true)
            .textFieldStyle(.roundedBorder)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .frame(width: geometry.size.width/1.4, height: geometry.size.height/35)
            .opacity(0.9)
            .padding(.all)
            Spacer()
            
//            Button(action: { }, label: {
//                Text("Confirm")
//                    .font(.system(.title, design: .serif))
//                    .foregroundStyle(Color.white)
//                    .frame(width: geometry.size.width/1.3, height: geometry.size.height/11)
//                    .background(Color.blue)
//                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
//            })
//            .padding(.bottom)
        }
        .padding(.top)
        .frame(width: geometry.size.width/1.2, height: geometry.size.height/1.2)
        .background(Color.white)
        .opacity(0.6)
        .clipShape(
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
        )
    }
}

//#Preview {
//    OnBoarding1(geometry: geometry)
//}
