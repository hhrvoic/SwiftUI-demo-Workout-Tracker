
//
//  WorkoutHistoryModel.swift
//  WorkoutTracker
//
//  Created by Goran Brlas on 03/09/2019.
//  Copyright © 2019 Goran Brlas. All rights reserved.
//

import Foundation
import Combine

struct WorkoutHistoryModel: Identifiable, Codable {
    
    var mood: Mood = .neutral
    var description: String
    var updateDate: Date?
    
    let id: UUID
    let creationDate: Date
    
    init(mood: Mood = .neutral, description: String = "", creationDate: Date = Date(), updateDate: Date? = nil) {
        self.mood = mood
        self.description = description
        self.updateDate = updateDate
        self.id = UUID()
        self.creationDate = Date()
    }
    
}

extension WorkoutHistoryModel {
    
    var formattedDateTime: String? {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        
        return (updateDate ?? creationDate).flatMap { formatter.string(from: $0) }
    }
    
    var formattedDate: String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy. @ HH:mm "
        
        return [
            (updateDate ?? creationDate).flatMap { formatter.string(from: $0) },
            updateDate != nil ? "(Edited)" : nil
        ]
            .compactMap { $0 }
            .joined(separator: " ")
    }
    
}

extension WorkoutHistoryModel {
    static func random() -> WorkoutHistoryModel {
        let mood = Mood(rawValue: Int.random(in: 0 ... Mood.allCases.count - 1))!
        let model = WorkoutHistoryModel(mood: mood, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero.")
        return model
    }
}
