//
//  Mentor.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 11/4/2025.
//

import SwiftUI


struct Mentor: Identifiable {
    var id: UUID = UUID()
    var name: String
    var department: Department
    var chatModel: ChatModel
    var image: String = "default"
}



