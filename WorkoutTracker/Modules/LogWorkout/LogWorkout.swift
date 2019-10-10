//
//  LogWorkout.swift
//  WorkoutTracker
//
//  Created by Hrvoje Hrvoić on 09/10/2019.
//  Copyright © 2019 Hrvoje Hrvoić. All rights reserved.
//
import SwiftUI
import Combine

struct LogWorkout: View {
    @State private var mood = Mood.neutral
    @State private var description = ""
    @State private var showingAlert = false

    @EnvironmentObject private var historyStore: HistoryStore
    
    @ObservedObject private var keyboard: KeyboardResponder = KeyboardResponder()

    var body: some View {
        NavigationView {
            VStack(spacing: 38) {
                Text("How was your training?")
                    .font(.headline)
                    .fontWeight(.bold)
                
                MoodPickerView(selectedMood: $mood)
                
                Text("What did you achieve?")
                    .font(.headline)
                    .fontWeight(.bold)
                
                LineTextField(inputText: $description)
                
                Spacer()
                
                LogWorkoutButton(mood: $mood,
                                 action: {
                                    self.logWorkout(mood: self.mood, description: self.description)
                })
                .offset(x: 0, y: self.keyboard.currentHeight == 0 ? 0 : -156) // Hardcoded for now
            }
            .padding(.top, 70)
            .offset(x: 0, y: self.keyboard.currentHeight == 0 ? 0 : -40)  // Hardcoded for now
            .animation(.default)
            .navigationBarTitle("Log workout")
        }.alert(isPresented: $showingAlert, content: createAlert)
    }
    
}

struct LogWorkout_Previews: PreviewProvider {
    static var previews: some View {
        LogWorkout()
            .environmentObject(HistoryStore.instance)
    }
}

private extension LogWorkout {
    
    func logWorkout(mood: Mood, description: String) {
        defer { showingAlert = true } // Show alert
        guard !description.isEmpty else {
            return
        }
        
        let workoutModel = WorkoutHistoryModel(mood: mood, description: description)
        historyStore.logWorkout(workoutModel)
    }
    
    func resetState() {
        mood = .neutral
        description = ""
    }
    
    func createAlert() -> Alert {
        let canSave = !description.isEmpty
        let title = canSave ? Text("Success") : Text("Warning")
        let message = canSave ? Text("Workout saved successfully.") : Text("You need to enter a description for this workout.")
        return Alert(
            title: title,
            message: message,
            dismissButton: .default(Text("Ok")) {
                if canSave { self.resetState() }
            }
        )
    }
    
}
