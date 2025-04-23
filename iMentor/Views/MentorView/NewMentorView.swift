//
//  NewMentorView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 23/4/2025.
//

import SwiftUI

struct NewMentorView: View {
    
    @ObservedObject var mentorVM: MentorViewModel
    
    @State private var name: String = ""
    @State private var department: Department = .design
    @State private var chatModel: ChatModel = .chatGpt
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        Form {
            Section {
                TextField("Enter Name", text: $name)
                Picker("Select Department", selection: $department) {
                    ForEach(Department.allCases) { department in
                        HStack {
                            department.icon
                            Text(department.description)
                        }
                        .tag(department)
                    }
                }
            } header: {
                Text("Mentor Details")
            }
            
            Section {
                Picker("Select Model", selection: $chatModel) {
                    ForEach(ChatModel.allCases) { chatModel in
                        Text(chatModel.description)
                            .tag(chatModel)
                    }
                }
            } header: {
                Text("Model Details")
            } footer: {
                Text("This will update the chat model")
            }
        }
        .navigationTitle("New Mentor")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    addNewMentor()
                    dismiss()
                }
                .disabled(isNameFieldEmpty)
            }
        }
        .toolbarVisibility(.hidden, for: .tabBar)
    }
    
    private var isNameFieldEmpty: Bool {
        name.isEmpty
    }
    
    
    private func addNewMentor() {
        let newMentor = Mentor(name: name, department: department, chatModel: chatModel)
        
        mentorVM.addNewMentor(mentor: newMentor)
    }
}
