//
//  Data.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 7/4/21.
//

import UIKit

struct DataPoint: Hashable {
    let identifier: String = UUID().uuidString
    let height: Double
    var color: UIColor = .orange
}
