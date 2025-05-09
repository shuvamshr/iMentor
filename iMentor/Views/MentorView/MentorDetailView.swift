//
//  MentorDetailView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI
import SwiftData

struct MentorDetailView: View {
    
    var mentor: Mentor
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var name: String = ""
    @State private var department: Department = .design
    @State private var chatModel: ChatModel = .chatGpt
    @State private var showDeleteAlert: Bool = false
    
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
            
            Section {
                Button("Delete Mentor", role: .destructive) {
                    showDeleteAlert = true
                }
            }
        }
        .navigationTitle("Mentor Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    updateMentor()
                    dismiss()
                }
                .disabled(isNameFieldEmpty || !dataHasChanged)
            }
        }
        .toolbarVisibility(.hidden, for: .tabBar)
        .onAppear {
            populateMentorDetails()
        }
        .alert("Delete Mentor", isPresented: $showDeleteAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Delete", role: .destructive) {
                deleteMentor()
                dismiss()
            }
        } message: {
            Text("Are you sure you want to delete this mentor? This action cannot be undone.")
        }
    }
    
    
    private func updateMentor() {
        mentor.name = name
        mentor.department = department
        mentor.chatModel = chatModel
    }
    
    private func deleteMentor() {
        modelContext.delete(mentor)
    }
    
    private func populateMentorDetails() {
        name = mentor.name
        department = mentor.department
        chatModel = mentor.chatModel
    }
    
    private var isNameFieldEmpty: Bool {
        name.isEmpty
    }
    
    private var dataHasChanged: Bool {
        if name != mentor.name || department != mentor.department || chatModel != mentor.chatModel {
            true
        } else {
            false
        }
    }
}

