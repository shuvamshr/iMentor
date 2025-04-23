//
//  ChatModel.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 23/4/2025.
//

import SwiftUI

enum ChatModel: String, CaseIterable, Identifiable {
    case chatGpt = "ChatGPT"
    case gemini = "Gemini"
    case llama = "Llama"
    
    var id: UUID {
        UUID()
    }
    
    var description: String {
        return self.rawValue
    }
}
