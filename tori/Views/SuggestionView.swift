//
//  SuggestionView.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI
import CoreLocation
import SDWebImageSwiftUI
import SwiftData

struct SuggestionView: View {
    
    
    
    var body: some View {
        GeometryReader { geoProx in
            ZStack {
                Image("SuggestionBG")
                    .resizable()
//                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geoProx.size.width, height: geoProx.size.height)
                    .ignoresSafeArea()
                VStack {
                        
                            SearchBarView(geoProx: geoProx)
                            FilterView(geoProx: geoProx)
                        
                }
                .foregroundStyle(.white)
                // alex sucks at coding
            }
//            .ignoresSafeArea()
        }
    }
}

#Preview {
    SuggestionView()
}


