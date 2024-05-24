//
//  ProfileView.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI
import CoreLocation
import SDWebImageSwiftUI
import SwiftData

struct ProfileView: View {
    
    var body: some View {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                VStack {
                    Text("Tori")
                }
            }
            .ignoresSafeArea()
    }
}

#Preview {
    ProfileView()
}
