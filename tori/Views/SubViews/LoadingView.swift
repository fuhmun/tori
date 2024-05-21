//
//  LoadingView.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Image("Background")
                .ignoresSafeArea()
            VStack {
                Image("Pin")
                Text("Loading your personalized suggestions…")
                    .font(.system(.subheadline, design: .serif))
                    .foregroundStyle(Color.white)
            }
        }
    }
}

#Preview {
    LoadingView()
}
