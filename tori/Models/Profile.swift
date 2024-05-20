//
//  Profile.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import CoreLocation
import SwiftData

class Profile: ObservableObject {
    @Published var preferences = Preferences()
    @Published var likes: [Activity] = []
    @Published var dislikes: [Activity] = []
    @Published var favorites: [Activity] = []
    @Published var mustTrys: [Activity] = []
    @Published var tried: [Activity] = []
    @Published var neverAgain: [String] = []

    init(preferences: Preferences = Preferences()) {
        self.preferences = preferences
    }

    func updateUserPreferences(newPreferences: Preferences) {
        // update user preferences based on newPreferences
        self.preferences = newPreferences
    }

    func addFavorite(place: Activity) {   // array of yelp class that will be used when passing in to favs
        if favorites.contains(place) {
            favorites.removeAll{ $0 == place }  //removes from fav
        }
        else { favorites.append(place) }
    }

    func removeFavorite(place: Activity) {
        if let index = favorites.firstIndex(of: place) {
            favorites.remove(at: index)
        }
    }
}


class Preferences: ObservableObject {
    @Published var diet: Dietary = .everything  //default
    @Published var priceLimit: String = "$10"  //default
    @Published var distanceLimit: String = "10 miles"  //default
    @Published var favoriteAreas: [String] = ["Taco Bell", "McDonalds"]
    @Published var drinker: Bool = false
    @Published var smoker: Bool = false
}

enum Dietary: String {
    case everything = "No food restrictions"
    case carnivore = "Carnivore"
    case vegetarian = "Vegetarian"
    case vegan = "Vegan"
    case halal = "Halal"
    case pescetarian = "Pescetarian"
}

struct User {
    var topCategories: [yelpCategories] = [.activeLife, .food, .nightLife, .shopping, .restaurants]    //append the categories they selected from onboarding
}
