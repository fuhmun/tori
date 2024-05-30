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
                    .scaledToFit()
                    .frame(width: geoProx.size.width)
                    .ignoresSafeArea()
                VStack {
                    SearchBarView(geoProx: geoProx)
                        .padding()
                    FilterView()
                        .frame(width: geoProx.size.width*0.85)
                    Spacer(minLength: geoProx.size.height*0.03)
                    ScrollView {
                        StackedCardView(geoProx: geoProx)
                    }
                }
                .foregroundStyle(.white)
                
                // alex sucks at coding
            }
        }
    }
}

#Preview {
    SuggestionView()
}


