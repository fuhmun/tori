////
////  OpenAI.swift
////  tori
////
////  Created by Fahad Munawar on 5/14/24.
////
//
//import Foundation
//
//enum HTTPMethod: String {
//    case post = "POST"
//    case get = "GET"
//}
//
//
//class NewOpenAIService {
//    
//    static let shared = NewOpenAIService()
//    
//    private var profile = Profile()
//    
//    private init() {}
//    
//    private func generateAIRequest(httpMethod: HTTPMethod) throws -> URLRequest {
//        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
//            throw URLError(.badURL)
//        }
//        
//        var urlRequest = URLRequest(url: url)
//        
//        //Method
//        urlRequest.httpMethod = httpMethod.rawValue
//        
//        //Header
//        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.addValue("Bearer \(Constants.OpenAIKey)", forHTTPHeaderField: "Authorization")
//        //Body
//        //system message being sent to chatgpt before
//        let systemMessage = GPTMessage(role: "system", content: "I want you to be my concierge. I want you to generate me an activity to do based on information about me. Location: Detroit, Diet: \(Preferences().$diet), Price limit: \(Preferences().priceLimit), Distance: \(Preferences().distanceLimit), Drinker: \(Preferences().drinker), Smoker: \(Preferences().smoker). Generate me the name ofone activity to do that aligns with my preferences. Only the name of the place, no extra words. For example: Taco Bell")
//        let likedActivities = GPTFunctionProperty(type: "string", description: "The liked activities are \(profile.likes).")
//        let suggestion = GPTFunctionProperty(type: "string", description: "The name of the recommended suggestion for me.")
//        let description = GPTFunctionProperty(type: "string", description: "Here is a short detailed description of the activity. It should be 15 words or less and not be the same as the name of the activity.")
//
//        let params: [String: GPTFunctionProperty] = [
//            "likedActivities": likedActivities,
//            "suggestion": suggestion,
//            "description": description
//        ]
//        
//        let functionParam = GPTFunctionParam(type: "object", properties: params, required: ["likedActivities", "suggestion", "description"])
//        let function = GPTFunction(name: "get_suggestion", description: "Get the suggestion based on given information", parameters: functionParam)
//        let payload = GPTChatPayload(model: "gpt-3.5-turbo", messages: [systemMessage], functions: [function])
//        
//        let jsonData = try JSONEncoder().encode(payload)
//        
//        urlRequest.httpBody = jsonData
//        return urlRequest
//    }
//    
//    func sendPromptToChatGPT() async throws -> (SuggestionResponse) {
//        let urlRequest = try generateAIRequest(httpMethod: .post)
//        
//        let (data, _) = try await URLSession.shared.data(for: urlRequest)
//        
//        let gptResponse = try JSONDecoder().decode(GPTResponse.self, from: data)
//        let args = gptResponse.choices[0].message.functionCall.arguments
//        guard let argData = args.data(using: .utf8) else {
//            throw URLError(.badURL)
//        }
//        let response = try JSONDecoder().decode(SuggestionResponse.self, from: argData)
//        
//        return (response)
//        
//    }
//}
//
////Encoding
//
//struct GPTChatPayload: Encodable {
//    let model: String
//    let messages: [GPTMessage]
//    let functions: [GPTFunction]
//}
//struct GPTMessage: Encodable {
//    let role: String
//    let content: String
//}
//
//struct GPTFunction: Encodable {
//    let name: String
//    let description: String
//    let parameters: GPTFunctionParam
//}
//
//struct GPTFunctionParam: Encodable {
//    let type: String
//    let properties: [String: GPTFunctionProperty]?
//    let required: [String]?
//}
//
//struct GPTFunctionProperty: Encodable {
//    let type: String
//    let description: String
//}
//
////Decoding
//
//struct GPTResponse: Decodable {
//    let choices: [GPTCompletion]
//}
//
//struct GPTCompletion: Decodable {
//    let message: GPTResponseMessage
//}
//
//struct GPTResponseMessage: Decodable {
//    let functionCall: GPTFunctionCall
//    
//    enum CodingKeys: String, CodingKey {
//        case functionCall = "function_call"
//    }
//}
//
//struct GPTFunctionCall: Decodable {
//    let name: String
//    let arguments: String
//}
//
//struct SuggestionResponse: Decodable {
//    let name: String
//    let description: String
//}
//
//class Suggestion {
//    var name: String
//    var description: String
//    
//    init(name: String = "", description: String = "") {
//        self.name = name
//        self.description = description
//    }
//}
