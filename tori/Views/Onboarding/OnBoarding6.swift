//
//  OnBoardingg.swift
//  tori
//
//  Created by Fahad Munawar on 5/24/24.
//

import SwiftUI


struct OnBoarding6: View {
    @State var geometry: GeometryProxy
    let indexRectangle: Int = 5
    @Binding var selectedTab: Int
    
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
            Text("Are you cool with smoking?")
                .font(.system(.title, design: .serif))
                .font(.title)
                .foregroundColor(.black)
                .padding(.all)
                .multilineTextAlignment(.center)
            
            HStack {
                //Button 1
                Button(action: {
                    
                }) {
                    Text("Click here")
                }
                .padding(.horizontal)
                //Button 2
                Button(action: {
                    
                }) {
                    ZStack {
                        Image(systemName: "circle.slash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width / 7)
                            .foregroundColor(.black)
                        Text("Click here")
                    }
                }
                .padding(.horizontal)
            }
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("Confirm")
                    .font(.system(.title, design: .serif))
                    .foregroundStyle(Color.white)
                    .frame(width: geometry.size.width/1.3, height: geometry.size.height/11)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    .background(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            })
            .buttonStyle(ScaleButtonStyle())
            .padding(.bottom)

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
//    OnBoarding5()
//}
