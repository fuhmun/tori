//
//  OnBoarding5.swift
//  tori
//
//  Created by Fahad Munawar on 5/24/24.
//

import SwiftUI

struct SmokeOption {
    var image: String
    var selected: Bool
}

struct OnBoarding5: View {
    @State var userName: String = ""
        @State var geometry: GeometryProxy
    let indexRectangle: Int = 4
    @State var smoke: [SmokeOption] = [
        SmokeOption(image: "smoking", selected: false),
        SmokeOption(image: "smoking", selected: false)
    ]
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
            Text("Is smoking cool with you?")
                .font(.system(.title2, design: .serif))
                .font(.title)
                .foregroundColor(.black)
                .padding(.all)
            
            HStack {
                //Button 1
                Button(action: {
                    smoke[0].selected.toggle()
                }) {
                    configurationForButton(smoke: smoke[0], geometry: geometry)
                }
                .padding(.horizontal)
                //Button 2
                Button(action: {
                    smoke[1].selected.toggle()
                }) {
                    ZStack {
                        Image(systemName: "circle.slash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width / 7)
                            .foregroundColor(.black)
                        configurationForButton(smoke: smoke[1], geometry: geometry)
                    }
                }
                .padding(.horizontal)
            }
            Spacer()
        }
        .padding(.top)
        .frame(width: geometry.size.width/1.2, height: geometry.size.height/1.2)
        .background(Color.white)
        .opacity(0.6)
        .clipShape(
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
        )
        
    }
        @ViewBuilder
        private func configurationForButton(smoke: SmokeOption, geometry: GeometryProxy) -> some View {
            Image(smoke.image)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25)
                    .fill(smoke.selected ? Color.blue : Color.gray))
    }
}

//#Preview {
//    OnBoarding5()
//}
