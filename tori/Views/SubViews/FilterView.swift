//
//  FilterView.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI
import SwiftData

struct FilterView: View {
    
    @State var isSelected: Bool = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 27) {
            ForEach(yelpCategories.allCases, id: \.self) { category in
                    Button {
                        isSelected.toggle()
                    } label: {
                        VStack {
                            Image(systemName: category.icon)
                                .foregroundStyle(isSelected ? .accent : .white)
                            Text(category.rawValue)
                                .font(.caption)
                        }
                    }
//                    .padding(.horizontal, 12)
                }
            }
        }
    }
}

//#Preview {
//    FilterView()
//}
