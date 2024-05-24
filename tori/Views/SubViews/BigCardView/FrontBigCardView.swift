//
//  FrontCardView.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI
import CoreLocation
import SDWebImageSwiftUI


struct FrontBigCardView: View {
    
    var geoProx : GeometryProxy
    var activityCards: Activity
    @ObservedObject var randomActivity: YelpAPI
    
    var body: some View {
        
        if let imageUrl = activityCards.image_url {
            AnimatedImage(url: URL(string: imageUrl))
                .resizable()
                .frame(width: geoProx.size.width/1.2, height: geoProx.size.height/1.2)
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .top, endPoint: .center)
                )
                .overlay(
                    VStack(alignment: .leading) {
                        if let name = activityCards.name {
                            Text(name)
                                .font(.title)
                        }
                        if let city = activityCards.location?.city, let state = activityCards.location?.state {
                            Text("\(city), \(state)")
                        }
                        if let distance = activityCards.distance {
                            let miles = distance * 0.000621371
                            Text(String(format: "%.2f mi", miles))
                        }
                    }
                        .padding(geoProx.size.height/50)
                        .foregroundStyle(.white)
                    ,alignment: .topLeading
                )
        }
    }
}

//#Preview {
//    FrontBigCardView()
//}
