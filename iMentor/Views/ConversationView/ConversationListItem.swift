//
//  ConversationListItem.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 9/5/2025.
//

import SwiftUI

struct ConversationListItem: View {
    
    var conversation: Conversation
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(conversation.mentor.name) (\(conversation.mentor.chatModel.description))")
                .font(.headline)
            
            if let lastMessage = conversation.messages.last {
                Text(lastMessage.content)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                    .truncationMode(.tail)
            } else {
                Text("No messages yet")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
