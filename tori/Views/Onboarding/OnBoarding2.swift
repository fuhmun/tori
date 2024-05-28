//
//  OnBoarding2.swift
//  tori
//
//  Created by Fahad Munawar on 5/23/24.
//

import SwiftUI

struct DietOption {
    var name: String
    var selected: Bool
}

struct OnBoarding2: View {
    @State var geometry: GeometryProxy
    let indexRectangle: Int = 1
    
    @State var diets: [[DietOption]] = [
        [DietOption(name: "Vegan", selected: false), DietOption(name: "Vegetarian", selected: false)],
        [DietOption(name: "Gluten Free", selected: false), DietOption(name: "Pescetarian", selected: false)],
        [DietOption(name: "Carnivore", selected: false), DietOption(name: "Halal", selected: false)]
    ]
    
    var body: some View {
        //For the tab index at the top
        //        GeometryReader { geometry in
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
            Text("Dietary preferences?")
                .font(.system(.title, design: .serif))
                .font(.title)
                .foregroundColor(.black)
                .padding(.all)
            
            ForEach(0..<diets.count, id: \.self) { rowIndex in
                HStack (spacing: 20) {
                    ForEach(0..<diets[rowIndex].count, id: \.self) { columnIndex in
                        Button(action: {
                            diets[rowIndex][columnIndex].selected.toggle()
                        }) {
                            Text(diets[rowIndex][columnIndex].name)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 25)
                                    .fill(diets[rowIndex][columnIndex].selected ? Color.blue : Color.gray))
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
        //Flattens two dimensional array and creates a new array of strings (names)
        let selectedDiets = diets.flatMap { $0 }
            .filter { $0.selected }
            .map { $0.name }
    }
}


//#Preview {
//    OnBoarding2()
//}
