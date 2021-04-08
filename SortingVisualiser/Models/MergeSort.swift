//
//  MergeSort.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 8/4/21.
//

import UIKit

struct MergeSort: SortingDataProvider {
    var algorithmName: String { "Merge Sort" }

    var dataPoints: [DataPoint] = []

    private var states: [[DataPoint]] = []

    mutating func merge(l: Int, m: Int, r: Int) {
        let n1 = m - l + 1
        let n2 = r - m

        // Create temp arrays
        var L: [DataPoint] = []
        var R: [DataPoint] = []

        // Copy data to temp array L[] and R[]
        for i in 0..<n1 {
            L.append(dataPoints[l + i])
        }
        for j in 0..<n2 {
            R.append(dataPoints[m + 1 + j])
        }

        // Merge the temp arrays back into dataPoints[l..r]
        // Initial index of first subarray
        var i = 0
        // Initial index of second subarray
        var j = 0
        // Initial index of merged subarray
        var k = l

        // hide data points
        markAllDataPointsBetween(l: l, r: r, with: .black)
        states.append(dataPoints)

        while i < n1 && j < n2 {
            if L[i].height <= R[j].height {
                dataPoints[k] = DataPoint(height: L[i].height)
                dataPoints[k].color = .red
                i += 1
            } else {
                dataPoints[k] = DataPoint(height: R[j].height)
                dataPoints[k].color = .purple
                j += 1
            }

            states.append(dataPoints)

            k += 1
        }

        // Copy the remaining elements of
        // L[], if there are any
        while i < n1 {
            dataPoints[k] = DataPoint(height: L[i].height)

            dataPoints[k].color = .red
            states.append(dataPoints)

            i += 1
            k += 1
        }

        // Copy the remaining elements of
        // R[], if there are any
        while j < n2 {
            dataPoints[k] = DataPoint(height: R[j].height)

            dataPoints[k].color = .purple
            states.append(dataPoints)

            j += 1
            k += 1
        }

        // mark data points temporary to green
        markAllDataPointsBetween(l: l, r: r, with: .green)
        states.append(dataPoints)

        // mark data points temporary to green
        markAllDataPointsBetween(l: l, r: r, with: .orange)
        states.append(dataPoints)
    }

    mutating func mergeSort(l: Int, r: Int) {
        if l >= r {
            return
        }
        
        let m = l + (r - l) / 2
        mergeSort(l: l, r: m)
        mergeSort(l: m + 1, r: r)
        merge(l: l, m: m, r: r)
    }

    mutating func getIntermediateSortingSteps() -> [[DataPoint]] {
        states.removeAll()
        mergeSort(l: 0, r: dataPoints.count - 1)

        markAllDataPointsBetween(l: 0, r: dataPoints.count - 1, with: .green)
        states.append(dataPoints)

        return states
    }

    private mutating func markAllDataPointsBetween(l: Int, r: Int, with color: UIColor) {
        for i in l...r {
            dataPoints[i].color = color
        }
    }
}
