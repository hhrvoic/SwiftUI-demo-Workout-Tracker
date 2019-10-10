//
//  MoodView.swift
//  WorkoutTracker
//
//  Created by Hrvoje Hrvoić on 09/10/2019.
//  Copyright © 2019 Hrvoje Hrvoić. All rights reserved.
//

import SwiftUI

// Read-only view that shows workout satisfaction
struct MoodView: View {
    
    private let mood: Mood
    private let isSelected: Bool
    private let scaledWhenSelected: Bool
    
    init(mood: Mood, isSelected: Bool = true, scaledWhenSelected: Bool = true) {
        self.mood = mood
        self.isSelected = isSelected
        self.scaledWhenSelected = scaledWhenSelected
    }

    var body: some View {
        ZStack {
            Circle()
            .frame(width: 56, height: 56)
                .foregroundColor(isSelected ? mood.selectedColor : Color(.systemGray3))
            Circle()
             .frame(width: isSelected ? 46 : 50,
                    height: isSelected ? 46 : 50)
                .foregroundColor(Color(.systemBackground))
        
            mood.icon
        }
        .scaleEffect(scaledWhenSelected && isSelected ? 1.15 : 1.0)
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView(mood: .good, isSelected: false)
        //.environment(\.colorScheme, .dark)
    }
}
