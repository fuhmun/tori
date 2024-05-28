//
//  cardView.swift
//  Tori pages
//
//  Created by Leon Singleton on 5/26/24.
//
import SwiftUI

struct SmallCardView: View {
    var restaurantName: String
    var description: String
    var isExpanded: Bool

    var body: some View {
        VStack {
            if isExpanded {
                Text(restaurantName)
                    .font(.largeTitle)
                    .padding()
                Text(description)
                    .padding()
                Spacer()
            } else {
                Text(restaurantName)
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .frame(width: isExpanded ? UIScreen.main.bounds.width : 350,
               height: isExpanded ? 750 : 200)
        .background(isExpanded ? Color.black : Color.blue)
        .cornerRadius(isExpanded ? 0 : 10)
        .shadow(radius: isExpanded ? 0 : 10)
        .animation(.spring())
    }
}



//#Preview {
//    SmallCardView()
//}
