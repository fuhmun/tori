//
//  ProfileView.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI

struct ProfileView: View {
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
    ProfileView()
}
