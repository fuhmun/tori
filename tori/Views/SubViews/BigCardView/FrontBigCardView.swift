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
                .frame(width: geoProx.size.width/1.25, height: geoProx.size.height/1.25)
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .top, endPoint: .center)
                )
                .overlay(
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                if let name = activityCards.name {
                                    Text(name)
                                        .font(.title3)
                                }
                                if let city = activityCards.location?.city, let state = activityCards.location?.state {
                                    Text("\(city), \(state)")
                                }
                                if let distance = activityCards.distance {
                                    let miles = distance * 0.000621371
                                    Text(String(format: "%.2f mi", miles))
                                }
                            }
                            
                            .foregroundStyle(.white)
                            Spacer()
                            Button {
                                
                            } label: {
                                Image(systemName: "heart")
                                    .foregroundStyle(.white)
                            }
                        }
                        .padding(geoProx.size.height/30)
                        Spacer()
                        HStack {
                            Button {
                                
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(.accent)
                                        .frame(width: geoProx.size.width*0.15)
                                    Image(systemName: "xmark")
                                        .font(.largeTitle)
                                        .foregroundStyle(.white)
                                }
                            }
                            Spacer()
                            Button {
                                
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(.accent)
                                        .frame(width: geoProx.size.width*0.15)
                                    Image(systemName: "checkmark")
                                        .font(.largeTitle)
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                        .padding(geoProx.size.height/30)
                    }
                    ,alignment: .topLeading
                    
                    
                )
        }
    }
}

//#Preview {
//    FrontBigCardView()
//}
