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
        HStack(spacing: 16) {
            mentor.department.icon
                .frame(width: 40, height: 40)
                .background(mentor.department.theme.opacity(0.2))
                .foregroundStyle(mentor.department.theme)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading) {
                Text(mentor.name)
                    .font(.headline)
                Text(mentor.department.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}


