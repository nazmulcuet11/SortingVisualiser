//
//  SortingAlgorithm.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 7/4/21.
//

import Foundation

protocol SortingAlgorithm {
    var name: String { get }
    func getIntermediateSortingSteps(dataPoints: [DataPoint]) -> [[DataPoint]]
}

extension SortingAlgorithm {
    func getUpdateDataPointSate(dataPoints: [DataPoint], comparingIndexes: [Int]) -> [DataPoint] {
        var newDataPoints = dataPoints
        for i in 0..<dataPoints.count {
            let isActive = comparingIndexes.contains(i)
            let state: DataPointState = isActive ? .comparing : .nutral
            newDataPoints[i].state = state
        }
        return newDataPoints
    }

    func getSortingCompletedState(dataPoints: [DataPoint]) -> [DataPoint] {
        var newDataPoints = dataPoints
        for i in 0..<dataPoints.count {
            newDataPoints[i].state = .final
        }
        return newDataPoints
    }
}
