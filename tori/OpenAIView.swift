//
//  OpenAIView.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import SwiftUI

struct OpenAIView: View {
    @ObservedObject var viewModel = OpenAIViewModel()
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
                    messageView(message: message)
                }
            }
            HStack {
                TextField("Enter a message...", text: $viewModel.currentInput)
                Button(
                    action:
                        viewModel.sendMessage,
                       label: {
                    Text("Send")
                })
            }
        }
        .padding()
    }
    func messageView(message: Message) -> some View {
        HStack {
            if message.role == .user { Spacer()}
            Text(message.content)
            if message.role == .assistant { Spacer()}
        }
    }
}

#Preview {
    OpenAIView()
}
