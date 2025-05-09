//
//  MessageBubble.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 4/5/2025.
//

import SwiftUI

struct MessageBubble: View {
    
    var message: Message
    
    var body: some View {
        HStack {
            if message.author == .user { Spacer() }
            
            VStack(alignment: message.author == .user ? .trailing : .leading, spacing: 4) {
                Text(message.content)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(message.author == .user ? Color.blue : Color.gray.opacity(0.2))
                    .foregroundStyle(message.author == .user ? Color.white : Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Text(message.timestamp.formatted(date: .omitted, time: .shortened))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            
            if message.author == .mentor { Spacer() }
        }
      
    }
}
