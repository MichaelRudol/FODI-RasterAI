//
//  Neuron.swift
//  Multi Directional AI
//
//  Created by Michael Rudolf on 13.01.24.
//

import Foundation

class Neuron{
    let id: String
    let delegate: NeuronDelegate
    var lastOutput: Double?
    var fireFunction: ((FireFunctionAttributs) -> Double)
    var storedData: [String]
    
    var weights: [Double]
    var precharged_weights: [Double]
    var precharged: [Double]
    
    
    func fire(attributs: FireFunctionAttributs) -> Double{
        var attributs = attributs
        attributs.inputs.append(contentsOf: precharged)
        attributs.weights.append(contentsOf: precharged_weights)
        attributs.neuronDelegate = self.delegate
        let outcome = fireFunction(attributs)
        lastOutput = outcome
        return outcome
    }
    
    struct FireFunctionAttributs{
        var inputs: [Double]
        var weights: [Double]
        var neuronDelegate: NeuronDelegate?
        
        init(inputs: [Double], weights: [Double], neuron: Neuron) {
            self.inputs = inputs
            self.weights = weights
            self.neuronDelegate = neuron.delegate
        }
        
        init (inputs: [Double], weights: [Double]){
            self.inputs = inputs
            self.weights = weights
            self.neuronDelegate = nil
        }
    }
    
    init(delegate: NeuronDelegate, fireFunction: @escaping((FireFunctionAttributs) -> Double)){
        let idLength = 20
        self.id = String.generateRandomString(length: idLength)
        self.lastOutput = nil
        self.fireFunction = fireFunction
        self.storedData = [String]()
        self.delegate = delegate
        self.precharged = [Double]()
        self.precharged_weights = [Double]()
        self.weights = Array(repeating: 5.0, count: 8)
        
    }
}
