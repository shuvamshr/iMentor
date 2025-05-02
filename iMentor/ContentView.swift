//
//  ContentView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var mentorVM = MentorViewModel()
    
    var body: some View {
        TabView {
            Tab("Conversation", systemImage: "message.fill") {
                ConversationView()
            }
            .badge(2)
            Tab("Mentor", systemImage: "person.2.fill") {
                MentorView()
            }
        }
        .environmentObject(mentorVM)
    }
}



#Preview {
    ContentView()
}
