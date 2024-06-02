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
    @Binding var selectedTab: Int
    @State var drinkSelected: Bool = false
    
    @State var drink: [DrinkOption] = [
        DrinkOption(image: "glass", selected: false),
        DrinkOption(image: "glass", selected: false)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    selectedTab = 2
                } label: {
                    Image(systemName: "arrow.left.circle.fill")
                        .resizable()
                        .frame(width: geometry.size.width * 0.13, height: geometry.size.height * 0.07)
                        .foregroundColor(Color.gray)
                        .padding(.leading)
                }
                Spacer()
            }
            .padding()
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
                                .fill(Color.white)
                                .opacity(0.8)
                                .frame(width: geometry.size.width / 13, height: geometry.size.height / 90)
                        }
                    }
                }
                Text("Do you drink?")
                    .font(.system(.title, design: .serif))
                    .font(.title)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.all)
                HStack {
                    //Button 1
                    Button(action: {
                        drinkSelected = true
                        selectDrink(index: 0)
                    }) {
                        configurationForButton(drink: drink[0], geometry: geometry)
                    }
                    .padding(.horizontal)
                    //Button 2
                    Button(action: {
                        drinkSelected = true
                        selectDrink(index: 1)
                    }) {
                        ZStack {
                            
                            configurationForButton(drink: drink[1], geometry: geometry)
                            Image(systemName: "circle.slash")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width / 7)
                                .foregroundColor(.red)
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
                
                Button(action: {
                    if drinkSelected {
                        initiateDelayedActions()
                    }
                }, label: {
                    Text("Next")
                        .font(.system(.title, design: .serif))
                        .foregroundStyle(Color.white)
                        .frame(width: geometry.size.width/3, height: geometry.size.height/11)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                        .background(RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .fill(drinkSelected ? Color.blue : Color.red))
                })
                .buttonStyle(ScaleButtonStyle())
                .padding(.vertical)
                
            }
            .padding(.top)
//            .frame(width: geometry.size.width/1.2, height: geometry.size.height/1.2)
//            .background(Color.white)
//            .opacity(0.6)
//            .clipShape(
//                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
//            )
            Spacer()
        }
        
    }
    @ViewBuilder
    private func configurationForButton(drink: DrinkOption, geometry: GeometryProxy) -> some View {
        Image(drink.image)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 25)
                .fill(drink.selected ? Color.blue : Color.white))
    }
    private func selectDrink(index: Int) {
        for i in drink.indices {
            drink[i].selected = (i == index)
        }
    }
    private func initiateDelayedActions() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation {
                if drinkSelected {
                    self.selectedTab = 4
                }
            }
        }
    }
}

//
//#Preview {
//    OnBoarding4()
//}
