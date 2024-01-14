//
//  Network.swift
//  Multi Directional AI
//
//  Created by Michael Rudolf on 12.01.24.
//

import Foundation

class Network: NeuronDelegate{
    
    //MARK: - Properties
    var neurons: NeuronalRaster? = nil
    var delegate: NetworkDelegate?
    //Holds a raster of all the neurons
    //MARK: - Round related functions

    func simulateIterations(iterations: Int){
        for _ in 1...iterations{
            simulateOneIteration()
        }
    }
    
    func simulateOneIteration(){
        chargeInputs()
        makeOutputs()
        //TODO
        //Change charge inputs into simulateOneIteration
        //Get the correct value
    }
    
    func makeOutputs(){
        let attributs = Neuron.FireFunctionAttributs(inputs: [], weights: [])
        for neuronGroup in neurons!.neurons{
            for neuron in neuronGroup{
                print(neuron.fire(attributs: attributs))
            }
        }
    }
    
    func chargeInputs(){
        //You may want to add custom logic here
        neurons?.list({ neuron, positionX, positionY in
            //Iterate throw all the neurons
            //Check if the neuron has an output
            if neuron.lastOutput != nil{
                //Store neighbours information into array
                let neighboursPositions = [
                    [positionX - 1, positionY],
                    [positionX + 1, positionY],
                    [positionX, positionY - 1],
                    [positionX, positionY + 1],
                    [positionX - 1, positionY - 1],
                    [positionX - 1, positionY + 1],
                    [positionX + 1, positionY - 1],
                    [positionX + 1, positionY + 1]
                ]
                
                var i = 0
                //i is there to keep track of the iteration count to select the correct weight, could've used enumerated() instead but that would look kinda weird
                for neighbourPosition in neighboursPositions{
                    if neurons?.neuronAt(x: neighbourPosition[0], y: neighbourPosition[1]) != nil{
                        neurons!.neurons[neighbourPosition[0]][neighbourPosition[1]].precharged.append(neuron.lastOutput!)
                        neurons!.neurons[neighbourPosition[0]][neighbourPosition[1]].precharged_weights.append(neuron.weights[i])
                        print("Neuron at x: \(neighbourPosition[0]), y: \(neighbourPosition[1]) charged with: \(neuron.lastOutput!) and weight: \(neuron.weights[i]) (total: \(neuron.lastOutput! * neuron.weights[i])).")
                        i += 1
                    }else{
                        print("Neuron at x: \(neighbourPosition[0]), y: \(neighbourPosition[1]) doesn't exist.")
                    }
                    
                    
                }
                
                //Remove lastOutput
                neuron.lastOutput = nil
            }
        })
    }
    
    init(neurons: NeuronalRaster, delegate: NetworkDelegate) {
        self.neurons = neurons
        self.delegate = delegate
    }
    
    init (width: Int, height: Int, delegate: NetworkDelegate, defaultFunction: @escaping((Neuron.FireFunctionAttributs) -> Double)){
        let raster = NeuronalRaster(length: width, height: height, defaultFunction: defaultFunction, delegate: self)
        self.neurons = raster
        self.delegate = delegate
    }
    
    
    
    //MARK: - NeuronDelegate functions

    func getSelf() -> Network {
        return self
    }
    
    func makeOutput(output: [Double]) {
        delegate?.madeOutput(output)
    }
    
}






