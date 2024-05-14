//
//  Profile.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import CoreLocation

class Profile {
    let ID: Int
    let username: String
    var preferences = Preferences()
    var likes: [String] = []
    var dislikes: [String] = []
    var favorites: [String] = []    // need to change the type alias for favs

    init(ID: Int, username: String, preferences: Preferences = Preferences()) {
        self.ID = ID
        self.username = username
        self.preferences = preferences
    }

    func updateUserPreferences(newPreferences: Preferences) {
        // update user preferences based on newPreferences
        self.preferences = newPreferences
    }

    func addFavorite(place: String) {   // array of yelp class that will be used when passing in to favs
        favorites.append(place)
    }

    func removeFavorite(place: String) {
        if let index = favorites.firstIndex(of: place) {
            favorites.remove(at: index)
        }
    }
}

struct Preferences {
    var diet: Dietary = .everything
    var priceLimit: Int = 3 // default
    var distanceLimit: Int = 10 // default
    var travel: Bool = false
    var favoriteAreas: [String] = []
    var drinker: Bool = false
    var smoker: Bool = false
}

enum Dietary {
    case everything
    case carnivore
    case vegetarian
    case vegan
    case halal
    case pescetarian
}

