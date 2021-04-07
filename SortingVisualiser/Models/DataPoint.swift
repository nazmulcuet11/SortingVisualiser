//
//  Data.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 7/4/21.
//

import Foundation

struct DataPoint: Hashable {
    let identifier: String = UUID().uuidString
    let height: Int
}
