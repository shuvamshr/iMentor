//
//  MentorViewModel.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 23/4/2025.
//

import SwiftUI

class MentorViewModel: ObservableObject {
    @Published var mentors: [Mentor] = [
        Mentor(name: "Shuvam", department: .development, chatModel: .chatGpt),
        Mentor(name: "Baki", department: .research, chatModel: .gemini),
        Mentor(name: "Hiba", department: .design, chatModel: .llama),
    ]
    
    func addNewMentor(mentor: Mentor) {
        mentors.append(mentor)
    }
    
    func updateMentor(mentor: Mentor) {
        if let index = mentors.firstIndex(where: {$0.id == mentor.id }) {
            mentors[index] = mentor
        }
    }
    
    func deleteMentor(mentor: Mentor) {
        if let index = mentors.firstIndex(where: {$0.id == mentor.id }) {
            mentors.remove(at: index)
        }
    }
}
