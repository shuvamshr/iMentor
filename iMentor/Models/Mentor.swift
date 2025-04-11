//
//  Mentor.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI


struct Mentor: Identifiable {
    var id: UUID = UUID()
    var name: String
    var department: String
    var chatModel: ChatModel
    var image: String = "default"
}

enum Department {
    case design, development, research
}

enum ChatModel {
    case chatGpt, gemini, llama
}
