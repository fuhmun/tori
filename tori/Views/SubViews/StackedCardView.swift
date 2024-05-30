//
//  StackedCardView.swift
//  tori
//
//  Created by Alexander Washington on 5/28/24.
//

import SwiftUI

struct StackedCardView: View {

    @State private var selectedCardIndex: Int? = nil
    
    @State private var Test = [
        (name: "Activity A", description: "Delicious food A"),
        (name: "Activity B", description: "Delicious food B"),
        (name: "Activity C", description: "Delicious food C")
    ]
    
    var geoProx: GeometryProxy
    
    var body: some View {
        ZStack {
            ForEach(0..<Test.count, id: \.self) { index in
                SmallCardView(restaurantName: Test[index].name,
                         description: Test[index].description,
                              isExpanded: self.selectedCardIndex == index, geoProx: geoProx)
                    .offset(y: self.selectedCardIndex == index ? 0 : CGFloat(index) * 195)
                    .rotation3DEffect(
                        .degrees(self.selectedCardIndex == index ? 180 : 0),
                        axis: (x: 0, y: 2, z: 0)
                    )
                    .animation(.spring(), value: self.selectedCardIndex == index)
                    .onTapGesture {
                        withAnimation {
                            if self.selectedCardIndex == index {
                                self.selectedCardIndex = nil
                            } else {
                                self.selectedCardIndex = index
                            }
                        }
                    }
                    .zIndex(self.selectedCardIndex == index ? 1 : 0)
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

//#Preview {
//    StackedCardView()
//}
