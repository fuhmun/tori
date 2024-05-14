//
//  DiscoverView.swift
//  DreamTeam
//
//  Created by Alexander Washington on 5/11/24.
//

import Foundation
import SwiftUI
import CoreLocation
import SDWebImageSwiftUI

struct DiscoverView: View {
    
    @State private var randomActivity = YelpAPI()
    @State private var activitesLoaded: Bool = false
    
    var body: some View {
        GeometryReader{ geoProx in
            ZStack {
                Color(.clear)
                    .ignoresSafeArea()
                VStack {
                    
                    if !activitesLoaded {
                        
                        Text("Failed to load activities")
                            .padding()
                            .frame(maxWidth: geoProx.size.width/1.2, maxHeight: geoProx.size.height/1.2)
                            .background(.white)
                            .clipShape(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
                            )
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 10)
                        
                    } else {
                        ZStack {
                            ForEach(randomActivity.foundActivities, id: \.self) { card in
                                CardView(geoProx: geoProx, activityCards: card)
                            }
                        }
                    }
                }
            }
            .onAppear {
                if randomActivity.foundActivities.isEmpty {
                    Task {
                        await randomActivity.retrieveBusiness(cat: ["axethrowing"], lim: 5, sort: "distance", rad: 40000)
                    }
                }
            }
            .onReceive(randomActivity.$foundActivities) { newActivities in
                if !newActivities.isEmpty {
                    activitesLoaded = true
                    print("New activities retrieved: \(newActivities.count)")
                } else {
                    activitesLoaded = false
                    print("No activities found.")
                }
            }
        }
    }
}

#Preview {
    DiscoverView()
}
