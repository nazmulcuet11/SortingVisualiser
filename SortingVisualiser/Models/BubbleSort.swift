//
//  BubbleSort.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 7/4/21.
//

import Foundation

struct BubbleSort: SortingAlgorithm {
    var name: String { "Bubble Sort" }

    func getIntermediateSortingSteps(dataPoints: [DataPoint]) -> [[DataPoint]] {

        var mutableDataPoints = dataPoints
        var states: [[DataPoint]] = []
        
        for i in 0..<(dataPoints.count - 1) {
            for j in 0..<(dataPoints.count - i - 1) {
                let state = getUpdateDataPointSate(dataPoints: mutableDataPoints, comparingIndexes: [j, j+1])
                states.append(state)

                if mutableDataPoints[j+1].height < mutableDataPoints[j].height {
                    mutableDataPoints.swapAt(j, j+1)
                }
            }
        }

        let state = getSortingCompletedState(dataPoints: mutableDataPoints)
        states.append(state)

        return states
    }
}
