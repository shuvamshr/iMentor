//
//  MentorView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI

struct MentorView: View {
    
    @EnvironmentObject private var mentorVM: MentorViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(mentorVM.mentors) { mentor in
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
                    NavigationLink {
                        NewMentorView()
                    } label: {
                        Image(systemName: "plus.app")
                    }
                }
            }
        }
    }

}
