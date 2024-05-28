//
//  OnBoarding3.swift
//  tori
//
//  Created by Fahad Munawar on 5/24/24.
//

import SwiftUI

struct MoneyOption {
    var amount: String
    var selected: Bool
}

struct OnBoarding3: View {
    @State var geometry: GeometryProxy
    let indexRectangle: Int = 2
    
    @State var money: [[MoneyOption]] = [
        [MoneyOption(amount: "$", selected: false), MoneyOption(amount: "$$", selected: false)],
        [MoneyOption(amount: "$$$", selected: false), MoneyOption(amount: "$$$$", selected: false)]
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
            Text("Cost Preferences?")
                .font(.system(.title, design: .serif))
                .font(.title)
                .foregroundColor(.black)
                .padding(.all)
            
            ForEach(0..<money.count, id: \.self) { rowIndex in
                HStack (spacing: 20) {
                    ForEach(0..<money[rowIndex].count, id: \.self) { columnIndex in
                        Button(action: {
                            money[rowIndex][columnIndex].selected.toggle()
                        }) {
                            Text(money[rowIndex][columnIndex].amount)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 25)
                                    .fill(money[rowIndex][columnIndex].selected ? Color.blue : Color.gray))
                    }
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
    
}

//#Preview {
//    OnBoarding3()
//}
