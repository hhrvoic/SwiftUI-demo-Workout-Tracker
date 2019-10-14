//
//  LogWorkoutButton.swift
//  WorkoutTracker
//
//  Created by Hrvoje Hrvoić on 10/10/2019.
//  Copyright © 2019 Hrvoje Hrvoić. All rights reserved.
//

import SwiftUI

struct LogWorkoutButton: View {
    @Binding var mood: Mood
    var action: () -> Void

    var body: some View {
        GeometryReader { parent in
            Button(
                action: {
                    self.action()
            },
                label: {
                    Text("LOG WORKOUT")
                        .frame(width: parent.size.width, height: 53)
            })
                .padding(.horizontal, -24)
                .background(self.mood.selectedColor)
                .foregroundColor(Color(.white))
                .font(.headline)
                .cornerRadius(26.5)
        }
    }
}

struct LogWorkoutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogWorkoutButton(mood: .constant(.good), action: {
            print("Log workout tapped")
        })
    }
}
