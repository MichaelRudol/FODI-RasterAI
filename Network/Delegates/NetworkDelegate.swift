//
//  NetworkDelegate.swift
//  Multi Directional AI
//
//  Created by Michael Rudolf on 13.01.24.
//

import Foundation

protocol NetworkDelegate{
    func madeOutput(_ output: [Double])
    func getOptimizationOption(network: Network) -> OptimizationOption
}

//Extension to declare optional functions
extension NetworkDelegate{
    func customOptimization(network: Network, neurons: NeuronalRaster){
        fatalError("You returned .custom at NetworkDelegate/getOptimizationOption() in the class driving your AI without implementing the custom functionality in the (optional) function NetworkDelegate/customOptimization() which you need to override in your class to use a custom optimization option. Please change your return to NetworkDelegate/getOptimizationOption OR implement NetworkDelegate/customOptimization()")
    }
}
