//
//  MentorListItem.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI

struct MentorListItem: View {
    
    var mentor: Mentor
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(mentor.name)
                .font(.headline)
            Text(mentor.department)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}


