//
//  MessageView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 2/5/2025.
//

import SwiftUI

struct MessageView: View {
    
    var conversation: Conversation
    
    @State private var userMessage: String = ""
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List {
            ForEach(conversation.messages) { message in
                Section {
                    Text(message.content)
                } header: {
                    if message.author == .mentor {
                        HStack {
                            Text(message.author.rawValue)
                            Spacer()
                        }
                    } else {
                        HStack {
                            Spacer()
                            Text(message.author.rawValue)
                        }
                    }
                } footer: {
                    Text(message.timestamp.formatted(date: .abbreviated, time: .shortened))
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    modelContext.delete(conversation)
                    dismiss()
                } label: {
                    Image(systemName: "trash.fill")
                        .foregroundStyle(.red)
                }
            }
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    TextField("Enter a message", text: $userMessage)
                    Button {
                        sendMessage()
                    } label: {
                        Image(systemName: "arrow.right.circle.fill")
                            .foregroundStyle(Color.accentColor)
                    }
                }
                .background(.white)
            }
        }
        .toolbarVisibility(.hidden, for: .tabBar)
    }
    
    private func sendMessage() {
        let newMessage = Message(author: .user, content: userMessage)
        
        conversation.messages.append(newMessage)
        
        getResponse()
        
        userMessage = ""
    }
    
    private func getResponse() {
        
        var response: String = ""
        
        switch(userMessage) {
        case "Hello": response = "Hey, how are you doing?"
        case "I need help": response = "What help do you need with?"
        default: response = "Sorry, I don't understand"
        }
        
        let newResponse = Message(author: .mentor, content: response)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            conversation.messages.append(newResponse)
        }
    }
}


