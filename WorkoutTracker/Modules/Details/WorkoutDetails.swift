//
//  WorkoutDetails.swift
//  WorkoutTracker
//
//  Created by Hrvoje Hrvoić on 10/10/2019.
//  Copyright © 2019 Hrvoje Hrvoić. All rights reserved.
// 

import SwiftUI

struct WorkoutDetails: View {
    
    @EnvironmentObject private var historyStore: HistoryStore
    @State var workout: WorkoutHistoryModel
    @State private var isEditing: Bool = false

    struct ReadOnlyView: View {
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
                      .font(.headline)
                  
                  Spacer()
              }
          }
      }
      
      struct EditView: View {
        @Binding var workout: WorkoutHistoryModel
    
          var body: some View {
              VStack(spacing: 16) {
                  MoodPickerView(selectedMood: $workout.mood)
                      .padding(.bottom, 30)
                      .padding(.top, 70)

                  Text(workout.formattedDate!)
                      .font(.subheadline)
                      .foregroundColor(.secondary)
        
                  LineTextField(inputText: $workout.description)
    
                  Spacer()
              }
          }
      }

    var body: some View {
        let view = isEditing ? AnyView(EditView(workout: $workout)) : AnyView(ReadOnlyView(workout: workout)) // We have to erase type here in order to return *some* View
        return view
            .padding(.horizontal, 16)
            .navigationBarTitle("Workout details", displayMode: .inline)
            .navigationBarItems(trailing: editButton)
    }
    
    var editButton: some View {
        Button(
            action: {
                if self.isEditing {
                    self.storeUpdatedWorkout()
                }
                self.isEditing.toggle()
        }, label:
            { isEditing ? Text("Done") : Text("Edit") }
        )
    }
}

private extension WorkoutDetails {
    func storeUpdatedWorkout() {
          guard workout.description.isEmpty == false else { return }

          workout.updateDate = Date() // Assign current date

          historyStore.updateWorkout(
              with: workout.id,
              newWorkout: workout
          )
      }
}

struct WorkoutDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WorkoutDetails(workout: .random())
        }
        .environmentObject(HistoryStore.instance)
    }
}
