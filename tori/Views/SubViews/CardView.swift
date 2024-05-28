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
import SwiftData

struct CardView: View {
    
    var geoProx : GeometryProxy
    var activityCards: Activity
    @ObservedObject var randomActivity: YelpAPI
    var activityList: RandomCategory
    
    @State private var cardFlipped: Bool = false
    @State private var dragOffset: CGSize = CGSize.zero
    @State private var colorOverlay: Color = .white.opacity(0.2)
    @State private var cardOpacity: Double = 1.0
    //    @State var frontCardIndex: Int
    var removal: (( )-> Void)? = nil
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    if !cardFlipped {
                        FrontBigCardView(geoProx: geoProx, activityCards: activityCards, randomActivity: randomActivity)
                    } else {
                        BackBigCardView(geoProx: geoProx, activityCards: activityCards, randomActivity: randomActivity)
                    }
                }
                .frame(width: geoProx.size.width/1.25, height: geoProx.size.height/1.25)
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
            colorOverlay = .white.opacity(0.20)
        }
    }
    
}

//#Preview {
//    CardView()
//}
