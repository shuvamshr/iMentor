//
//  NewConversationView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 9/5/2025.
//

import SwiftUI
import SwiftData

struct NewConversationView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Mentor.name) private var mentors: [Mentor]
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var selection: Mentor?
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    ForEach(mentors) { mentor in
                        HStack {
                            MentorListItem(mentor: mentor)
                            Spacer()
                            if selection == mentor {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(Color.accentColor)
                            }
                        }
                        .onTapGesture {
                            selection = mentor
                        }
                    }
                } header: {
                    Text("Select Mentor")
                }
            }
            .navigationTitle("New Conversation")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        addNewConversation()
                        dismiss()
                    }
                    .disabled(!isMentorSelected)
                }
            }
        }
    }
    
    private var isMentorSelected: Bool {
        if selection == nil {
            false
        } else {
            true
        }
    }
    
    private func addNewConversation() {
        if let mentor = selection {
            let greeting = "Hi, I'm \(mentor.name) using the \(mentor.chatModel.description) model. Ask me any question about \(mentor.department.description)."
            let newConversation = Conversation(mentor: mentor, messages: [Message(author: .mentor, content: greeting)])
            modelContext.insert(newConversation)
        }
    }
}
