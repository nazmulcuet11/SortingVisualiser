//
//  SortingAlgorithm.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 7/4/21.
//

import Foundation

protocol SortingAlgorithm {
    var name: String { get }
    func getIntermediateSortingSteps(data: [DataPoint]) -> [[DataPoint]]
}
