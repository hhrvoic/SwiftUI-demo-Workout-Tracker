//
//  WorkoutDetails.swift
//  WorkoutTracker
//
//  Created by Hrvoje Hrvoić on 10/10/2019.
//  Copyright © 2019 Hrvoje Hrvoić. All rights reserved.
// 

import SwiftUI

struct WorkoutDetails: View {
    var workout: WorkoutHistoryModel

    var body: some View {
        VStack(spacing: 16) {
            MoodView(mood: workout.mood)
                .scaleEffect(2)
                .padding(.bottom, 30)
                .padding(.top, 70)
            
            Text(workout.formattedDate!)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(workout.description)
                .font(.body)
                .bold()
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .navigationBarTitle("Workout details", displayMode: .inline)

    }
}

struct WorkoutDetails_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetails(workout: .random())
    }
}
