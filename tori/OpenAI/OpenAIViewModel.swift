//
//  OpenAIViewModel.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation

extension OpenAIView {
    class OpenAIViewModel: ObservableObject {
        
        @Published var messages: [Message] = [Message(id: UUID(), role: .system, content: "You will be given information of a users preferences, such as my likes and dislikes. You will be my concierge and give me three suggestions, based on: my location and how far I am willing to drive, my likes and dislikes, the money I am willing to spend. Give me only the name of the place, no extra words.")]
        
        private let openAIService = OpenAIService()
                
        func sendMessage(userMessage: String) async -> String {
                    let newMessage = Message(id: UUID(), role: .user, content: userMessage)
                    messages.append(newMessage)
                    
                    // Directly await the response from the OpenAI service
                    do {
                        let response = try await openAIService.sendMesaage(message: newMessage) // Correct method name usage
                        if let receivedOpenAIMessage = response?.choices.first?.message {
                            let receivedMessage = Message(id: UUID(), role: receivedOpenAIMessage.role, content: receivedOpenAIMessage.content)
                            await MainActor.run {
                                messages.append(receivedMessage)
                            }
                            return receivedMessage.content
                        } else {
                            return "No valid response received from OpenAI."
                        }
                    } catch {
                        print("Failed to send message: \(error)")
                        return "Error sending message: \(error.localizedDescription)"
                    }
                }
    }
}

struct Message: Decodable {
    let id: UUID
    let role: SenderRole
    let content: String
}
