//
//  OpenAIView.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import SwiftUI

struct OpenAIView: View {
    @ObservedObject var profile: Profile
    @ObservedObject var viewModel = OpenAIViewModel()
    var body: some View {
        VStack {
            HStack {
                Button(
                    action: {
                        Task {
                            sendMessage()
                        }
                    },
                       label: {
                    Text("Send")
                })
            }
        }
        .padding()
    }
    func sendMessage() {
        let message = "Here are details of our user: Diet: \(profile.preferences.diet), Price limit: \(profile.preferences.priceLimit), Max distance to travel: \(profile.preferences.distanceLimit), Drinker: \(profile.preferences.drinker), Smoker: \(profile.preferences.smoker), Favorite places: \(profile.preferences.favoriteAreas), Liked activities: \(profile.likes), Disliked activities: \(profile.dislikes)"
        Task {
            let response = await viewModel.sendMessage(userMessage: message)
            print("Recieved response: \(response)")
        }
    }
}

#Preview {
    OpenAIView(profile: Profile(username: "Fahad", preferences: Preferences()))
}
