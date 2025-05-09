//
//  Department.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 23/4/2025.
//

import SwiftUI

enum Department: String, CaseIterable, Identifiable, Codable {
    case design = "Design"
    case development = "Development"
    case research = "Research"
    
    var id: UUID {
        UUID()
    }
    
    var description: String {
        self.rawValue
    }
    
    var icon: Image {
        switch self {
        case .design: Image(systemName: "paintpalette")
        case .development: Image(systemName: "laptopcomputer.and.iphone")
        case .research: Image(systemName: "text.page.badge.magnifyingglass")

        }
    }
    
    var theme: Color {
        switch self {
        case .design: Color.pink
        case .development: Color.indigo
        case .research: Color.green

        }
    }
}
