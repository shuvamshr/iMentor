//
//  ContentView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Mentor", systemImage: "person.2.fill") {
                MentorView()
            }
            Tab("Conversation", systemImage: "message.fill") {
                ConversationView()
            }
            .badge(2)
            
        }
    }
}



#Preview {
    ContentView()
}
