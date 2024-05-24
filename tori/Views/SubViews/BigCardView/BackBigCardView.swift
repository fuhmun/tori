//
//  BackCardView.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI
import SwiftData

struct BackBigCardView: View {
    
    var geoProx : GeometryProxy
    var activityCards: Activity
    @ObservedObject var randomActivity: YelpAPI
    
    var body: some View {
        VStack {
            Text("Details")
        }
        .rotation3DEffect(Angle(degrees: 180), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}

//#Preview {
//    BackBigCardView()
//}
