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
    
    @State private var newConversationSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(conversations) { conversation in
                    NavigationLink {
                        MessageView(conversation: conversation)
                    } label: {
                        ConversationListItem(conversation: conversation)
                    }
                    
                }
            }
            .navigationTitle("Conversation")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        newConversationSheet.toggle()
                    } label: {
                        Label("Add New Mentor", systemImage: "plus.message.fill")
                    }
                }
            }
            .sheet(isPresented: $newConversationSheet) {
                NewConversationView()
            }
        }
    }
}

