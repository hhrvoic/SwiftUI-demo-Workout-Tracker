//
//  WorkoutRow.swift
//  WorkoutTracker
//
//  Created by Hrvoje Hrvoić on 10/10/2019.
//  Copyright © 2019 Hrvoje Hrvoić. All rights reserved.
//

import SwiftUI

struct WorkoutRow: View {
    
    var model: WorkoutHistoryModel

    var body: some View {
        HStack {
            MoodView(mood: model.mood)
            VStack(alignment: .leading, spacing: 6) {
                Text(model.description)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(model.formattedDate!)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 16)
    }
}

struct WorkoutRow_Previews: PreviewProvider {
   static var previews: some View {
        return List {
            ForEach(0...5, id: \.self) { _ in return WorkoutRow(model: .random()) }
        }
    }
}
