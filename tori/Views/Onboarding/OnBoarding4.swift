//
//  OnBoarding4.swift
//  tori
//
//  Created by Fahad Munawar on 5/24/24.
//

import SwiftUI

struct DrinkOption {
    var image: String
    var selected: Bool
}

struct OnBoarding4: View {
    @State var geometry: GeometryProxy
    let indexRectangle: Int = 3
    @State var drink: [DrinkOption] = [
        DrinkOption(image: "glass", selected: false),
        DrinkOption(image: "glass", selected: false)
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
            Text("Want to have drinks?")
                .font(.system(.title, design: .serif))
                .font(.title)
                .foregroundColor(.black)
                .padding(.all)
            HStack {
                //Button 1
                Button(action: {
                    drink[0].selected.toggle()
                }) {
                    configurationForButton(drink: drink[0], geometry: geometry)
                }
                .padding(.horizontal)
                //Button 2
                Button(action: {
                    drink[1].selected.toggle()
                }) {
                    ZStack {
                        Image(systemName: "circle.slash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width / 7)
                            .foregroundColor(.black)
                        configurationForButton(drink: drink[1], geometry: geometry)
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
    private func configurationForButton(drink: DrinkOption, geometry: GeometryProxy) -> some View {
        Image(drink.image)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 25)
                .fill(drink.selected ? Color.blue : Color.gray))
    }
}

//
//#Preview {
//    OnBoarding4()
//}
