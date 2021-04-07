//
//  BubbleSort.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 7/4/21.
//

import Foundation

struct BubbleSort: SortingAlgorithm {
    var name: String { "Bubble Sort" }

    func getIntermediateSortingSteps(data: [DataPoint]) -> [[DataPoint]] {
        var mutableData = data
        var states: [[DataPoint]] = []
        for i in 0..<data.count {
            states.append(mutableData)
            for j in (i + 1)..<data.count {
                if mutableData[j].height < mutableData[i].height {
                    mutableData.swapAt(i, j)
                }
            }
        }

        return states
    }
}
