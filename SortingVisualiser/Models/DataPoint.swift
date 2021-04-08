//
//  Data.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 7/4/21.
//

import UIKit

enum DataPointState {
    case nutral, comparing, final
}

struct DataPoint: Hashable {
    let identifier: String = UUID().uuidString
    let height: Int
    var state: DataPointState
}
