//
//  Mathematics.swift
//  Multi Directional AI
//
//  Created by Michael Rudolf on 13.01.24.
//

import Foundation

class Mathematics{
    static func sigmoid(_ value: Double) -> Double{
        return 1/(1 + exp(-value))
    }
}
