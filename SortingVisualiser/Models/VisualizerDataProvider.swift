//
//  VisualizerDataProvider.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 7/4/21.
//

import UIKit

class VisualizerDataProvider {
    private(set) var data: [DataPoint] = .init()

    func prepareIntialData(
        for collectionView: UICollectionView,
        barWidth: CGFloat,
        spacing: CGFloat
    ) {
        data.removeAll()

        let width = collectionView.bounds.width
        let height = collectionView.bounds.height

        let barCount = Int(floor((width + spacing) / (barWidth + spacing)))
        let initialBarHeight: CGFloat = 200
        let finalBarHeight: CGFloat = height - 100
        let delta = abs(finalBarHeight - initialBarHeight)
        let stepHeight = delta / CGFloat(barCount)

        var currentBarHeight = initialBarHeight
        for _ in 0..<barCount {
            let dataPoint = DataPoint(height: Int(currentBarHeight), state: .nutral)
            data.append(dataPoint)
            currentBarHeight += stepHeight
        }
    }

    func shuffle() {
        data.shuffle()
    }
}
