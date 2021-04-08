//
//  MergeSort.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 8/4/21.
//

import UIKit

struct SelectionSort: SortingDataProvider {
    var algorithmName: String { "Selection Sort"}

    var dataPoints: [DataPoint] = []

    mutating func getIntermediateSortingSteps() -> [[DataPoint]] {
        let count = dataPoints.count
        var states: [[DataPoint]] = []
        for i in 0..<(count - 1) {
            var minIndex = i
            for j in (i + 1)..<count {
                updateDataPointsColor(refIndex: i, minIndex: minIndex, currenIndex: j)
                states.append(dataPoints)

                if dataPoints[j].height < dataPoints[minIndex].height {
                    minIndex = j

                    updateDataPointsColor(refIndex: i, minIndex: minIndex, currenIndex: j)
                    states.append(dataPoints)
                }
            }

            dataPoints.swapAt(i, minIndex)

            states.append(dataPoints)

            dataPoints[minIndex].color = .orange
            dataPoints[i].color = .green
            states.append(dataPoints)
        }

        dataPoints[count-1].color = .green
        states.append(dataPoints)

        return states
    }

    private mutating func updateDataPointsColor(
        refIndex: Int,
        minIndex: Int,
        currenIndex: Int
    ) {
        for i in refIndex..<dataPoints.count {
            var color: UIColor
            if i == refIndex {
                color = .white
            } else if i == minIndex {
                color = .red
            } else if i == currenIndex {
                color = .blue
            } else {
                color = .orange
            }
            dataPoints[i].color = color
        }
    }
}
