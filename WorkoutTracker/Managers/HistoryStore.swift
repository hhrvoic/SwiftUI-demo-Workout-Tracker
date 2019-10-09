//
//  HistoryManager.swift
//  WorkoutTracker
//
//  Created by Goran Brlas on 03/09/2019.
//  Copyright © 2019 Goran Brlas. All rights reserved.
//

import Foundation
import Combine

class HistoryStore: ObservableObject {
    
    static let instance = HistoryStore()
    
    @Published var workouts: [WorkoutHistoryModel]
    
    private init() {
        self.workouts = UserStorage.instance.workoutModels
            .sorted { ($0.updateDate ?? $0.creationDate) > ($1.updateDate ?? $1.creationDate) }
    }
    
}

extension HistoryStore {
    
    func logWorkout(_ model: WorkoutHistoryModel) {
        workouts.insert(model, at: 0)
        workouts.sort { ($0.updateDate ?? $0.creationDate) > ($1.updateDate ?? $1.creationDate) }
        UserStorage.instance.workoutModels = workouts
    }
    
    func updateWorkout(with id: UUID, newWorkout: WorkoutHistoryModel) {
        let copiedWorkouts = workouts
        workouts = copiedWorkouts.map {
            guard $0.id == id else {
                return $0
            }
            
            return newWorkout
        }.sorted { ($0.updateDate ?? $0.creationDate) > ($1.updateDate ?? $1.creationDate) }
        
        UserStorage.instance.workoutModels = workouts
    }
    
    func deleteWorkout(at index: IndexSet) {
        guard let index = index.first else { return }
        
        deleteWorkout(at: index)
    }
    
    func deleteWorkout(_ workout: WorkoutHistoryModel) {
        guard let index = workouts.firstIndex(where: { $0.id == workout.id }) else { return }
        
        deleteWorkout(at: index)
    }
    
}

private extension HistoryStore {
    
    func deleteWorkout(at index: Int) {
        guard
            index >= 0,
            index < workouts.count
            else { return }
        
        workouts.remove(at: index)
        workouts.sort { ($0.updateDate ?? $0.creationDate) > ($1.updateDate ?? $1.creationDate) }
        UserStorage.instance.workoutModels = workouts
    }
    
}
