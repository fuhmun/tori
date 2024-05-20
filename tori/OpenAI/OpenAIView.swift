//
//  OpenAIView.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import SwiftUI

struct OpenAIView: View {
    @ObservedObject var profile: Profile
    @State private var generateSuggestion: Suggestion = Suggestion(name: "", description: "")
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
        Task {
            do {
                generateSuggestion = Suggestion(name: "", description: "")
                let result = try await NewOpenAIService.shared.sendPromptToChatGPT()
                print(result)
                generateSuggestion = Suggestion(name: result.name, description: result.description)
            } catch {
                print(error.localizedDescription)
                generateSuggestion = Suggestion(name: "", description: "")
            }
        }
    }
}

#Preview {
    OpenAIView(profile: Profile(preferences: Preferences()))
}
