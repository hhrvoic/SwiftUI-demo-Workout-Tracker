//
//  Mood.swift
//  WorkoutTracker
//
//  Created by Goran Brlas on 03/09/2019.
//  Copyright © 2019 Goran Brlas. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

enum Mood: Int, Codable, CaseIterable {
    
    case excellent
    case good
    case neutral
    case dissapointed
    case crushed
    
}

extension Mood {
    
    var selectedColor: Color {
        switch self {
        case .excellent: return Color(rgbHex: 0x33d827)
        case .good: return Color(rgbHex: 0xa6d826)
        case .neutral: return Color(rgbHex: 0xd8b426)
        case .dissapointed: return Color(rgbHex: 0xd87427)
        case .crushed: return Color(rgbHex: 0xd8252b)
        }
    }
    
    var icon: Image {
        switch self {
        case .excellent: return Image("excellent")
        case .good: return Image("good")
        case .neutral: return Image("neutral")
        case .dissapointed: return Image("dissapointed")
        case .crushed: return Image("crushed")
        }
    }
    
}

extension Mood: Identifiable {
    var id: Int {
        return rawValue
    }
}
