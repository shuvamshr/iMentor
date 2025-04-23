//
//  ConversationView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI

struct ConversationView: View {
    
    @EnvironmentObject private var mentorVM: MentorViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(mentorVM.mentors) { mentor in
                    Text(mentor.name)
                }
            }
            .navigationTitle("Conversation")
        }
    }
}

