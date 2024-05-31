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
    @Binding var selectedTab: Int
    @State var smokeSelected: Bool = false 
    
    @State var smoke: [SmokeOption] = [
        SmokeOption(image: "smoking", selected: false),
        SmokeOption(image: "smoking", selected: false)
    ]
    var body: some View {
        VStack {
            HStack {
                Button {
                    selectedTab = 4
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
                Text("Are you cool with smoking?")
                    .font(.system(.title, design: .serif))
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.all)
                    .multilineTextAlignment(.center)
                
                HStack {
                    //Button 1
                    Button(action: {
                        smokeSelected = true
                        selectSmoke(index: 0)
                    }) {
                        configurationForButton(smoke: smoke[0], geometry: geometry)
                    }
                    .padding(.horizontal)
                    //Button 2
                    Button(action: {
                        smokeSelected = true
                        selectSmoke(index: 1)
                    }) {
                        ZStack {
                            
                            configurationForButton(smoke: smoke[1], geometry: geometry)
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
                    if smokeSelected {
                        initiateDelayedActions()
                    }
                }, label: {
                    Text("Confirm")
                        .font(.system(.title, design: .serif))
                        .foregroundStyle(Color.white)
                        .frame(width: geometry.size.width/3, height: geometry.size.height/11)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                        .background(RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .fill(smokeSelected ? Color.blue : Color.red))
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
    private func configurationForButton(smoke: SmokeOption, geometry: GeometryProxy) -> some View {
        Image(smoke.image)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: geometry.size.height * 0.05)
            .padding()
            .background(RoundedRectangle(cornerRadius: 25)
                .fill(smoke.selected ? Color.blue : Color.white))
    }
    private func selectSmoke(index: Int) {
        for i in smoke.indices {
            smoke[i].selected = (i == index)
        }
    }
    private func initiateDelayedActions() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation {
                if smokeSelected {
                    self.selectedTab = 5
                }
            }
        }
    }
}

//#Preview {
//    OnBoarding5()
//}
