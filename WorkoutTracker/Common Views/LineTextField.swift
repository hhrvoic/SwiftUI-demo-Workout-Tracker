//
//  LineTextField.swift
//  WorkoutTracker
//
//  Created by Hrvoje Hrvoić on 09/10/2019.
//  Copyright © 2019 Hrvoje Hrvoić. All rights reserved.
//

import SwiftUI

struct LineTextField: View {
    
    @Binding var inputText: String

    var body: some View {
        VStack(spacing: 8) {
            TextField("Enter your thoughts", text: $inputText)
            .multilineTextAlignment(.center)
            .font(.headline)

            Color(.systemGray3)
                .frame(height: 1)
                .padding(.horizontal) // Default system padding
        }
    }
}

struct LineTextField_Previews: PreviewProvider {
    static var previews: some View {
        LineTextField(inputText: .constant("Sample input"))
    }
}
