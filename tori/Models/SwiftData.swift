//
//  SwiftData.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftData

@Model
class ActivityRoot: Identifiable {
    var id = UUID()
    var activity: [swiftActivity]
    
    init(id: UUID = UUID(), activity: [swiftActivity] = []) {
        self.id = id
        self.activity = activity
    }
}

@Model
class swiftActivity {
    
    var id: String?
    var alias: String?
    var name: String?
    var image_url: String?
    var is_closed: Bool?
    var url: String?
    var review_count: Int?
    var categories: [swiftCategory]?
    var rating: Double?
    var coordinates: swiftCoordinates?
    var transactions: [String]?
    var price: String?
    var location: swiftLocation?
    var phone: String?
    var displayPhone: String?
    var distance: Double?
    var attributes: swiftAttributes?
    
    init(id: String? = nil, alias: String? = nil, name: String? = nil, image_url: String? = nil, is_closed: Bool? = nil, url: String? = nil, review_count: Int? = nil, categories: [swiftCategory]? = nil, rating: Double? = nil, coordinates: swiftCoordinates? = nil, transactions: [String]? = nil, price: String? = nil, location: swiftLocation? = nil, phone: String? = nil, displayPhone: String? = nil, distance: Double? = nil, attributes: swiftAttributes? = nil) {
        self.id = id
        self.alias = alias
        self.name = name
        self.image_url = image_url
        self.is_closed = is_closed
        self.url = url
        self.review_count = review_count
        self.categories = categories
        self.rating = rating
        self.coordinates = coordinates
        self.transactions = transactions
        self.price = price
        self.location = location
        self.phone = phone
        self.displayPhone = displayPhone
        self.distance = distance
        self.attributes = attributes
    }
}

@Model
class swiftCategory {
    var alias: String?
    var title: String?
    
    init(alias: String? = nil, title: String? = nil) {
        self.alias = alias
        self.title = title
    }
}

@Model
class swiftCoordinates {
    var latitude: Double?
    var longitude: Double?
    
    init(latitude: Double? = nil, longitude: Double? = nil) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

@Model
class swiftLocation {
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var zipCode: String?
    var country: String?
    var state: String?
    var display_address: [String]?
    
    init(address1: String? = nil, address2: String? = nil, address3: String? = nil, city: String? = nil, zipCode: String? = nil, country: String? = nil, state: String? = nil, display_address: [String]? = nil) {
        self.address1 = address1
        self.address2 = address2
        self.address3 = address3
        self.city = city
        self.zipCode = zipCode
        self.country = country
        self.state = state
        self.display_address = display_address
    }
}

@Model
class swiftAttributes {
    var businessTempClosed: Bool?
    var waitlistReservation: Bool?
    
    init(businessTempClosed: Bool? = nil, waitlistReservation: Bool? = nil) {
        self.businessTempClosed = businessTempClosed
        self.waitlistReservation = waitlistReservation
    }
}

@Model
class swiftRegion {
    var center: swiftCoordinates?
    
    init(center: swiftCoordinates? = nil) {
        self.center = center
    }
}
