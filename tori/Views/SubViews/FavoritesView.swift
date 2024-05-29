//
//  ContentView.swift
//  Tori pages
//
//  Created by Leon Singleton on 5/26/24.
//

import SwiftUI

struct FavoritesView: View {
    @State private var selectedCardIndex: Int? = nil

    @State private var mustTry = [
        (name: "Activity A", description: "Delicious food A"),
        (name: "Activity B", description: "Delicious food B"),
        (name: "Activity C", description: "Delicious food C"), (name: "Activity D", description: "Delicious food C")
    ]

    var body: some View {
        ZStack {
            ForEach(0..<mustTry.count, id: \.self) { index in
                SmallCardView(restaurantName: mustTry[index].name,
                         description: mustTry[index].description,
                         isExpanded: self.selectedCardIndex == index)
                    .offset(y: self.selectedCardIndex == index ? 0 : CGFloat(index) * 60)
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



#Preview {
    FavoritesView()
}
