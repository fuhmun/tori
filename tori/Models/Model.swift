////
////  Model.swift
////  tori
////
////  Created by Fahad Munawar on 5/14/24.
////

import Foundation
import SwiftUI

struct CustomColor {
    static let grayBG = Color("grayBG")
    static let grayUI = UIColor(grayBG)
}

//func likedSuggestion(profile: Profile, liked: Activity) {
//    if profile.likes.contains(liked) {
//        profile.likes.removeAll{ $0 == liked }
//    } else { profile.likes.append(liked)}
//}
//
//func dislikedSuggestions(profile: Profile, disliked: Activity) {
//    if profile.dislikes.contains(disliked) {
//        profile.dislikes.removeAll{ $0 == disliked }
//    } else { profile.dislikes.append(disliked)}
//}
//
//func mustTry(profile: Profile, must: Activity) {
//    if profile.mustTrys.contains(must) {
//        profile.mustTrys.removeAll{ $0 == must }
//    } else { profile.mustTrys.append(must)}
//}
//
//func searchBar() -> String {
//    guard let userInput = readLine() else {
//        print("Invaid")
//        return ""
//    }
//    return userInput
//}
//
//func declineSuggestion(profile: Profile, declined: Activity) {
//    profile.neverAgain.append(declined.name!)
//}
//
//func triedSuggestion(profile: Profile, tried: Activity) {
//    if profile.tried.contains(tried) {
//        profile.tried.removeAll{ $0 == tried }
//    } else { profile.tried.append(tried)}
//}
//
////func findSuggestion(yelpCat: yelpCategories, sub: String) {
////    if var subcategories =
////}
