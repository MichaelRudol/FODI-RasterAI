//
//  NeuronDelegate.swift
//  Multi Directional AI
//
//  Created by Michael Rudolf on 13.01.24.
//

import Foundation


protocol NeuronDelegate{
    func getSelf() -> Network
    func makeOutput(output: [Double])
}
