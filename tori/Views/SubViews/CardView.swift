//
//  CardView.swift
//  DreamTeam
//
//  Created by Alexander Washington on 5/11/24.
//

import Foundation
import SwiftUI
import CoreLocation
import SDWebImageSwiftUI

struct CardView: View {
    
    var geoProx : GeometryProxy
    var activityCards: Activity
    @ObservedObject var randomActivity: YelpAPI
    var activityList: RandomCategory
    
    @State private var cardFlipped: Bool = false
    @State private var dragOffset: CGSize = CGSize.zero
    @State private var colorOverlay: Color = .white.opacity(0.25)
    @State private var cardOpacity: Double = 1.0
//    @State var frontCardIndex: Int
    var removal: (( )-> Void)? = nil
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    if !cardFlipped {
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
                    } else {
                        VStack {
                            Text("Details")
                        }
                        .rotation3DEffect(Angle(degrees: 180), axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    
                }
                .frame(width: geoProx.size.width/1.2, height: geoProx.size.height/1.2)
                .background(Color.white)
                .clipShape(
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
                )
                .opacity(cardOpacity)
                .shadow(color: colorOverlay, radius: 10)
                .rotation3DEffect(
                    cardFlipped ? Angle(degrees: 180) : .zero,
                    axis: (x: 0.0, y: -1.0, z: 0.0)
                )
                .animation(.default, value: cardFlipped)
                
            }
            .onTapGesture {
                cardFlipped.toggle()
            }
            .animation(.bouncy, value: dragOffset)
            .offset(x: dragOffset.width, y: dragOffset.height * 0.4)
            .rotationEffect(.degrees(Double(dragOffset.width / 40)))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        dragOffset = value.translation
                        withAnimation {
                            changeColor(width: dragOffset.width)
                        }
                    }
                    .onEnded { _ in
                        withAnimation {
                            swipeCard(width: dragOffset.width)
                            changeColor(width: dragOffset.width)
                        }
                    }
            )
            
        }
        
    }
    
    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            print("Disliked")
            dragOffset = CGSize(width: -500, height: 0)
            cardOpacity = 0

            removal?()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                dragOffset = .zero
                colorOverlay = .white.opacity(0.25)
                if cardFlipped {
                    cardFlipped.toggle()
                }
                cardOpacity = 1.0
            }
            
            if (randomActivity.foundActivities.count == 8)  {
                Task {
                    await randomActivity.retrieveBusiness(cat: [activityList.activities.randomElement() ?? "food"], lim: 4, sort: "distance", rad: 40000, list: activityList)
                }
            }
            
            if (randomActivity.foundActivities.count == 5)  {
                Task {
                    await randomActivity.retrieveBusiness(cat: [activityList.activities.randomElement() ?? "food"], lim: 4, sort: "distance", rad: 40000, list: activityList)
                }
            }
            
            if (randomActivity.foundActivities.count == 2)  {
                Task {
                    await randomActivity.retrieveBusiness(cat: [activityList.activities.randomElement() ?? "food"], lim: 4, sort: "distance", rad: 40000, list: activityList)
                }
            }
            
            if (randomActivity.foundActivities.count == 0)  {
                Task {
                    await randomActivity.retrieveBusiness(cat: [activityList.activities.randomElement() ?? "food"], lim: 4, sort: "distance", rad: 40000, list: activityList)
                }
            }
            
        case 150...500:
            print("Liked")
            dragOffset = CGSize(width: 500, height: 0)

            removal?()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                dragOffset = .zero
                colorOverlay = .white.opacity(0.25)
                if cardFlipped {
                    cardFlipped.toggle()
                }
                cardOpacity = 1.0
            }
            
            if (randomActivity.foundActivities.count == 8)  {
                Task {
                    await randomActivity.retrieveBusiness(cat: [activityList.activities.randomElement() ?? "food"], lim: 4, sort: "distance", rad: 40000, list: activityList)
                }
            }
            
            if (randomActivity.foundActivities.count == 5)  {
                Task {
                    await randomActivity.retrieveBusiness(cat: [activityList.activities.randomElement() ?? "food"], lim: 4, sort: "distance", rad: 40000, list: activityList)
                }
            }
            
            if (randomActivity.foundActivities.count == 2)  {
                Task {
                    await randomActivity.retrieveBusiness(cat: [activityList.activities.randomElement() ?? "food"], lim: 4, sort: "distance", rad: 40000, list: activityList)
                }
            }
            
            if (randomActivity.foundActivities.count == 0)  {
                Task {
                    await randomActivity.retrieveBusiness(cat: [activityList.activities.randomElement() ?? "food"], lim: 4, sort: "distance", rad: 40000, list: activityList)
                }
            }
            
        default:
            dragOffset = .zero
        }
    }
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            print("Disliking")
            colorOverlay = .red
        case 130...500:
            print("Liking")
            colorOverlay = .green
        default:
            colorOverlay = .white.opacity(0.25)
        }
    }
    
}

//#Preview {
//    CardView()
//}
