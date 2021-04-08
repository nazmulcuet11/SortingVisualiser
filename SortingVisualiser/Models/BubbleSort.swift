//
//  BubbleSort.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 7/4/21.
//

import UIKit

struct BubbleSort: SortingDataProvider {

    var algorithmName: String { "Bubble Sort" }
    var dataPoints: [DataPoint] = []

    mutating func getIntermediateSortingSteps() -> [[DataPoint]] {
        var states: [[DataPoint]] = []
        let count = dataPoints.count
        for i in 0..<(count - 1) {
            let lastIndex = count - i - 1
            for j in 0..<lastIndex {
                updateDataPointsColor(comparingIndexes: [j, j + 1], lastIndex: lastIndex)
                states.append(dataPoints)

                if dataPoints[j+1].height < dataPoints[j].height {
                    dataPoints[j].color = .red
                    states.append(dataPoints)

                    dataPoints.swapAt(j, j+1)

                    states.append(dataPoints)
                } else {
                    dataPoints[j + 1].color = .red
                    states.append(dataPoints)
                }
            }

            dataPoints[count - i - 1].color = .green
            states.append(dataPoints)
        }

        dataPoints[0].color = .green
        states.append(dataPoints)

        return states
    }

    private mutating func updateDataPointsColor(
        comparingIndexes: [Int],
        lastIndex: Int
    ) {
        for i in 0...lastIndex {
            var color: UIColor
            if comparingIndexes.contains(i) {
                color = .purple
            } else {
                color = .orange
            }
            dataPoints[i].color = color
        }
    }
}
