//
//  CategoryIconView.swift
//  tori
//
//  Created by Fahad Munawar on 5/16/24.
//

import SwiftUI

struct CategoryIconView: View {
    @State var userCategories: [yelpCategories] = [.activeLife, .food, .arts, .nightLife, .localFlavor]
    var body: some View {
        VStack {
            HStack {
                ForEach(userCategories, id: \.self) { cat in
                    VStack {
                        Image(systemName: cat.icon)
                        Text(cat.rawValue)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(
                            cornerRadius: 15.0
                        ).foregroundStyle(.background)
                    )
                }
            }
        }
    }
}

#Preview {
        CategoryIconView()
}




//struct SearchView: some View {
//    @State var user: User
//    
//    var body: some View{
//        ForEach(user.top5){ category in
//            CategoryIconView(category: category)
//        }
//    }
//}
