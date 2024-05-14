//
//  OpenAIViewModel.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation

extension OpenAIView {
    class OpenAIViewModel: ObservableObject {
        
        @Published var messages: [Message] = [Message(id: UUID(), role: .system, content: "You will be given a list of my preferences, such as my likes and dislikes and where I never want to go again. You will be my concierge and give me one suggestion, based on: my location and how far I am willing to drive, my likes and dislikes, the money I am willing to spend, and don't suggest me these places: (**Array of places I never want to go again**) Give me only the name of the place, no extra words.", createdAt: Date())]
        @Published var currentInput: String = ""
        
        private let openAIService = OpenAIService()
        
        func sendMessage() {
            let newMessage = Message(id: UUID(), role: .user, content: currentInput, createdAt: Date())
            messages.append(newMessage)
            currentInput = ""
            
            Task {
                let response = await openAIService.sendMesaage(message: messages)
                guard let recievedOpenAIMessage = response?.choices.first?.message else {
                    print("Had no recieved")
                    return
                }
                let recievedMessage = Message(id: UUID(), role: recievedOpenAIMessage.role, content: recievedOpenAIMessage.content, createdAt: Date())
                await MainActor.run {
                    messages.append(recievedMessage)

                }
            }
        }
    }
}

struct Message: Decodable {
    let id: UUID
    let role: SenderRole
    let content: String
    let createdAt: Date
}
