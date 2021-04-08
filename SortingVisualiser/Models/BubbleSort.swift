//
//  BubbleSort.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 7/4/21.
//

import Foundation

struct BubbleSort: SortingDataProvider {

    var algorithmName: String { "Bubble Sort" }
    var dataPoints: [DataPoint] = []

    mutating func getIntermediateSortingSteps() -> [[DataPoint]] {
        var states: [[DataPoint]] = []
        for i in 0..<(dataPoints.count - 1) {
            for j in 0..<(dataPoints.count - i - 1) {
                updateDataPointSates(leftComparingIndex: j, rightComparingIndex: j + 1)
                states.append(dataPoints)

                if dataPoints[j+1].height < dataPoints[j].height {
                    setComparisnWiningIndex(winingIndex: j)
                    states.append(dataPoints)

                    dataPoints.swapAt(j, j+1)
                } else {
                    setComparisnWiningIndex(winingIndex: j + 1)
                    states.append(dataPoints)
                }
            }
        }

        markAllDataPointsWithState(.final)
        states.append(dataPoints)

        return states
    }
}
