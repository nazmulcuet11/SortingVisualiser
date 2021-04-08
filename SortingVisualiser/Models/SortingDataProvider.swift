//
//  SortingAlgorithm.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 7/4/21.
//

import Foundation

protocol SortingDataProvider {
    var algorithmName: String { get }
    var dataPoints: [DataPoint] { get set }
    mutating func prepareInitialData(count: Int, minHeight: Double, maxHeight: Double)
    mutating func getIntermediateSortingSteps() -> [[DataPoint]]
    mutating func shuffle()
}

extension SortingDataProvider {
    mutating func prepareInitialData(count: Int, minHeight: Double, maxHeight: Double) {
        dataPoints.removeAll()

        let delta = abs(maxHeight - minHeight)
        let stepHeight = delta / Double(count)
        var currentBarHeight = minHeight

        for _ in 0..<count {
            let dataPoint = DataPoint(height: currentBarHeight, state: .nutral)
            dataPoints.append(dataPoint)
            currentBarHeight += stepHeight
        }
    }

    mutating func shuffle() {
        markAllDataPointsWithState(.nutral)
        dataPoints.shuffle()
    }

    mutating func updateDataPointSates(leftComparingIndex: Int, rightComparingIndex: Int) {
        for i in 0..<dataPoints.count {
            var state: DataPointState
            if i == leftComparingIndex {
                state = .leftComparingIndex
            } else if i == rightComparingIndex {
                state = .rightComparingIndex
            } else {
                state = .nutral
            }
            dataPoints[i].state = state
        }
    }

    mutating func setComparisnWiningIndex(winingIndex: Int) {
        dataPoints[winingIndex].state = .comparisnWiningIndex
    }

    mutating func markAllDataPointsWithState(_ state: DataPointState) {
        for i in 0..<dataPoints.count {
            dataPoints[i].state = state
        }
    }
}
