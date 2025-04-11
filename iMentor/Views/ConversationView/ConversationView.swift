//
//  ConversationView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI

struct ConversationView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    Text("Actual Converation")
                } label: {
                    Text("Conversation 1")
                }
                
                NavigationLink {
                    Text("Actual Converation")
                } label: {
                    Text("Conversation 1")
                }
                
                NavigationLink {
                    Text("Actual Converation")
                } label: {
                    Text("Conversation 1")
                }
            }
            .navigationTitle("Conversation")
        }
    }
}

#Preview {
    ConversationView()
}
