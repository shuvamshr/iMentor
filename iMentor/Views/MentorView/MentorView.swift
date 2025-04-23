//
//  MentorView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI

struct MentorView: View {
    
    @State private var mentors: [Mentor] = [
        Mentor(name: "Shuvam", department: .development, chatModel: .chatGpt),
        Mentor(name: "Baki", department: .research, chatModel: .gemini),
        Mentor(name: "Hiba", department: .design, chatModel: .llama),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(mentors) { mentor in
                    NavigationLink {
                        MentorDetailView(mentor: mentor, mentors: $mentors)
                    } label: {
                        MentorListItem(mentor: mentor)
                    }
                }
            }
            .navigationTitle("Mentors")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        NewMentorView(mentors: $mentors)
                    } label: {
                        Image(systemName: "plus.app")
                    }
                }
            }
        }
    }

}

#Preview {
    MentorView()
}
