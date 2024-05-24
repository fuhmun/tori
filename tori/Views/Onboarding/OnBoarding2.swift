//
//  OnBoarding2.swift
//  tori
//
//  Created by Fahad Munawar on 5/23/24.
//

import SwiftUI

struct OnBoarding2: View {
    @State var userName: String = ""
    @State var geometry: GeometryProxy
    var body: some View {
        VStack {
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
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Confirm")
                    .font(.system(.title, design: .serif))
                    .foregroundStyle(Color.white)
                    .frame(width: geometry.size.width/1.3, height: geometry.size.height/11)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            })
            .padding(.bottom)
        }
        .frame(width: geometry.size.width/1.2, height: geometry.size.height/1.2)
        .background(Color.white)
        .opacity(0.6)
        .clipShape(
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
        )
        
    }
}

//
//#Preview {
//    OnBoarding2()
//}
