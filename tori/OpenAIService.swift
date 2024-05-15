//
//  OpenAIService.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation
import Alamofire

class OpenAIService {
    private let endpointURL = "https://api.openai.com/v1/chat/completions"
    func sendMesaage(message: [Message]) async -> OpenAIChatResponse? {
        let openAIMessages = message.map({OpenAIChatMessage(role: $0.role, content: $0.content)})
        let body = OpenAIChatBody.init(model: "gpt-3.5-turbo", messages: openAIMessages)
        
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(Constants.OpenAIKey)"
        ]
        
        return try? await AF.request(endpointURL, method: .post, parameters: body, encoder: .json, headers: headers).serializingDecodable(OpenAIChatResponse.self).value
    }
}

struct OpenAIChatBody: Encodable {
    let model: String
    let messages: [OpenAIChatMessage]
}

struct OpenAIChatMessage: Codable {
    let role: SenderRole
    let content: String
}

enum SenderRole: String, Codable {
    case user
    case system
    case assistant
}

struct OpenAIChatResponse: Decodable {
    let choices: [OpenAIChatChoice]
}

struct OpenAIChatChoice: Decodable {
    let message: OpenAIChatMessage
}

