//
//  NeuronalRaster.swift
//  Multi Directional AI
//
//  Created by Michael Rudolf on 13.01.24.
//

import Foundation

class NeuronalRaster{
    var neurons = [[Neuron]]()
    
    func neuronAt(x: Int, y: Int) -> Neuron?{
        //Make sure they are more then -1
        guard x > -1/*Zero at least*/ else {return nil}
        guard y > -1/*Zero at least*/ else {return nil}
        //Make sure the element exists
        guard neurons.count-1 > x else {return nil}
        guard neurons[x].count-1 > y else {return nil}
        //If so, return it
        return neurons[x][y]
    }
    
    func list(_ action: ((_ neuron: Neuron, _ positionX: Int, _ positionY: Int) -> Void)){
        for neuronArrayEn in neurons.enumerated() {
            for neuronEn in neuronArrayEn.element.enumerated(){
                action(neuronEn.element, neuronArrayEn.offset, neuronEn.offset)
                //I now switched to block cursor and it's confusing me
            }
        }
    }
    
    
    
    func neuronPosition(neuron neuronToFind: Neuron) -> (x: Int, y: Int)?{
        for neuronArrayEn in neurons.enumerated(){
            let neuronArray = neuronArrayEn.element
            let neuronArrayPosX = neuronArrayEn.offset
            for neuronEn in neuronArray.enumerated(){
                let neuron = neuronEn.element
                let neuronPosY = neuronEn.offset
                if neuron.id == neuronToFind.id{
                    return (x: neuronArrayPosX, y: neuronPosY)
                }
            }
        }
        //If the neuron was not found...
        return nil
    }
    
    init (length: Int, height: Int, defaultFunction: @escaping((Neuron.FireFunctionAttributs) -> Double), delegate: NeuronDelegate){
        var neurons = [[Neuron]]()
        for _ in 1...height{
            neurons.append([Neuron]())
            for _ in 1...length{
                let neuron = Neuron(delegate: delegate, fireFunction: defaultFunction)
                neurons[neurons.count-1].append(neuron)
            }
        }
        self.neurons = neurons
    }
}
