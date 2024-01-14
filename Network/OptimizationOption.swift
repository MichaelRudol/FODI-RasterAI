//
//  OptimizationOption.swift
//  Multi Directional AI
//
//  Created by Michael Rudolf on 14.01.24.
//

import Foundation

enum OptimizationOption{
    case custom //This will call an optional function from NetworkDelegate called customOptimization() to let you optimize your network
    case ppoRemade(PPORemadeOptionSet) //A random weight will get selected and optimized (may take long)
    case random //A less random weight will get selected and randomly changed (fast)
}

struct PPORemadeOptionSet {
    var neuronSelectionRange: ClosedRange<Int>
    var strengthSelectionCount: ClosedRange<Int>
    var strengthChangeRange: ClosedRange<Double>
    var strengthChangeCount: Int
    var selectionWhenTwoEqual: EqualSelectionSet
    var selectionWhenNoDifference: NoDifferenceSelectionSet
    
    enum EqualSelectionSet{
        case none //The strength will remain it's old value and nothing more will happen
        case noneRetry //The strength will remain its old value and another neuron will get selected
        case random //A random option will be selected.
    }
    
    enum NoDifferenceSelectionSet{
        case none //The strength will remain it's old value and nothing more will happen
        case noneRetry //The strength will remain its old value another random neuron will get selected (may happen to be the same again)
        case random //A random option will be selected.
    }
}
