//
//  MoodPickerView.swift
//  WorkoutTracker
//
//  Created by Hrvoje Hrvoić on 09/10/2019.
//  Copyright © 2019 Hrvoje Hrvoić. All rights reserved.
//

import SwiftUI

struct MoodPickerView: View {
    @Binding var selectedMood: Mood

    var body: some View {
        HStack(spacing: 16) {
            // Return array of buttons with look definied in MoodView for each mood case
            ForEach(Mood.allCases.reversed()) { mood in
                Button(action: {
                    self.selectedMood = mood
                }, label: {
                    MoodView(mood: mood, isSelected: self.selectedMood == mood)
                })
            }
        }
    }
}

struct MoodPickerView_Previews: PreviewProvider {
    static var previews: some View {
        MoodPickerView(selectedMood: .constant(.neutral))
    }
}
