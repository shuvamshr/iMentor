//
//  ConversationView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI
import SwiftData

struct ConversationView: View {
    
    @EnvironmentObject private var mentorVM: MentorViewModel
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var conversations: [Conversation] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(conversations) { conversation in
                    NavigationLink {
                        MessageView(conversation: conversation)
                    } label: {
                        Text(conversation.name)
                    }
                    
                }
                Button("Start New Chat") {
                    addNewConversation()
                }
            }
            .navigationTitle("Conversation")
        }
    }
    
    private func addNewConversation() {
        
        let sampleMessage = Message(author: .mentor, content: "Hello. What do you need?")
        
        let newConversation = Conversation(name: "Shuvam", messages: [sampleMessage])
        
        modelContext.insert(newConversation)
    }
    
    
}

