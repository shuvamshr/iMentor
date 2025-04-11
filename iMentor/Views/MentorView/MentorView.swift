//
//  MentorView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI

struct MentorView: View {
    
    @State private var mentors: [Mentor] = [
        Mentor(name: "Shuvam", department: "Development", chatModel: .chatGpt),
        Mentor(name: "Baki", department: "Research", chatModel: .gemini),
        Mentor(name: "Hiba", department: "Design", chatModel: .llama),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(mentors) { mentor in
                    NavigationLink {
                        MentorDetailView(mentor: mentor)
                    } label: {
                        MentorListItem(mentor: mentor)
                    }
                }
            }
            .navigationTitle("Mentors")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addMentor()
                    } label: {
                        Image(systemName: "plus.app")
                    }
                   
                }
                
            }
        }
    }
    
    private func addMentor() {
        let sampleMentor = Mentor(name: "Seb", department: "Design", chatModel: .gemini)
        
        mentors.append(sampleMentor)
    }
}

#Preview {
    MentorView()
}
