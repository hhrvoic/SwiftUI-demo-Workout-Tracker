//
//  KeyboardResponder.swift
//  WorkoutTracker
//
//  Created by Goran Brlas on 04/09/2019.
//  Copyright © 2019 Goran Brlas. All rights reserved.
//

import Foundation
import Combine
import UIKit

class KeyboardResponder: ObservableObject {
    
    private var cancelable: AnyCancellable?
    private var notificationCenter: NotificationCenter
    
    @Published var currentHeight: CGFloat = 0

    init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
        subscribeToKeyboardChanges()
    }

}

private extension KeyboardResponder {
    
    func subscribeToKeyboardChanges() {
        let showSize = notificationCenter
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .map { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue }
            .map { $0?.cgRectValue }
            .map { $0?.height ?? 0 }
        
        let hideSize = notificationCenter
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
            
        cancelable = showSize
            .merge(with: hideSize)
            .eraseToAnyPublisher()
            .subscribe(on: RunLoop.main)
            .assign(to: \.currentHeight, on: self)
    }
    
}


