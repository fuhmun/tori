//
//  FrontSmallCardView.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI

struct FrontSmallCardView: View {
    
    var geoProx: GeometryProxy
    var test: Tag = Tag(name: "McDonalds", price: "$")
    
    var body: some View {
        VStack {
            TagListView(tags: [test], geoProx: geoProx)
                .padding(.leading, geoProx.size.width*0.12)
            Spacer()
        }
    }
}

//#Preview {
//    FrontSmallCardView()
//}
