//
//  WorkoutHistory.swift
//  WorkoutTracker
//
//  Created by Hrvoje Hrvoić on 10/10/2019.
//  Copyright © 2019 Hrvoje Hrvoić. All rights reserved.
//

import SwiftUI

struct WorkoutHistory: View {
    @EnvironmentObject private var historyStore: HistoryStore

    var body: some View {
        NavigationView {
            List {
                ForEach(historyStore.workouts) { workout in
                    NavigationLink(destination: WorkoutDetails(workout: workout)) {
                        WorkoutRow(model: workout)
                    }
                }
            }.navigationBarTitle("Workout history")
        }
    }
}

struct WorkoutHistory_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutHistory()
            .environmentObject(HistoryStore.instance)
    }
}
