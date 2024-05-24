//
//  toriApp.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import SwiftUI
import CoreLocation
import SDWebImageSwiftUI
import SwiftData

@main
struct DreamTeamApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            SplashScreenView()
        }
        .modelContainer(for: [Profile.self,ActivityRoot.self,swiftActivity.self,swiftCategory.self,swiftCoordinates.self,swiftLocation.self,swiftAttributes.self,swiftRegion.self,YelpCategory.self,SubCategory.self,CategoryManager.self])
    }
}
