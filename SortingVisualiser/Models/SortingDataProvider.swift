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
            let dataPoint = DataPoint(height: currentBarHeight)
            dataPoints.append(dataPoint)
            currentBarHeight += stepHeight
        }
    }

    mutating func shuffle() {
        resetAllDataPointsColor()
        dataPoints.shuffle()
    }

    mutating func resetAllDataPointsColor() {
        for i in 0..<dataPoints.count {
            dataPoints[i].color = .orange
        }
    }
}
