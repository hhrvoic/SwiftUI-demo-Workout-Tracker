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
    @State private var showingDeletionAlert = false
    @State private var indexToDelete: Int?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(historyStore.workouts) { workout in
                    NavigationLink(destination: WorkoutDetails(workout: workout)) {
                        WorkoutRow(model: workout)
                    }
                }
                .onDelete(perform: delete(at:))
            }
            .navigationBarTitle("Workout history")
            .alert(isPresented: $showingDeletionAlert, content: deletionAlert)
        }
    }
}

struct WorkoutHistory_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutHistory()
            .environmentObject(HistoryStore.instance)
    }
}

private extension WorkoutHistory {
    func delete(at indexes: IndexSet) {
        showingDeletionAlert = true
        indexToDelete = indexes.first
    }
    
    func deleteWorkout() {
        guard let index = indexToDelete else { return }
        historyStore.deleteWorkout(at: index)
    }
    
    func deletionAlert() -> Alert {
        Alert(
            title: Text("Are you sure you want to delete this workout?"),
            primaryButton: .cancel(Text("No")) { self.indexToDelete = nil },
            secondaryButton: .destructive(Text("Yes"), action: deleteWorkout)
        )
    }
}
