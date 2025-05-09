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
            Image(mentor.image)
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .strokeBorder(mentor.department.theme, lineWidth: 2)
                }
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


