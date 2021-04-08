//
//  DataPoint+UIProperties.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 8/4/21.
//

import UIKit

extension DataPoint {
    var color: UIColor {
        switch state {
        case .nutral: return .orange
        case .leftComparingIndex: return .purple
        case .rightComparingIndex: return .purple
        case .comparisnWiningIndex: return .red
        case .final: return .green
        }
    }
}
