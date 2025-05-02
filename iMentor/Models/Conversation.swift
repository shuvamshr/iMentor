//
//  Conversation.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 2/5/2025.
//

import SwiftUI
import SwiftData


@Model
class Conversation {
    var name: String
    var messages: [Message]
    
    init(name: String, messages: [Message]) {
        self.name = name
        self.messages = messages
    }
}

@Model
class Message {
    var author: Author
    var content: String
    var timestamp: Date = Date.now
    
    var message: Message?
    
    init(author: Author, content: String) {
        self.author = author
        self.content = content
    }
}

enum Author: String, Codable {
    case user = "User"
    case mentor = "Mentor"
}
