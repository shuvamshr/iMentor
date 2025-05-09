//
//  MentorView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI
import SwiftData

struct MentorView: View {
    
    @Query(sort: \Mentor.name) private var mentors: [Mentor]
    
    @State private var searchKeyword: String = ""
    
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
                    NavigationLink {
                        NewMentorView()
                    } label: {
                        Image(systemName: "person.fill.badge.plus")
                    }
                }
            }
            .searchable(text: $searchKeyword)
        }
    }
    
    private var filteredMentors: [Mentor] {
        if searchKeyword.isEmpty {
            return mentors
        } else {
            return mentors.filter { $0.name.localizedCaseInsensitiveContains(searchKeyword) }
        }
    }

}
