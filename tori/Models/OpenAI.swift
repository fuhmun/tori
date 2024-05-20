//
//  OpenAI.swift
//  tori
//
//  Created by Fahad Munawar on 5/14/24.
//

import Foundation

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
}

class NewOpenAIService {
    
    static let shared = NewOpenAIService()
    
    private init() {}
    
    private func generateAIRequest(httpMethod: HTTPMethod, message: String) throws -> URLRequest {
        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
            throw URLError(.badURL)
        }
        
        var urlRequest = URLRequest(url: url)
        
        //Method
        urlRequest.httpMethod = httpMethod.rawValue
        
        //Header
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("Bearer \(Constants.OpenAIKey)", forHTTPHeaderField: "Authorization")
        //Body
        //system message being sent to chatgpt before
        let systemMessage = GPTMessage(role: "system", content: "I want you to be my concierge. I want you to generate m")
        let userMessage = GPTMessage(role: "user", content: message)
        let ingredients = GPTFunctionProperty(type: "string", description: "The available ingredients are \(message). Give me the ingredients seperated by a whitespace, NO commas.")
        let recipe = GPTFunctionProperty(type: "string", description: "The recommended recipe to make.")
        let description = GPTFunctionProperty(type: "string", description: "Here is a short detailed description of this recipe. It should be 15 words or less and not be the same as the recipe name.")
        let instructions = GPTFunctionProperty(type: "string", description: "Here are detailed instructions for this recipe that are numbered for each step. Each step should start on a new line and have a title for each step.")
        let timeToCook = GPTFunctionProperty(type: "string", description: "Here is how long it takes to cook this recipe in minutes and give the number only. For example: 20")

        let params: [String: GPTFunctionProperty] = [
            "ingredients": ingredients,
            "instructions": instructions,
            "recipe": recipe,
            "timeToCook": timeToCook,
            "description": description
        ]
        
        let functionParam = GPTFunctionParam(type: "object", properties: params, required: ["ingredients", "recipe", "instructions", "timeToCook", "description"])
        let function = GPTFunction(name: "get_recipe", description: "Get the recipe with the given ingredients", parameters: functionParam)
        let payload = GPTChatPayload(model: "gpt-3.5-turbo-0613", messages: [systemMessage, userMessage], functions: [function])
        
        let jsonData = try JSONEncoder().encode(payload)
        
        urlRequest.httpBody = jsonData
        return urlRequest
    }
    
    func sendPromptToChatGPT(message: String) async throws -> (RecipeResponse) {
        let urlRequest = try generateAIRequest(httpMethod: .post, message: message)
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let gptResponse = try JSONDecoder().decode(GPTResponse.self, from: data)
        let args = gptResponse.choices[0].message.functionCall.arguments
        guard let argData = args.data(using: .utf8) else {
            throw URLError(.badURL)
        }
        let response = try JSONDecoder().decode(RecipeResponse.self, from: argData)
        
        return (response)
        
    }
}

//Encoding

struct GPTChatPayload: Encodable {
    let model: String
    let messages: [GPTMessage]
    let functions: [GPTFunction]
}
struct GPTMessage: Encodable {
    let role: String
    let content: String
}

struct GPTFunction: Encodable {
    let name: String
    let description: String
    let parameters: GPTFunctionParam
}

struct GPTFunctionParam: Encodable {
    let type: String
    let properties: [String: GPTFunctionProperty]?
    let required: [String]?
}

struct GPTFunctionProperty: Encodable {
    let type: String
    let description: String
}

//Decoding

struct GPTResponse: Decodable {
    let choices: [GPTCompletion]
}

struct GPTCompletion: Decodable {
    let message: GPTResponseMessage
}

struct GPTResponseMessage: Decodable {
    let functionCall: GPTFunctionCall
    
    enum CodingKeys: String, CodingKey {
        case functionCall = "function_call"
    }
}

struct GPTFunctionCall: Decodable {
    let name: String
    let arguments: String
}

struct RecipeResponse: Decodable {
    let ingredients: String
    let recipe: String
    let instructions: String
    let timeToCook: String
    let description: String
}

