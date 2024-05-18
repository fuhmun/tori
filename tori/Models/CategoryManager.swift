//
//  CategoryManager.swift
//  tori
//
//  Created by Fahad Munawar on 5/15/24.
//

import Foundation
import SwiftUI

var categoryCount : [yelpCategories : Int ] {
    [
        .coffee: 0,
        .cafe: 0,
        .tea: 0,
        
    ]
}

enum yelpCategories: String {
    case activeLife = "Active"
    case arts = "Leisure"
    case beauty = "Relax"
    case food = "Food"
    case nightLife = "Night"
    case shopping = "Shop"
    case restaurants = "Restaurants"
    case localFlavor = "Local"
    
    var background: Color {
        switch self {
        default:
                .gray
        }
    }
    
    var subCategories: [String] {
        switch self {
        case .activeLife:
            ["Archery", "Airsoft"]
        case .arts:
            ["Archery", "Airsoft"]
        case .beauty:
            ["Archery", "Airsoft"]
        case .food:
            ["Chinese", "Indian"]
        case .nightLife:
            ["Archery", "Airsoft"]
        case .shopping:
            ["Archery", "Airsoft"]
        case .restaurants:
            ["Archery", "Airsoft"]
        case .localFlavor:
            ["Archery", "Airsoft"]
        }
    }
    
    var icon: String {
        switch self {
        case .activeLife:
            "figure.cooldown"
        case .arts:
            "pencil.and.scribble"
        case .beauty:
            "bubbles.and.sparkles.fill"
        case .food:
            "fork.knife"
        case .nightLife:
            "music.quarternote.3"
        case .shopping:
            "storefront"
        default:
            "figure"
        }
    }
}

