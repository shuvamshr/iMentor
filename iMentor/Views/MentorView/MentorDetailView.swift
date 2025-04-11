//
//  MentorDetailView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI

struct MentorDetailView: View {
    
    var mentor: Mentor
    
    var body: some View {
        VStack {
            Text(mentor.name)
                .font(.largeTitle)
                .bold()
            Text(mentor.department)
        }
        .navigationTitle("Mentor Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

