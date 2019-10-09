//
//  ColorExtension.swift
//  WorkoutTracker
//
//  Created by Goran Brlas on 04/09/2019.
//  Copyright © 2019 Goran Brlas. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    
    init(rgbHex: Int) {
        let r = (rgbHex >> 16) & 0xFF
        let g = (rgbHex >> 8) & 0xFF
        let b = rgbHex & 0xFF
        
        self.init(red: Double(r) / 255.0, green: Double(g) / 255.0, blue: Double(b) / 255.0)
    }
    
}
