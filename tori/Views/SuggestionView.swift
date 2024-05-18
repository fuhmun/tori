//
//  SuggestionView.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI

struct SuggestionView: View {
    var body: some View {
        GeometryReader { geoProx in
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                VStack {
                    Text("Tori")
                }
            }
        }
    }
}

#Preview {
    SuggestionView()
}


