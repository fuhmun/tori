//
//  BubbleModel.swift
//  tori
//
//  Created by Leon Singleton on 5/30/24.
//


import SwiftUI
import Combine

struct Bubble: Identifiable {
    let id = UUID()
    var position: CGPoint
    var direction: CGSize
    var isPressed: Bool = false
    var color: Color = .blue
}
