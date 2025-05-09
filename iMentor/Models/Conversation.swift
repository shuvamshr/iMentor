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
    var mentor: Mentor
    var messages: [Message]
    
    init(mentor: Mentor, messages: [Message]) {
        self.mentor = mentor
        self.messages = messages
    }
}

@Model
class Message {
    var author: Author
    var content: String
    var timestamp: Date = Date.now
    
    var conversation: Conversation?
    
    init(author: Author, content: String) {
        self.author = author
        self.content = content
    }
}

enum Author: String, Codable {
    case user = "User"
    case mentor = "Mentor"
}
