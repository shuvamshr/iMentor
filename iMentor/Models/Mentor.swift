//
//  Mentor.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI
import SwiftData

@Model
class Mentor {
    var name: String
    var department: Department
    var chatModel: ChatModel
    var image: String
    var conversations: [Conversation] = []
    
    init(name: String, department: Department, chatModel: ChatModel, image: String = "default") {
        self.name = name
        self.department = department
        self.chatModel = chatModel
        self.image = image
    }
}


